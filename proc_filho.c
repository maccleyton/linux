#include <stdio.h>
#include <unistd.h>

void main (int argc, char **argv, char* envp[]) {
    printf("Iniciando o código do processo filho.\n");
    printf("Processo filho em execução, meu PID é %d e meu pai tem PID = %d.\n", getpid(), getppid());
    while (1) { // O processo pai continua
        usleep(1000000); // Espera 1 segundo
    }
}