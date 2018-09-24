%{
int w = 0;
int l = 0;
int c = 0;
%}

%%




[a-zA-Z] {
	c++;
}


%%

int main()
{
	yylex();
	printf("%d %d %d\n", c, w, l);
	return 0;
}