#include <stdio.h>
#include <stdlib.h>

#include "common.h"

typedef int (*ExchangeMethod)(char);

#define MARKTWO '1'
#define MARKINSERT '2'

char buffer[16];
int numChars = 6;

int mark = -1;
int mark2 = -1;

void clearStdinBuf() {
    int c;
    while((c = getchar()) != '\n' && c != EOF);
}


// compare the buffer with dictionary
int compare() {
    return 1;
}

// clear inout status
int clearInput() {
    mark = -1;
    mark2 = -1;

    return 1;
}

// echange the char between first and second chars
int exchange(int first, int second) {
    if(0 > first || 0 > second || numChars <= first || numChars <= second) {
	return 0; // fail to exchange
    }

    char tmp = buffer[first];
    buffer[first] = buffer[second];
    buffer[second] = tmp;

    return 1; // succeed
}

// mark the two chars to be exchanged
int markTwo(char input) {
     int tmpMark = input - '0';
     if(-1 != mark && tmpMark == mark) { // if same, cancel first mark
	 clearInput();
	 return 0;
     }

     if(-1 == mark) { // first char from unmark to mark
	 mark = tmpMark;
	 return 0;
     }
     // second
     mark2 = tmpMark;
     	    
     int ret = exchange(mark, mark2);
     clearInput();
     if(0 == ret) {
	 INFO("Invalid input for exchanging\n");
     }
    
    return 0;
}

// mark one char, then insert to the position before the numeric input
int markInsert(char input) {
    int tmpMark = input - '0';
    if(-1 != mark && tmpMark == mark) { // if same, cancel first mark
	clearInput();
	return 0;
    } 

    if(-1 == mark) {
	mark = tmpMark;
	return 0;
    }

    mark2 = tmpMark;
    char tmp;
    int i;
    if(mark < mark2) {
	for (i = mark; i < mark2 - 1; i++) {
	    //tmp = buffer[i];
	    //buffer[i] = buffer[i + 1];
	    //buffer[i + 1] = buffer[i];
	    exchange(i, i + 1);
	}
    } else {
	for (i = mark; i > mark2; i--) {
	    //tmp = buffer[i];
	    //buffer[i] = buffer[i - 1];
	    //buffer[i - 1] = tmp;
	    exchange(i, i - 1);
	}
    }
    
    clearInput();
    return 0;
}

ExchangeMethod exchangeFunc = markTwo;

int chooseExchangeMethod(int method) {

    clearInput();
    char cmdBuf[16];

    printf("Select the method:\n");
    printf("1 to markTwo\n");
    printf("2 to markInsert\n");
    
    fgets(cmdBuf, 2, stdin);
    clearStdinBuf();

    if(0 == strlen(cmdBuf)) {
	INFO("No input\n");
	return -1;
    }

    char cmd = (char)cmdBuf[0];
    printf("Choose %c\n", cmd);
    if('1' > cmd || '9' < cmd) {
	INFO("%c unsupported\n", cmd);
	return -1;
    }
    
    switch (cmd) {
    case MARKTWO:
	exchangeFunc = &markTwo;
	break;
    case MARKINSERT:
	exchangeFunc = &markInsert;
	break;
    default:
	exchangeFunc = &markTwo;
	return -1;
    }

    return 0;
}

int rearrange(char* str, int n) {
    //printf("This is a line need to be erased\n");
    //printf("This is the second line");
	//printf("%c[2K", 27);
	//printf("\r                                        \r");
	//printf("After overwritting\n");	
	//printf("%s\n",str);	

    char cmd = -1;
    int intCmd = -1;
    char cmdBuf[16];

    if(7 < n || 3 > n) {
	ERROR("Invalid string length\n");
    }

    memset(buffer, 0, sizeof(buffer));
    strncpy(buffer, str, n);
    
    while (1) {

	if(-1 == mark) {
	    printf("\n");
	    printf("Input the index of the char you want to exchange\n");
	    fwrite(buffer, sizeof(char), n, stdout);
	    printf("\nOr choose option:\n");
	    printf("x to exit the program\n");
	    printf("m to choose exchange method\n");
	    printf("c to compare the string with list\n");
	}
	
	fgets(cmdBuf, 2 ,stdin);
	clearStdinBuf();
	if(0 == strlen(cmdBuf)) {
	    ERROR("Internal error, read an invalid char from input\n");
	}

	cmd = (char)cmdBuf[0];
	printf("Input: %c\n", cmd);
	if('0' <= cmd && '9' >= cmd) {
	    exchangeFunc(cmd);
	    continue;
	}

	switch (cmd) {
	case 'c': /*commit to compare*/
	    compare();
	    break;
	case 'e': /*exit*/
	    return 1;
	    break;
	case '\n':
	    printf("newline");
	    break;
	case 'm': /*choose exchange method*/
	    chooseExchangeMethod(0);
	    break;
	case 'x': /*exit*/
	    return 0;
	    break;
	}

    }


    return 0;
}


int main(int argc, char** argv) {
	if(argc < 2) {
		ERROR("Input format: ./rearrange {WORD}\n");	
	}	

	char *str = argv[1];
	int n = strlen(str) - 1;
	n++;

	rearrange(str,n);	

	return 0;
}


