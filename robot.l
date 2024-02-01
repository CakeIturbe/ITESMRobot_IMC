%{
#include <stdio.h>
#include "y.tab.h"
%}
%%

turn	{ yylval.sval = strdup(yytext); return T; }
move	{ yylval.sval = strdup(yytext); return M; }
degrees { yylval.sval = strdup(yytext); return DEG; }
"blocks ahead" { yylval.sval = strdup(yytext); return BA; }
"and then" { yylval.sval = strdup(yytext); return AND; }
please|porfavor|plis|porfis	{ yylval.sval = strdup(yytext); return P; }
robot|Robot	{ yylval.sval = strdup(yytext); return R; }
"90"|"180"|"270"         { yylval.sval = strdup(yytext); return D; }
[0-9]+          { yylval.sval = strdup(yytext); return I; }
[ \t] ; 		
\n { return 0; };

%%

int main(int argc, char **argv) {
    FILE    *fd;

    if (argc == 2)
    {
        if (!(fd = fopen(argv[1], "r")))
        {
            perror("Error: ");
            return (-1);
        }

        yyin = fd;
        
        
        char ch;
    int lines = 0;
         // Counting the total number of lines in the file
        while ((ch = fgetc(fd)) != EOF) {
            if (ch == '\n') {
                lines++;
            }
        }
        
        fseek(fd, 0, SEEK_SET);
	for(int i=0;i<lines;i++)
	yyparse();
        

        fclose(fd);

        
    }
    else
        printf("Usage: a.out filename\n");
    return (0);
}



