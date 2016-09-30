#include "ast.h"

#include <stdio.h>
#include <stdlib.h>
#include <assert.h>

ASTNode *
create_ast_node(ASTNodeType type)
{
	printf("create ast node: %d\n", type);
	ASTNode *node = (ASTNode *)malloc(sizeof(ASTNode));
	assert(node != NULL);
	node-> type = type;
	
	return node;
}

void 
destroy_ast_node(ASTNode *node)
{
	if (node != NULL) {
		printf("destroy ast node: %d\n", node->type);
		free(node);
	}
}
