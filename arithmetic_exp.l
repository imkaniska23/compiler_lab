/* Program to identify valid arithmetic expressions and print identifiers and operators */
%{
  #include<stdio.h>
  int opc=0,idc=0,obc=0,cbc=0;
%}
op [+\-\/\*]
id [a-zA-Z0-9]+
%%
{op} {
  printf("%s is an operator\n",yytext);
  opc++;}
{id} {
  printf("%s is an identifier\n",yytext);
  idc++;
}
"(" {
  if(obc<cbc)
  obc++;
}
")" {
  cbc++;
}
"\n" {
  if(cbc==obc && idc==opc+1)
  printf("Valid expression\n");
  else
  printf("Invalid expression\n");
  cbc=0;
  obc=0;
  idc=0;
  opc=0;
}
%%
int main()
{
  yylex();
  return 0;
}
