generic
   n: Integer;
package Data is

   ---Declaration of private types
   type Vector is private;
   type Matrix is private;

   --Calculation function 1
   function Func1 (A, B, C: in Vector; MA, ME : in Matrix) return Integer;

   --Calculation function 2
   function Func2 (MF, MG, MH, ML: in Matrix) return Integer;

   --Calculation function 3
   function Func3 (A, B, C: in Vector; MB, MM : in Matrix) return Integer;

   --Filling matrix with ones
   procedure Matrix_Filling_Ones(A: out Matrix);

   --Filling vector with ones
   procedure Vector_Filling_Ones (A: out vector);


   --Determination private types
   private
   type Vector is array (1..n) of Integer;
   type Matrix is array (1..n) of Vector;

end Data;
