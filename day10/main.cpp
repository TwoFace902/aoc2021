#include <iostream>
#include <stack>
#include <queue>
#include <map>
#include <stdio.h>
#include <cstring>
#include <vector>
#include <algorithm>

int main() {
    FILE* fp = std::fopen("input.txt","r");
    std::stack<char> stack;
    char start [] = {'[','(','{','<'};
    char stop [] = {']',')','}','>'};
    std::vector<uint64_t> vector;
    std::map<char,int> chad;
    chad['('] = 1;
    chad['['] = 2;
    chad['{'] = 3;
    chad['<'] = 4;
    char n[100];
    uint64_t sum = 0;
    bool incomp;
    bool did;
    bool end;
    int index = 0;
    int sortdex = 0;
    while(!feof(fp)){
        incomp = false;
        index++;
        std::fgets(n,10000,fp);
        for(int i = 0; i < std::strlen(n)-1; i++){
            did = false;
            for(int j = 0; j < 4; j++){
                if(n[i] == start[j]){
                    stack.push(start[j]);
                    did = true;
                }
            }
            if(!did){
                for(int j = 0; j < 4; j++){
                    if(n[i] == stop[j]){
                        if(stack.top() == start[j]){
                            stack.pop();
                            did = true;
                        }
                    }
                }
            }
            if(!did){
                incomp = true;
                break;
            }
        }
        while(stack.size() > 0){
            if(!incomp){
                sum *= 5;
                sum += chad[stack.top()];
            }
            stack.pop();
        }
        if(!incomp){
            vector.push_back(sum);
        }
        sum = 0;
    }
    std::sort(vector.begin(),vector.end());
    std::cout << vector.size() << std::endl;
    std::cout << vector.at(vector.size()/2) << std::endl;
        return 0;
}
