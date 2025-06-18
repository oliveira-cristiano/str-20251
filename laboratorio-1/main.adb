With Ada.Integer_Text_IO, Ada.Text_IO, Ada.Calendar;  -- Bibliotecas 
Use Ada.Integer_Text_IO, Ada.Text_IO, Ada.Calendar;   -- Bibliotecas  
 
procedure teste_task is
    
  indice: Integer:= 0;
  M1: Integer:= 1;
  M2: Integer:= 0;
  M3: Integer:= 0;
  x: Integer;
  i: Integer;
  
  vetor: array(0..29) of Character;  -- Vetor a ser preenchido 
  type vetorInt is array(1..6) of Integer;
  vetor1: vetorInt:= (2,2,2,2,2,2);
  
  task type Mostra1;
  task type Mostra2;
  task type Mostra3;
  
  task body Mostra1 is         -- Corpo da thread Mostra3   
  begin   
    while indice < 28 loop
     while M1 = 0 loop     -- Busy-Wait-Loop  
        x:=1; 
     end loop; 
     vetor(indice):='a';
     indice:=indice+1;
     M1:=0;
     M2:=1;  
    end loop;
  end Mostra1;
  
  task body Mostra2 is         -- Corpo da thread Mostra3   
  begin   
    while indice < 29 loop
     while M2 = 0 loop     -- Busy-Wait-Loop  
        x:=1; 
     end loop; 
     vetor(indice):='b';
     indice:=indice+1;
     M2:=0;
     M3:=1;  
    end loop;
  end Mostra2;
     
  task body Mostra3 is         -- Corpo da thread Mostra3   
  begin   
    while indice < 30 loop
     while M3 = 0 loop     -- Busy-Wait-Loop  
        x:=1; 
     end loop; 
     vetor(indice):='c';
     indice:=indice+1;
     M3:=0;
     M1:=1;  
    end loop;
  
    for i in 0..29 loop
       Put(vetor(i));     
    end loop; 
  end Mostra3;
 
   A : Mostra1;  -- Cria e instancia a thread Mostra1 
   B : Mostra2;  -- Cria e instancia a thread Mostra2 
   C : Mostra3;  -- Cria e instancia a thread Mostra3 
 
begin
  x := 1;
 
end teste_task;  