#include <stdio.h>
#include <stdlib.h>
#define MAX 20
int writeFile(FILE* rFile, char* wFileName, int nb){
    if(rFile==NULL)return -1;
    FILE* wFile=fopen(wFileName,"w");
    char str[MAX];
    int i=0;
    for(;i<nb;i++){
        if(fgets(str,MAX,rFile)==NULL)break;
        fputs(str,wFile);
    }
    fclose(wFile);
    if(i<nb)return (nb-i);
    return 0;
}

int main(int argc, char** argv){
        if(argc!=3){
            printf("PLease enter input and output files names!\n");
            return -1;
        }
        FILE* a=fopen(argv[1],"r");
        int r=writeFile(a,argv[2],30);
        fclose(a);
	printf("return value : %d\n",r);
	return 0;
}
