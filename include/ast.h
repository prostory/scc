#ifndef AST_H_
#define AST_H_

typedef enum {
	AST_TYPE_STRING_LITERAL = 0,
	AST_TYPE_NUMBER_LITERAL,
} ASTNodeType;

typedef struct ASTNode
{
	ASTNodeType type;
} ASTNode;

extern ASTNode *create_ast_node(ASTNodeType type);
extern void destroy_ast_node(ASTNode *node);

#endif
