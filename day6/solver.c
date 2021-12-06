#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <time.h>

#define DIM 9
#define DAYS 256
#define TEXT "sinput.txt"

unsigned long long** matinit(int m);
unsigned long long** matrixPow(unsigned long long** ogMatrix,int pow);
void matcpy(unsigned long long** dest, unsigned long long** src, int m);
void matmul(unsigned long long*** dest, unsigned long long** a, unsigned long long** b, int m);

int main(void) {
  clock_t start, end;
  double cpu_used;
  
  //Input from file
  FILE* fp;
  fp = fopen(TEXT,"r");
  int* chuck = calloc(500,sizeof(int));
  int size = 0;
  while(!feof(fp)){
    chuck[size] = getc(fp) - 48;
    getc(fp);
    size = size + 1;
  }
  start = clock();
  //Get distributions
  int* sneed = calloc(DIM,sizeof(int));
  for(int i = 0; i < size; i++){
    sneed[chuck[i]]++;
  }
  unsigned long long** feed = matinit(DIM);
  for(int i = 1; i < DIM; i++){
    feed[i-1][i] = 1;
  }
  feed[6][0] = 1;
  feed[8][0] = 1;
  feed = matrixPow(feed, DAYS);
  unsigned long long sum;
  unsigned long long* chadley = calloc(DIM,sizeof(unsigned long long));
  for(int i = 0; i < DIM; i++){
    sum = 0;
    for(int j = 0; j < DIM; j++){
      sum += feed[j][i] * sneed[i]; 
    }
    chadley[i] = sum;
  }
  unsigned long long val = 0;
  for(int i = 0; i < DIM; i++){
    val += chadley[i];
  }
  end = clock();
  cpu_used = ((double) (end - start)) / CLOCKS_PER_SEC;
  printf("Fish after %d days: %llu\n",DAYS,val);
  printf("Timer: %f seconds\n",cpu_used);
  return 0;
}


unsigned long long** matrixPow(unsigned long long** ogMatrix, int p){
  unsigned long long** feed = matinit(DIM);
  matcpy(feed,ogMatrix,DIM);

  unsigned long long** fuck = matinit(DIM);
  for(int i = 0; i < DIM; i++){
    fuck[i][i] = 1;
  }
  
  while(p != 0){
    int currDig = p & 1;
    p = p >> 1;
    if(currDig){
      matmul(&fuck,fuck,feed,DIM);
    }
    matmul(&feed,feed,feed,DIM);
  }
  
  return fuck;
}

void matcpy(unsigned long long** dest, unsigned long long** src, int m){
  for(int i = 0; i < m; i++){
    for(int j = 0; j < m; j++){
      dest[i][j] = src[i][j];
    }
  }
}

void matmul(unsigned long long*** dest, unsigned long long** a, unsigned long long** b, int m){
  unsigned long long sum;
  unsigned long long** temp = matinit(DIM);
  for(int i = 0; i < m; i++){
    for(int j = 0; j < m; j++){
      sum = 0;
      for(int s = 0; s < m; s++){
        sum += a[i][s] * b[s][j];
      }
      temp[i][j] = sum;
    }
  }
  *dest = temp; 
}

unsigned long long** matinit(int m){
  unsigned long long* seed = calloc(m*m,sizeof(unsigned long long));
  unsigned long long** feed = malloc(m*sizeof(unsigned long long*));
  for(int i = 0; i < m; i++){
    feed[i] = seed + i * m;
  }
  return feed;
}