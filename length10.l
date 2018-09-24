/* This program counts the number of words having length greater than 10 in "length10.txt" file.
Here, "word" refers to a continuous string of small and capital letters. */
%{
	#include<stdio.h>
	#include<string.h>
	int count=0;
%}

%%
[a-zA-Z]+ {
	if(yyleng>10)
		count++;
}
%%
int yywrap(){}
int main()
{
	yyin=fopen("length10.txt","r");
	yylex();
	printf("No. of words having length greater than 10 = %d\n",count);
	return 0;
}
