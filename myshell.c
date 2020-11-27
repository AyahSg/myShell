//
// Created by Ayah on 24/11/2020.
//

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <errno.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <signal.h>

void sigintOff(){
    struct sigaction sa;
    sa.sa_handler = SIG_IGN;
    sa.sa_flags = SA_RESTART;
    if (sigaction(SIGINT, &sa, NULL) == -1){
        perror("sigintOff");
    }

}
void sigintOn(){
    struct sigaction sa;
    sa.sa_handler = SIG_DFL;
    sa.sa_flags = SA_RESTART;
    if (sigaction(SIGINT, &sa, NULL) == -1){
        perror("sigintOn");
    }
}
//reaping zombie processes
void handle_sigchld(int sig) {
    int saved_errno = errno;
    while (waitpid((pid_t)(-1), 0, WNOHANG) > 0) {}
    if (errno != ECHILD || EINTR) errno = saved_errno;
}

int isBackgroundCommand(int count, char **arglist) {
    if (strcmp(arglist[count-1], "&")==0) {
        return 1;
    }
    return 0;
}

void handleBackground(int count, char **arglist) {

    int pid = fork();
    if (pid==-1){
        perror("Failed forking");
        exit(1);
    }
    if (pid==0){
        arglist[count-1]= NULL;
        execvp(arglist[0], arglist);
        char errorMsg[100];
        sprintf(errorMsg, "Failed executing normal command:%s", arglist[0]);
        perror(errorMsg);
        exit(1);
    }
    else {
    }

}

int isPipingCommand(int count, char **arglist) {
    for (int i=0; i<count; i++){
        if (strchr(arglist[i], '|') != NULL){
            return i;
        }
    }
    return 0;
}

void handlePiping(char **arglist, int index) {
    arglist[index]= NULL; //this will be the last entry in the first arglist

    int pipefds[2];
    if (pipe(pipefds) == -1) {
        perror("Failed creating pipe");
        exit(1);
    }

    int readerfd = pipefds[0];
    int writerfd = pipefds[1];

    int pid = fork();
    if (pid == -1) {
        perror("Failed forking");
        close(readerfd);
        close(writerfd);
        exit(1);
    } else if (pid == 0) {
        close(readerfd); // close read side
        while (dup2(writerfd, STDOUT_FILENO)==-1){ //redirect stdout into writer end of the pipe
            if (errno==EINTR){continue;}
            else{
                perror("dup2 error");
                exit(1);
            }
        }
        close(writerfd);
        sigintOn();
        execvp(arglist[0],arglist);
        char errorMsg[100];
        sprintf(errorMsg, "Failed executing first part of pipe command:%s", arglist[0]);
        perror(errorMsg);
        exit(1);
    } else {
        int pid2 = fork();
        if (pid2 == -1) {
            perror("Failed forking");
            close(readerfd);
            close(writerfd);
            exit(1);
        } else if (pid2 ==0){
            //second child to perform second half of the pipe
            close(writerfd);
            while (dup2(readerfd, STDIN_FILENO)==-1){ //redirect STDIN into reader end of the pipe
                if (errno==EINTR){continue;}
                else{
                    perror("dup2 error");
                    exit(1);
                }
            }
            close(readerfd);
            sigintOn();
            execvp(arglist[index+1], arglist+index+1);
            char errorMsg[100];
            sprintf(errorMsg, "Failed executing second part of pipe command:%s", arglist[index+1]);
            perror(errorMsg);
            exit(1);
        } else{
            //parent of process pid as well as pid2, should wait for both children
            close(readerfd);
            close(writerfd);
            waitpid(pid, NULL, WUNTRACED);
            waitpid(pid2, NULL, WUNTRACED);
        }
    }

}

void handleNormalCommand(char **arglist) {
    int pid = fork();
    if (pid==-1){
        perror("Failed forking");
        exit(1);
    }
    if (pid==0){
        sigintOn();
        execvp(arglist[0], arglist);
        char errorMsg[100];
        sprintf(errorMsg, "Failed executing normal command:%s", arglist[0]);
        perror(errorMsg);
        exit(1);
    }
    else {
        waitpid(pid,NULL,WUNTRACED);
    }

}

int process_arglist(int count, char **arglist) {
    int index;
    if (isBackgroundCommand(count, arglist)) {
        handleBackground(count,arglist);
    }
    else if ((index=isPipingCommand(count, arglist)) != 0){
        handlePiping(arglist, index);
    }
    else {
        handleNormalCommand(arglist);
    }
    return 1;

}

int prepare(void){
    sigintOff();
    struct sigaction zombieSA;
    zombieSA.sa_handler = &handle_sigchld;
    zombieSA.sa_flags = SA_RESTART;
    if ((sigaction(SIGCHLD, &zombieSA, NULL)) ==-1){
        perror("sigaction of sigchild");
        exit(1);
    }
    return 0;
}

int finalize(void){
    return 0;
}