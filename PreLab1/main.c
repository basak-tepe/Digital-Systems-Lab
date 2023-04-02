#include <stdio.h>
#include <stdlib.h>
#include "string.h"

int main() {
    char line[10] = ""; //input line will be stored in here. we also consider the newline char.
    printf(">");

    char a[3];
    char b[3];
    char c[3];

    //start taking inputs
    while (fgets(line, sizeof(line), stdin)!= NULL) {

        strncpy(a, line, 2);
        a[2] = '\0';
        //printf("%s\n",a);


        strncpy(b, line+2, 2);
        b[2] = '\0';
        //printf("%s\n",b);

        c[0] = '0';
        c[1] = '0';
        c[2] = '\0';

        //binary conversion for a
        char *nextCharA;
        long int int_a = strtol(a, &nextCharA, 2);
        //printf("Binary string %s is equivalent to integer %ld\n", a, int_a);



        //binary conversion for b
        char *nextCharB;
        long int int_b = strtol(b, &nextCharB, 2);
        //printf("Binary string %s is equivalent to integer %ld\n", b, int_b);



        if(int_a<1 && int_b<3){ //c = 00
            c[0] = 0;
            c[1] = 0;
        }

        else if((int_a ^ int_b) < 2){ //c = 01
            c[0] = 0;
            c[1] = 1;
        }

        else if(int_a > int_b){ //c = 10
            c[0] = 1;
            c[1] = 0;
        }

        else{
            c[0] = 1;
            c[1] = 1;
        }

        printf("c is %d%d\n", c[0], c[1]);
        printf(">");

        continue;
    }
}

