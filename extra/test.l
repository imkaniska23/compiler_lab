%{
	#include<stdio.h>
	int i;
%}


%%

. {
	for(i = 0; i < yyleng; i++)
	{
		if((yytext[i] >= 65 && yytext[i] <= 90) || (yytext[i] >= 97 && yytext[i] <= 122) || (yytext[i] >= 48 && yytext[i] <= 57))
		{
			printf("%c",yytext[i]);
		}
		else if(yytext[i] == 32)
		{
			printf(" ");
		}
	}
}

%%



int main()
{
	yylex();
	return 0;
}