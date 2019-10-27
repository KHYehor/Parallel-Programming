----------------Main programm------------------------

--Parallel and distributed computing.
--Labwork 1. Ada. Subprograms and packages
--Khilchenko Yehor
--IP-74
--02.10.2019
--Func1: d = A*((B+C)*(MA*ME));
--Func2: h = MAX(MF + MG*(MH*ML));
--Func3: s = MIN(A*TRANS(MB*MM) + B*SORT(C));

with Data, Text_IO, Ada.Integer_Text_IO, System.Multiprocessors;
use Text_IO, Ada.Integer_Text_IO, System.Multiprocessors;

procedure Main_Lab1 is
   n: Integer := 5 ;
   package data1 is new data (n);
   use data1;

   CPU0: CPU_Range :=0;
   CPU1: CPU_Range :=1;
   CPU2: CPU_Range :=2;
   f1, f2, f3:Integer;

   procedure tasks is
      task T1 is
         pragma Priority(1);
         pragma CPU(CPU0);
      end;
      task body T1 is
         A, B, C: Vector;
         MA, ME: Matrix;
      begin
         Put_Line("T1 started");
         Vector_Filling_Ones(A);
         Vector_Filling_Ones(B);
         Vector_Filling_Ones(C);
         Matrix_Filling_Ones(MA);
         Matrix_Filling_Ones(ME);
         f1:=Func1(A, B, C, MA, ME);
         --delay(1.0);
      end T1;

      task T2 is
         pragma Priority(1);
         pragma CPU(CPU1);
      end;
      task body T2 is
         MF, MG, MH, ML: Matrix;
      begin
         Put_Line("T2 started");
         Matrix_Filling_Ones(MF);
         Matrix_Filling_Ones(MG);
         Matrix_Filling_Ones(MH);
         Matrix_Filling_Ones(ML);
         f2:=Func2(MF, MG, MH, ML);
         --delay(1.0);
      end T2;

      task T3 is
         pragma Priority(1);
         pragma CPU(CPU2);
      end;
      task body T3 is
         MB, MM : Matrix;
         A, B, C: Vector;

      begin
         Put_Line("T3 started");
         Vector_Filling_Ones(A);
         Vector_Filling_Ones(B);
         Vector_Filling_Ones(C);
         Matrix_Filling_Ones(MB);
         Matrix_Filling_Ones(MM);
         f3:=Func3(A, B, C, MB, MM);
         --delay(1.0);
      end T3;

   begin
      null;
   end tasks;


Begin
   tasks;

   Put_Line("Func1: d = A*((B+C)*(MA*ME))");
   Put(f1);
   New_Line;
   New_Line;
   Put_Line("T1 finished");

   Put_Line("Func2: h = MAX(MF + MG*(MH*ML))");
   Put(f2);
   New_Line;
   New_Line;
   Put_Line("T2 finished");

   Put_Line("Func3: s = MIN(A*TRANS(MB*MM) + B*SORT(C))");
   Put(f3);
   New_Line;
   New_Line;
   Put_Line("T3 finished");

End Main_Lab1;
