#include <stdio.h>
#include <stdlib.h>

#include "common.h"

typedef int (*ExchangeMethod)(int* mark, int cmd);

#define MARKTWO ((int)'1')
#define MARKINSERT ((int)'2')

static char buffer[16];
static int numChars = 7;

//int mark = -1;
//int mark2 = -1;

void clearStdinBuf() {
    int c;
    while((c = getchar()) != '\n' && c != EOF);
}


// compare the buffer with dictionary
int compare() {
    return 1;
}

/*
// clear inout status
void clearInput(int* mark) {
    *mark = -1;
}
*/

int getInput() {
    int cmd = -1;
    char cmdBuf[4];

    //clearInput();
    fgets(cmdBuf, 2, stdin);
    clearStdinBuf();
    /*
    if(0 == strlen(cmdBuf)) {
	INFO("No input\n");
	return -1;
    }
    */
    cmd = (int)cmdBuf[0];
    return cmd;
}

// echange the char between first and second chars
int exchange(int first, int second) {
    /*
    if(0 > first || 0 > second || numChars <= first || numChars <= second) {
	return 0; // fail to exchange
    }
    */
    char tmp = buffer[first];
    buffer[first] = buffer[second];
    buffer[second] = tmp;

    return 1; // succeed
}

// mark the two chars to be exchanged
int markTwo(int* mark, int input) {
     int tmpMark = input - '0';
     if(-1 != *mark && tmpMark == *mark) { // if same, cancel first mark
	 //clearInput(mark);
	 *mark = -1;
	 return 0;
     }

     if(-1 == *mark) { // first char from unmark to mark
	 *mark = tmpMark;
	 return 0;
     }
     	    
     int ret = exchange(*mark, tmpMark);
     //clearInput(mark);
     *mark = -1;

     if(0 == ret) {
	 INFO("Invalid input for exchanging\n");
     }
     
    return 0;
}

// int* is both the state flag and marked index
// mark one char, then insert to the position before the numeric input
int markInsert(int* mark, int input) {
    int tmpMark = input - '0';
    if(-1 != *mark && tmpMark == *mark) { // if same, cancel first mark
	//clearInput(mark);
	*mark = -1;
	return 0;
    } 

    if(-1 == *mark) {
	*mark = tmpMark;
	return 0;
    }

    int i;
    if(*mark < tmpMark) {
	for (i = *mark; i < tmpMark - 1; i++) {
	    exchange(i, i + 1);
	}
    } else {
	for (i = *mark; i > tmpMark; i--) {
	    exchange(i, i - 1);
	}
    }
    
    //clearInput(mark);
    *mark = -1;
    return 0;
}

ExchangeMethod exchangeFunc = markTwo;

int chooseExchangeMethod() {

    printf("Select the method:\n");
    printf("1 to markTwo\n");
    printf("2 to markInsert\n");
    
    int cmd = getInput();
    
    printf("Choose %c\n", (char)cmd);
    /*
    if('1' > cmd || '9' < cmd) {
	INFO("%c unsupported\n", (char)cmd);
	return -1;
    }
    */
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

int rearrange(int n) {
    //printf("This is a line need to be erased\n");
    //printf("This is the second line");
	//printf("%c[2K", 27);
	//printf("\r                                        \r");
	//printf("After overwritting\n");	
	//printf("%s\n",str);	

    int mark = -1;
    
    /*
      if(7 < n || 3 > n) {
      ERROR("Invalid string length\n");
      }
    */

    //memset(buffer, 0, sizeof(buffer));
    //strncpy(buffer, str, n);
    
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
	printf("\n");
	printf("\t\t%s\n", buffer);
	printf("\n");
/*
	fgets(cmdBuf, 2 ,stdin);
	clearStdinBuf();
	if(0 == strlen(cmdBuf)) {
	    ERROR("Internal error, read an invalid char from input\n");
	}
	*/

	int cmd = getInput();
	printf("Input: %c\n", (char)cmd);
	if('0' <= cmd && '9' >= cmd) {
	    exchangeFunc(&mark, cmd);
	    continue;
	}

	switch (cmd) {
	case (int)'c': /*commit to compare*/
	    compare();
	    break;
	case (int)'e': /*exit*/
	    return 1;
	    break;
	case (int)'\n':
	    printf("newline");
	    break;
	case (int)'m': /*choose exchange method*/
	    chooseExchangeMethod();
	    break;
	case (int)'x': /*exit*/
	    return 0;
	    break;
	default:
	    printf("Invalid input\n");
	}

    }


    return 0;
}


int main(int argc, char** argv) {
	if(argc < 2) {
		ERROR("Input format: ./rearrange {WORD}\n");	
	}	

	char *str = argv[1];
	int n = strlen(str);
	numChars = n;
	strncpy(buffer, str, n);

	rearrange(n);	

	return 0;
}








