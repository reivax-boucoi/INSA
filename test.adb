--test raw
procedure drawSnake(S:P_Element)is
begin
  if(S/=null)then
    
  end if;
end drawSnake;

Lost:boolean:=false;
T:T_Table;
Start:P_Element;

S:T_Snake;
InitialiserCarte;
InitialiserJeu(T;Start.all.Serpent);

while(lost=false) loop
  --do game loop here
  drawSnake(Start);
  if(false)then
    lost:=true;
  end if;
end loop;

--free memory here
