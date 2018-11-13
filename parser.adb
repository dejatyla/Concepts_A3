with boolean_expression; use boolean_expression;
with statement; use statement;
with Assignment_statement; use Assignment_statement;
with block; use block;
with while_statement; use while_statement;
with for_statement; use for_statement;
with print_statement; use print_statement;
with if_statement; use if_statement;
with arithmetic_expression; use arithmetic_expression;

package body parser is

   
   procedure parser(F: in filename)
   begin 
      lex = new lexicalAnalyzer(filename); //TODO
   end
     
   function parse(//TODO) return Program is
   begin 
        //TODO 
   end
   function getBlock(//TODO) return Block is
   begin 
      blk : Block; 
      tok: token;
      blk := new Block();
      tok := getLookaheadToken(); 
      while isValidStartOfStatement(tok) loop
         stmt: statement; 
         stmt:= getStatement();
         tok := getLookaheadToken();
      end loop
      return blk;
   end
     
   function getStatement(//TODO) return Statement is
     begin 
        stmt : Statement;
        tok: token;
        tok := getLookaheadToken();
        if tok.getTokType() == tokentype.if_tok then 
            stmt := getIfStatement();
        elsif tok.getTokType() == tokentype.while_tok then 
            stmt := getWhileStatement();
        elsif tok.getTokType() == tokentype.print_tok then 
            stmt := getPrintStatement();
        elsif tok.getTokType() == tokentype.for_tok then 
            stmt := getForStatement();
        elsif tok.getTokType() == tokentype.id then 
            stmt := getAssignmentStatement();
        else
            raise new ParserException ("invalid statement at row " + tok.getRowNumber()  + " and column " + tok.getColumnNumber()); //TODO
        return stmt;
   end
     
   function getAssignmentStatement(//TODO) return Statement is
   begin 
      var: Id; 
      var := getId();
      tok: token; 
      tok := getNextToken();
      match (tok, tokentype.assignment_operator); //TODO
      expr : arithmetic_expression; 
      expr := getArithmeticExpression(); 
      return new assignment_statement (var, expr); //TODO
      
   end
     
   function getPrintStatement(//TODO) return Statement is
    begin 
        tok: token; 
        tok := getNextToken();
        match (tok, tokentype.print_tok); //TODO
        tok := getNextToken();
        match (tok, tokentype.left_parent); //TODO
        expr : arithmetic_expression; 
        expr := getArithmeticExpression(); 
        tok := getNextToken();
        match (tok, tokentype.right_parent); //TODO
        return new Print_statement (expr); //TODO
   end
   function getWhileStatement(//TODO) return Statement is
   begin 
      tok: token; 
      tok := getNextToken();
      match (tok, tokentype.while_tok); //TODO
      expr: Boolean_expression;
      expr := getBooleanExpression();
      blk :Block;
      blk := getBlock();
      tok := getNextToken();
      match (tok, tokentype.end_tok); //TODO
      return new while_statement (expr, blk);
   end
    
   function getForStatement(//TODO) return Statement is
   begin 
        tok: token; 
        tok := getNextToken();
        match (tok, tokentype.for_tok); //TODO
        blk :Block;
        blk := getBlock();
        tok := getNextToken();
        match (tok, tokentype.colon_tok); //TODO
        expr: Boolean_expression;
        expr := getBooleanExpression();
        match (tok, tokentype.end_tok); //TODO
        return new for_statement (expr, blk);
   end 
   function getIfStatement(//TODO) return Statement is
   begin 
        tok: token; 
        tok := getNextToken();
        match (tok, tokentype.if_tok); //TODO
        expr: Boolean_expression;
        expr := getBooleanExpression();
        blk1 :Block;
        blk1 := getBlock();
        tok := getNextToken ();
        match (tok, tokentype.else_tok); //TODO
        blk2 :Block;
        blk2 := getBlock();
        tok := getNextToken();
        match (tok, tokentype.end_tok); //TODO
        return new if_statement (expr, blk1, blk2);
   end 
   function isValidStartofStatement(//TODO) return Boolean is
   begin 
       if(tok is not null)
              raise //TODO
       return //TODO           
   end 
                
      function getArithmeticExpression(//TODO) return arithmetic_operator is
   begin 
        expr : arithmetic_expression;
        tok: token;
        tok := getLookaheadToken();
        if tok.getTokType() == tokentype.id then //TODO
            expr := getId();
        elsif tok.getTokType() == tokentype.literal_integer then //TODO
            expr := getLiteralInteger();
        else
            expr := getBinaryExpression();
        return expr;
   end 
     function getBinaryExpression(//TODO) return Binary_expression is
   begin 
         op: arithmetic_operator;
         op := getArithmeticOperator();
         expr1: arithmetic_expression;
         expr1 := getArithmeticExpression();
         expr2 : arithmetic_expression;
         expr2 := getArithmeticExpression();
        return new Binary_expression (op, expr1, expr2);
   end 
    function getArithmeticOperator(//TODO) return arithmetic_oerator is
   begin 
        op: arithmetic_operator;
        tok: token;
        tok := getNextToken();
        if tok.getTokType() == tokentype.add_operator then //TODO
            op := arithmetic_operator.add_operator;
        elsif tok.getTokType() == tokentype.sub_operator then //TODO
            op := arithmetic_operator.sub_operator;
        elsif tok.getTokType() == tokentype.mul_operator then //TODO
            op := arithmetic_operator.mul_operator;
        elsif tok.getTokType() == tokentype.div_operator then //TODO
            op := arithmetic_operator.div_operator;
        else
            throw new ParserException ("arithmetic operator expected at row " +
                    tok.getRowNumber()  + " and column " + tok.getColumnNumber());
        return op;
   end
    function getLiteralInteger(//TODO) return literal_integer is
  begin 
        op: arithmetic_operator;
        tok: token;
        tok := getLookaheadToken();
        if tok.getTokType() == tokentype.id then 
            expr := getId();
        elsif tok.getTokType() == tokentype.literal_integer then 
            expr := getLiteralInteger();
        else
            expr := getBinaryExpression();
        return expr;
   end
   function getId(//TODO) return Id is
   begin 
              tok: token; 
              if //TODO
              //TODO
              return new Id(//TODO)
   end 
      function getBooleanExpression(//TODO ) return Booleam_expression is
   begin 
              op: Relative_op;
              op := getRelativeOperator();
              expr1 : Arithmetic_expression;
              expr2 : Arithmetic_expression;
              expr1 := getArithmeticExpression();
              expr2 := getArithmeticExpression();
              return new Boolean_expression(op,expr1,expr2)//TODO
   end
      function getRelationalOperator(//TODO) return Relative_op is
              begin 
              op: Relative_op;
              tok: token;
              if //TODO then //TODO
              elsif //TODO then  //TODO
              elsif //TODO then  //TODO
              elsif //TODO then  //TODO
              elsif //TODO then  //TODO
              elsif //TODO then  //TODO
              else
                    //TODO
               return op
   end
     procedure match() //TODO
   begin 
              //Note -- instead of the assert just do and if and raise
               //TODO
   end 
      function getLookaheadToken(//TODO) return token is
   begin 
      tok: token;
      tok = null;
      //TODO
   end 
      function getNextToken(//TODO) return token is
   begin 
      tok: token;
      tok = null;
      //TODO
   end 
end parser;
