/* This program takes "nkeywords.txt" as input and produces "Unkeywords.txt" as output, having non keywords in uppercase.  */
%{
  #include<stdio.h>
  FILE *nkw,*unkw;
%}
keywords if|else|return|while|break
%%
{keywords} {
  fprintf(unkw,"%s",yytext);
}
. {
  for(int i=0;i<yyleng;i++)
  {
    fprintf(unkw,"%c",toupper(yytext[i]));
  }
}
%%

int main()
{
  nkw=fopen("nkeywords.txt","r");
  unkw=fopen("Unkeywords.txt","w+");
  yyin=nkw;
  yyout=unkw;
  yylex();
  return 0;
}
