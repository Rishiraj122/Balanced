%{
     #include <stdio.h>
     #include "y.tab.h"
     extern int yylval;
%}
    
%%
 


[a-zA-Z0-9] return CHAR;
[#<>;.]     return SYM;
[\n]        return NL;
[(]         return LP;
[)]         return RP;
[{]         return LB;
[}]         return RB;
.           return yytext[0];


%%

int yywrap() {
    return 1;
}