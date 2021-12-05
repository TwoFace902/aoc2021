#include <iostream>
#include <fstream>
#include <string>
#include <vector>

int main() {
    std::ifstream file;
    file.open("input.txt");
    if(!file.is_open()){
        std::cout << "damn bitch"<< std::endl;
        return -1;
    }
    std::string gamma = "";
    std::string epsilon = "";
    std::string boi;
    std::vector<std::string> trashcan;
    while(file){
        std::getline(file,boi);
        trashcan.push_back(boi);
    }
    trashcan.erase(trashcan.end());
    for(int i = 0; i < trashcan.begin()->size(); i++){
        int zeroCount = 0;
        int oneCount = 0;
        for(std::string str : trashcan){
            if(str.at(i) == '0'){
                zeroCount++;
            } else {
                oneCount++;
            }
        }
        if(oneCount >= zeroCount){
            gamma.push_back('1');
        } else {
            gamma.push_back('0');
        }
    }
    for(int i = 0; i < gamma.size(); i++){
        if(gamma.at(i) == '1'){
            epsilon.push_back('0');
        } else {
            epsilon.push_back('1');
        }
    }
    int g = std::stoi(gamma,nullptr,2);
    int e = std::stoi(epsilon,nullptr,2);
    std::cout << "power consoomer: ";
    std::cout << g * e << std::endl;
    std::vector<std::string> oxyClean;
    std::vector<std::string> dioxClean;
    if(gamma.at(0) == '1'){
        for(std::string str : trashcan){
            if(str.at(0) == '1'){
                oxyClean.push_back(str.substr(0));
            } else {
                dioxClean.push_back(str.substr(0));
            }
        }
    } else {
        for(std::string str : trashcan){
            if(str.at(0) == '0'){
                oxyClean.push_back(str.substr(0));
            } else {
                dioxClean.push_back(str.substr(0));
            }
        }
    }

    for(int i = 1; i < oxyClean.begin()->size(); i++){
        int zC = 0;
        int oC = 0;
        for(std::string str : oxyClean){
            if(str.at(i) == '0'){
                zC++;
            } else {
                oC++;
            }
        }

        if(oC >= zC){
            auto temp = oxyClean.begin();
            while(temp != oxyClean.end()){
                if(temp->at(i) == '0'){
                    oxyClean.erase(temp);
                } else
                    temp++;
            }
        } else {
            auto temp = oxyClean.begin();
            while(temp != oxyClean.end()){
                if(temp->at(i) == '1'){
                    oxyClean.erase(temp);
                } else
                    temp++;
            }
        }
        if(oxyClean.size() == 1){
            break;
        }
    }
    int oxygen;
    for(std::string str : oxyClean){
        oxygen = std::stoi(str,nullptr,2);
    }

    for(int i = 1; i < dioxClean.begin()->size(); i++){
        int zC = 0;
        int oC = 0;
        for(std::string str : dioxClean){
            if(str.at(i) == '0'){
                zC++;
            } else {
                oC++;
            }
        }

        if(oC < zC){
            auto temp = dioxClean.begin();
            while(temp != dioxClean.end()){
                if(temp->at(i) == '0'){
                    dioxClean.erase(temp);
                } else
                    temp++;
            }
        } else {
            auto temp = dioxClean.begin();
            while(temp != dioxClean.end()){
                if(temp->at(i) == '1'){
                    dioxClean.erase(temp);
                } else
                    temp++;
            }
        }
        if(dioxClean.size() == 1){
            break;
        }
    }
    int diox;
    for(std::string str : dioxClean){
        diox = std::stoi(str,nullptr,2);
    }
    std::cout << "scrubber: ";
    std::cout << oxygen * diox << std::endl;
}
