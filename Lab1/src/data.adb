-----------Package Data, body-----------
with Text_IO, Ada.Integer_Text_IO;
use Text_IO, Ada.Integer_Text_IO;
with Data;
package body Data is

   --Multiplication of matrices
   function Matrix_Multiplication(A, B: in Matrix) return Matrix is
      P: Matrix;
      S: Integer;
   begin
      for k in 1..n loop
         for i in 1..n loop
            s := 0;
            for j in 1..n loop
               S := S + A(k)(j)*B(j)(i);
               P(k)(i) := s;
            end loop;
         end loop;
      end loop;
      return P;
   end Matrix_Multiplication;

   --Sum of matrices
   function Matrix_Sum(MA, MB: in Matrix) return Matrix is
      MC: Matrix;
   begin
      --Matrix_Filling_Ones(MC);
      for i in 1..n loop
         for j in 1..n loop
            MC(i)(j):=MA(i)(j)+MB(i)(j);
         end loop;
      end loop;
      return MC;
   end Matrix_Sum;

   --Find the max value of Matrix
   function Matrix_Find_Max(MA: in Matrix) return Integer is
      max: Integer := MA(1)(1);
   begin
      for i in 1..n loop
         for j in 1..n loop
            if MA(i)(j) > max then
               max := MA(i)(j);
            end if;
         end loop;
      end loop;
      return max;
   end Matrix_Find_Max;

   --Find the min value of Matrix
   function Matrix_Find_Min(MA: in Matrix) return Integer is
      min: Integer := MA(1)(1);
   begin
      for i in 1..n loop
         for j in 1..n loop
            if MA(i)(j) < min then
               min := MA(i)(j);
            end if;
         end loop;
      end loop;
      return min;
   end Matrix_Find_Min;

   --Find the min velue of Vector
   function Vector_Find_Min(A: in Vector) return Integer is
      min: Integer :=A(1);
   begin
      for i in 1..n loop
         if A(i) < min then
            min := A(i);
         end if;
      end loop;
      return min;
   end Vector_Find_Min;

   --Matrix translation
   function Matrix_Translation(MA: in Matrix) return Matrix is
      MB: Matrix;
   begin
      for i in 1..n loop
         for j in 1..n loop
            MB(i)(j) := MA(j)(i);
         end loop;
      end loop;
      return MB;
   end Matrix_Translation;

   --Multiplication of matrix and integer
   function Matrix_Integer_Multiplication(A: in Matrix; k: in Integer) return Matrix is
      P: Matrix;
   begin
      for i in 1..n loop
         for j in 1..n loop
            P(i)(j):=A(i)(j)*k;
         end loop;
      end loop;
      return P;
   end Matrix_Integer_Multiplication;

   --Multiplication of vector and matrix
   function Vector_Matrix_Multiplication(A: in Vector; B: in Matrix) return Vector is
      P: Vector;
      s: Integer;
   begin
      for i in 1..n loop
         s := 0;
         for j in 1..n loop
            S := s + A(i)*B(j)(i);
         end loop;
         P(i) := S;
      end loop;
      return P;
   end Vector_Matrix_Multiplication;

   --Multiplication of Vector and Integer
   function Vector_Integer_Multiplication (A: in Vector; e: in Integer) return Vector is
      B: Vector;
   begin
      for i in 1..n loop
         B(i) := A(i)*e;
      end loop;
      return B;
   end Vector_Integer_Multiplication;

   --Difference of Vectors
   function Vector_Difference(A, B: in Vector) return Vector is
      S: Vector;
   begin
      for i in 1..n loop
         S(i) := A(i)-B(i);
      end loop;
      return S;
   end Vector_Difference;

   --Sum of Vectors
   function Vector_Sum(A, B: in Vector) return Vector is
      S: Vector;
   begin
      for i in 1..n loop
         S(i) := A(i)+B(i);
      end loop;

      return S;
   end Vector_Sum;

   function Vector_Multiplication(A, B: in Vector) return Integer is
      d: Integer := 0;
   begin
      for i in 1..n loop
         d := d + A(i)*B(i);
      end loop;
      return d;
   end Vector_Multiplication;

   --Sorting of vector
   function Vector_Sorting(A: in Vector) return Vector is
      B: Vector;
   begin
      for i in 1..n loop
         for j in i..n loop
            if A(i)>A(j) then
               B(j):=A(i);
               B(i):=A(j);
            end if;
         end loop;
      end loop;
      return B;
   end Vector_Sorting;

   --Filling matrix with ones
   procedure Matrix_Filling_Ones(A: out Matrix) is
   begin
      for i in 1..n loop
         for j in 1..n loop
            A(i)(j) := 1;
         end loop;
      end loop;
   end Matrix_Filling_Ones;

   --Filling vector with ones
   procedure Vector_Filling_Ones (A: out vector) is
   begin
      for i in 1..n loop
         A(i) := 1;
      end loop;
   end Vector_Filling_Ones;

   --Calculation function 1
   function Func1 (A, B, C: in Vector; MA, ME : in Matrix) return Integer is
      MD:Matrix;
      D,E:Vector;
      F:Integer;
   begin
      MD:=Matrix_Multiplication(MA,ME);
      D:=Vector_Sum(B, C);
      E:=Vector_Matrix_Multiplication(D, MD);
      F:=Vector_Multiplication(A, E);
      return F;
   end Func1;

   --Calculation function 2
   function Func2 (MF, MG, MH, ML: in Matrix) return Integer is
      MX, MY, MZ: Matrix;
      max: Integer;
   begin
      MZ:=Matrix_Multiplication(MH, ML);
      MY:=Matrix_Multiplication(MG, MZ);
      MX:=Matrix_Sum(MF, MY);
      max:=Matrix_Find_Max(MX);
      return max;
   end Func2;

   --Calculation function 3
   function Func3 (A, B, C: in Vector; MB, MM : in Matrix) return Integer is
      dig, F: Integer;
      MD, ME:Matrix;
      D, E:Vector;
   begin
      MD:=Matrix_Multiplication(MB, MM);
      ME:=Matrix_Translation(MD);
      D:=Vector_Matrix_Multiplication(A, ME);
      E:=Vector_Sorting(C);
      F:=Vector_Multiplication(B, E);
      D(n):=F;
      dig:=Vector_Find_Min(D);
      return dig;
   end Func3;
end Data;
