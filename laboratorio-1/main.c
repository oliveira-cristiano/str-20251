#include <stdio.h>
#include <errno.h>
#include <stddef.h>
#include <pthread.h>

char listachar[30];

int indice = 0;
int flag1 = 1;
int flag2 = 0;
int flag3 = 0;
int a =0;
void *thread_code_a(void *threadno){ 
  while (indice <= 27){ 
    while(flag1 == 0); 
    listachar[indice] = 'a';
    indice++;
    flag2 = 1;
    flag1 = 0;
  }

  return NULL;
}

void *thread_code_b(void *threadno){ 
  while (indice <= 28){ 
    while(flag2 == 0); // Busy-Wait-Loop.
    listachar[indice] = 'b';
    indice++;
    flag3 = 1;
    flag2 = 0;
  }

  return NULL;
}

void *thread_code_c(void *threadno){ 
  while (indice <= 29){ 
    while(flag3 == 0); // Busy-Wait-Loop para sincronização de TA.
    listachar[indice] = 'c';
    indice++;
    flag1 = 1;
    flag3 = 0;
  }
  for (int i = 0; i < 30; i++) {
    printf("%c", listachar[i]);
  }
  return NULL;
}

int main(void) {
  pthread_t TA; 
  pthread_t TB;
  pthread_t TC;
  pthread_create(&TA, NULL, thread_code_a, NULL); 
  pthread_create(&TB, NULL, thread_code_b, NULL);
  pthread_create(&TC, NULL, thread_code_c, NULL);
  pthread_join(TA, NULL);
  pthread_join(TB, NULL);
  pthread_join(TC, NULL);
  
  return 0;
}