#include <stdio.h>
#include <unistd.h>

void main (int argc, char **argv, char* envp[]) {
    int pid;

    pid = fork(); // Cria um novo processo
    if (pid != 0) { // Se o PID retornado for diferente de 0, estamos no processo pai
        printf("Processo pai em execução, meu PID é %d e meu filho tem PID = %d.\n", getpid(), pid);
        while (1) // O processo pai continua
            usleep(1000000); // Espera 1 segundo
    } else { // Se o PID retornado for 0, estamos no processo filho
        printf("Carregando código do processo filho.\n");
        execve("proc_filho", argv, envp); // Troca o código pelo do processo filho
    }
}