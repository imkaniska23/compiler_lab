/* This program takes input from "wordlist.txt" and reverses and displays the longest word */
%{
  #include<stdio.h>
  char word[100];
  int length=0;
%}

%%
[a-zA-Z]+ {
  if(yyleng>length)
  {
    length=yyleng;
    strcpy(word,yytext);
  }
}
%%
int main()
{
  yyin=fopen("wordlist.txt","r");
  yylex();
  int i=0,j=0;
  char ans[length];
  for(i=length-1,j=0;i>=0;i--,j++)
  {
    ans[j]=word[i];
  }
  for(i=0;i<length;i++)
  {
    printf("%c",ans[i]);
  }
  printf("\n");
}
