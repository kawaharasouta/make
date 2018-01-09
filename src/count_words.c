#include<stdio.h>
#include<counter.h>
int main(int argc, char *argv[]){
	int counts[4];
	counter(counts);
	int i;
	for(i = 0; i < 4; i++){
		printf("%d ",counts[i]);
	}
	printf("\n");
	return 0;
}
