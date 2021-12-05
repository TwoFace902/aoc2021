#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdbool.h>

#define bingosize 5
int** getBoard(FILE* fp);
bool** createBoolBoard();
void updateShit(int inputNum, int** board, bool** bboard);
int checkForWin(int winNum, int** board, bool** bboard);
bool checkRows(int** board, bool** bboard);
bool checkCols(int** board, bool** bboard);

int main(void) {
  FILE* fp;
  fp = fopen("input.txt","r");
  char sneed[1000];
  fgets(sneed,1000,fp);
  char* chuck;
  int numOrder[1000];
  for(int i = 0; i < 1000; i++){
    numOrder[i] = -1;
  }
  chuck = strtok(sneed,",");
  char formerly[1000][1000];
  
  int index = 0;
  while(chuck != NULL){
    strcpy(formerly[index],chuck);
    index++;
    chuck = strtok(NULL,",");
  }
  index = 0;
  while(strcmp(formerly[index],"") != 0){
    numOrder[index] = atoi(formerly[index]);
    index++;
  }
  int*** boardArr = malloc(1000*sizeof(int**));
  fgets(sneed,100,fp);
  index = 0;
  int boardCount = 0;
  while(!feof(fp)){
    boardArr[index] = getBoard(fp);
    boardCount++;
    index++;
  }
  printf("%d\n\n",boardCount);
  bool*** boolBoardArr = malloc(boardCount*sizeof(bool**));
  for(int i = 0; i < boardCount; i++){
    boolBoardArr[i] = createBoolBoard();
  }
  index = 0;
  int weinernumber = 0;
  int winnercount = 0;
  while(numOrder[index] != -1){
    for(int i = 0; i < boardCount; i++){
      updateShit(numOrder[index],boardArr[i], boolBoardArr[i]);
      weinernumber = checkForWin(numOrder[index],boardArr[i], boolBoardArr[i]);
      if(weinernumber != -1){
        winnercount++;
      }
      if(winnercount == boardCount){
        break;
      }
    }
    if(winnercount == boardCount){
      break;
    }
    index++;
  }
  printf("%d\n",weinernumber);
  return 0;
}

bool** createBoolBoard(){
  bool* mother = calloc(bingosize*bingosize,sizeof(bool));
  for(int i = 0; i < bingosize*bingosize; i++){
    mother[i] = false;
  }
  bool** fucker = malloc(bingosize*sizeof(bool*));
  for(int i = 0; i < bingosize; i++){
      fucker[i] = mother + i * bingosize;
  }
  return fucker;
}

int** getBoard(FILE* fp){
  int* mother = calloc(bingosize*bingosize, sizeof(int));
  int** fucker = malloc(bingosize*sizeof(int*));
  int index = 0;
  char sneed[100];
  char* chuck;
  char formerly[100][100];
  fgets(sneed,100,fp);
  chuck = strtok(sneed," ");
  for(int i = 0; i < bingosize; i++){
    while( chuck != NULL){
      strcpy(formerly[index],chuck);
      index++;
      chuck = strtok(NULL, " ");
    }
    fgets(sneed,100,fp);
    chuck = strtok(sneed," ");
  }
  index = 0;
  while(strcmp(formerly[index],"") != 0){
      mother[index] = atoi(formerly[index]);
      index++;
  }
  for(int i = 0; i < bingosize; i++){
      fucker[i] = mother + i * bingosize;
  }
  return fucker;
}

void updateShit(int inputNum,int** board, bool** bboard){
  for(int i = 0; i < bingosize; i++){
    for(int j = 0; j < bingosize; j++){
      if(inputNum == board[i][j]){
        bboard[i][j] = true;
      }
    }
  }
}

int checkForWin(int winNum, int** board, bool** bBoard){
  if(board[0][0] == -1){
    return -1;
  }
  if(checkRows(board, bBoard) || checkCols(board, bBoard)){
    int numGot = 0;
    for(int i = 0; i < bingosize; i++){
      for(int j = 0; j < bingosize; j++){
        if(bBoard[i][j] == false){
          numGot += board[i][j];
        }
      }
    }
    numGot *= winNum;
    board[0][0] = -1;
    return numGot;
  }
  return -1;
}

bool checkRows(int** board, bool** bboard){
  int count;
  for(int i = 0; i < bingosize; i++){
      count = 0;
      for(int j = 0; j < bingosize; j++){
        if(bboard[i][j] == true){
          count++;
        }
      }
      if(count == 5)
        return 1;
  }
  return 0;
}

bool checkCols(int** board, bool** bboard){
  int count;
  for(int i = 0; i < bingosize; i++){
      count = 0;
      for(int j = 0; j < bingosize; j++){
        if(bboard[j][i] == true){
          count++;
        }
      }
      if(count == 5)
        return 1;
  }
  return 0;
}