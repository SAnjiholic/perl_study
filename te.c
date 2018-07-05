#include <stdio.h>


void _for(int flag){
        for(int a=0; a < 1; a++){printf("%d ,, its _for function\n" ,a);}
        if(flag != 0){flag --; _for(flag);}
}
void _while(int flag){
        int a=1;
        while(a){a--;printf("%d ,, its _while function\n",a);}
        if(flag != 0){flag --; _while(flag);}

}

int main(){
        int a=0;
        _while(3);
        _for(3);
}

