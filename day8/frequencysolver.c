#include stdio.h
#include stdlib.h
#include string.h
#include time.h

#define STRT 97
#define SIZE 7
#define NUMS 10
#define TEXT input.txt

void hardcoded(int dest);
void populateBitMap(int dest, char chuck, int r, int c);
int getFourDigit(int freqs, int values, char right);

void matfree(int mat, int r, int c);
int matinit(int r, int c);
void matprint(int mat, int r, int c);
int matsumcol(int mat, int r, int y);


int main(void) {
  clock_t start, end;
  double cpu_used;

  FILE fp;
  fp = fopen(TEXT,r);
  int values = malloc(NUMSsizeof(int));
  hardcoded(values);
  long sum = 0;
  int num;
  char left;
  char right;
  char chuck[100];
  start = clock();

  while(!feof(fp)){
    fgets(chuck,100,fp);
    left = strtok(chuck,);
    right = strtok(NULL, );
    int bitmap = matinit(NUMS,SIZE);
    populateBitMap(bitmap, left, NUMS, SIZE);

    int freqs = malloc(NUMSsizeof(int));
    for(int i = 0; i  SIZE; i++){
      freqs[i] = matsumcol(bitmap, NUMS, i);
    }
    num = getFourDigit(freqs, values, right);
    sum += num;
  }

  end = clock();
  cpu_used = ((double) (end - start))  CLOCKS_PER_SEC;
  printf(Answer %lun,sum);
  printf(Timer %f secondsn,cpu_used);
  return 0;
}

int getFourDigit(int freqs, int values, char right){
  int fnum = 0;
  int dig = 1000;
  char num = strtok(right, );
  while(num != NULL){
    int sum = 0;
    for(int i = 0; i  SIZE; i++){
      if(num[i]  STRT)
        break;
      sum += freqs[num[i]-STRT];
    }
    for(int i = 0; i  NUMS; i++){
      if(sum == values[i]){
        sum = i;
        break;
      }
    }
    fnum += sum  dig;
    dig = dig  10;
    num = strtok(NULL, );
  }
  return fnum;
}

void populateBitMap(int dest, char chuck, int r, int c){
  char sneed = strtok(chuck, );
  
  for(int i = 0; i  NUMS; i++){
    for(int j = 0; j  SIZE; j++){
      if(sneed[j] == '0')
        break;
      dest[i][sneed[j]-STRT] = 1;
    }
    sneed = strtok(NULL, );
  }
}

int matinit(int r, int c){
  int seed = calloc(rc,sizeof(int));
  int feed = malloc(rsizeof(int));

  for(int i = 0; i  r; i++){
    feed[i] = seed + i  c;
  }
  return feed;
}

void matprint(int mat, int r, int c){
  printf(n);
  for(int i = 0; i  r; i++){
    for(int j = 0; j  c; j++){
      printf(%d , mat[i][j]);
    }
    printf(n);
  }
  printf(n);
}

int matsumcol(int mat, int r, int y){
  int sum = 0;
  for(int i = 0; i  r; i++){
    sum += mat[i][y];
  }
  return sum;
}

void matfree(int mat, int r, int c){
  free(mat);
}

void hardcoded(int dest){
  dest[0] = 42;
  dest[1] = 17;
  dest[2] = 34;
  dest[3] = 39;
  dest[4] = 30;
  dest[5] = 37;
  dest[6] = 41;
  dest[7] = 25;
  dest[8] = 49;
  dest[9] = 45;
}