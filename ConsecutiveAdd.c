#include <stdio.h>

int consutiveAdd(int a, int b){
    int sum = 0;
    for (int i = a ; i <= b ; i++){
        sum = sum + i;
    }
    return sum;
}

int main(void){
    int A = 5;
    int B = 10;
    printf("%d",consutiveAdd(A,B));
    return 0;
}