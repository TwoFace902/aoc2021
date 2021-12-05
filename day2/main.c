#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdbool.h>

int main(void) {
  int x = 0;
  int y = 0;
  int aim = 0;
  char sneed[100];
  char* chuck;
  char* dist;
  FILE* fp;
  fp = fopen("input.txt","r");
  while(!feof(fp)){
    fgets(sneed,100,fp);
    chuck = strtok(sneed," ");
    dist = strtok(NULL," ");
    if(strcmp(chuck,"forward") == 0){
      x += atoi(dist);
      y += atoi(dist) * aim;
    } else if (strcmp(chuck,"up") == 0){
      aim += atoi(dist);
    } else if (strcmp(chuck,"down") == 0){
      aim -= atoi(dist);
    }
  }
  printf("Final solution: %d",x * -y);
}