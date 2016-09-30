#include <stdio.h>

#include "ast.h"

int 
main(int argc, char *argv[])
{
	printf("Hello SCC\n");
	
	ASTNode *node = create_ast_node(AST_TYPE_STRING_LITERAL);
	destroy_ast_node(node);
	
	return 0;
}
