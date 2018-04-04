--test raw
procedure draw(T:T_Table)is
begin
-- for (b in T'Range)loop
-- draw every block in table
-- end loop;
end draw;

procedure move(S:P_Element,T:T_Table,Dir:T_Direction)is
  Head:P_Element;
begin
  Case Dir is
    when Nord =>
      Head := S.Serpent.y-1;
    when Sud =>
      Head := S.Serpent.y+1;
    when Est =>
      Head := S.Serpent.x+1;    
    when Ouest =>
      Head := S.Serpent.x-1;    
    when Immobile => return;
    when others => --help !!!
  Head.all.Serpent
end move;

Lost:boolean:=false;
Screen:T_Table;
Start:P_Element;

S:T_Snake;
InitialiserCarte;
InitialiserJeu(T;Start.all.Serpent);

while(lost=false) loop
  --do game loop here
  move(S,Screen,DetecterDirection);
  draw(Screen);
  if(false)then--checkLost(Start)
    lost:=true;
  end if;
end loop;

--free memory here
