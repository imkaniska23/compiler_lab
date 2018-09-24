/* This program takes "comments.txt" as input, counts and removes the comment and stores the text without comments in "wcomments.txt". It displays number of comments in terminal.  */
%{
  #include<stdio.h>
  FILE *cm,*wcm;
  int mcount=0,scount=0;
%}

%%
"/*"([a-zA-Z0-9 ]*[\n]*)*"*/" {
  fprintf(wcm,"");
  mcount++;
}
"//".* {
  fprintf(wcm,"");
  scount++;
}
. {fprintf(wcm,"%s",yytext);}
%%
int main()
{
  cm=fopen("comments.txt","r");
  yyin=cm;
  wcm=fopen("wcomments.txt","w+");
  yyout=wcm;
  yylex();
  printf("No. of single line comments = %d\n No. of multiple line comments = %d\n",scount,mcount);
  return 0;
}
