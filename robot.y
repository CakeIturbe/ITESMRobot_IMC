%{
#include <stdio.h>
int yylex();
void yyerror(const char *s);
%}

%union {
 char *sval;
 }

%token <sval> T M DEG BA P R D I AND
%type <sval> sentence cmmnd extend


%%

input: sentence	
 ;
sentence: R P cmmnd	
 ;
cmmnd: M I BA extend 		{printf("MOV,%s\n",$2);}	
	| T D DEG extend        {printf("TURN,%s\n",$2);}
 ; 
extend: AND cmmnd 
	|   
 ;
 
%%
 

