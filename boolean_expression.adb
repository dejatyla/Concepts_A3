with Ada.Characters.Handling; use Ada.Characters.Handling
  
package body boolean_expression is
   
   function boolean_expression(op: in relative_op, expr1: in arithmetic_expression, epr2: in arithmetic_expression) return Binary_Expression is 
     
      BE: boolean_expression;
      
   begin
      
      if op == null then
         raise Data_Error => Put("Relative Operator is null");
      elsif expr1 == null || expr2 == null then
         raise Data_Error => Put("Arithmetic Expression is null");
      end if
           
      BE.op := op;
      BE.expr1 := expr1;
      BE.expr2 := expr2;
      return BE;
    end boolean_expression;
  
  function evaluate () return Boolean is
      
    begin
      reult: Boolean;
      
      case BE.op is
         when eq_operator => 
            if BE.expr1.evaluate() == BE.expr2.evaluate() then
               result := True;
         when ne_operator => 
            if expr1.evaluate() != expr2.evaluate() then
               result := True;
         when lt_operator => 
            if expr1.evaluate() != expr2.evaluate() then
               result := True;
         when le_operator => 
            if expr1.evaluate() != expr2.evaluate() then
               result := True;
         when gt_operator => 
            if expr1.evaluate() != expr2.evaluate() then
               result := True;
         when ge_operator => 
            if expr1.evaluate() != expr2.evaluate() then
                  result := True;
         when others => raise Error;              
      end case;               
      end evaluate;   
      
end boolean_expression;
