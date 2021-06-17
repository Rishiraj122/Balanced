%{
    #include <stdio.h>
    int flag = 0;
%}

%token CHAR NL LB RB LP RP SYM

%{
int yylex();
void yyerror(const char *s);
%}

%%
Exp: S{
    printf("\n\nParentheses are balanced\n");
    return 0;
}
;

S: S LP S RP
 | S LB S RB
 | SEC
;

SEC: CHAR SEC
   | SYM SEC
   | NL SEC
   |
%%

int main() {
    extern FILE *yyin;
    yyin = fopen("Input.c", "r");

    yyparse();
    fclose(yyin);
    return 0;
}

void yyerror() {
    printf("\n\nParentheses are not balanced\n");
}