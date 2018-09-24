/* This program counts the number of palindromes in "palindrome.txt" file */
%{
  #include<stdio.h>
  int count =0;
%}

%%
[a-zA-Z]+ {
  int i=0,j=yyleng,check=1;
  for(i=0,j=yyleng-1;i<=j;i++,j--)
  {
    if(yytext[i]==yytext[j])
    continue;
    else
    {
      check=0;
      break;
    }
  }
  if(check==1)
  count++;
}
%%
int main()
{
  yyin=fopen("palindrome.txt","r");
  yylex();
  printf("No. of palindromes = %d\n",count);
  return 0;
}
