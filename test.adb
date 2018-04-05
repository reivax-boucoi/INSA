with Plateau , Carte ;
use  Plateau , Carte ;
 
procedure missionsnake is
   function Length(S:P_Element)return Integer is
      Temp:P_Element:=S;
      Res:Integer:=0;
   begin
      while(temp.all.Suiv/=null)loop
	 Res:=Res+1;
	 Temp:=Temp.all.Suiv;
      end loop;
      return Res;
   end Length;
   procedure draw(T:T_Table)is
   begin
      for I in T'Range(1) loop
	 for J in T'Range(2) loop
	    DessinerBloc(i,j,T(i,j));
	 end loop;
      end loop;
      null;
   end draw;
 
   procedure Shorten(S: in out P_Element;T:in out T_Table)is
      Temp:P_Element:=S;
   Begin
      while(Temp.all.Suiv/=null)loop
   	 Temp:=Temp.all.Suiv;
      end loop;
      T(Temp.all.Serpent.Posx,Temp.all.Serpent.Posy):=Vide;
      Temp:=null;
   end Shorten;
 
   function move(S: in out P_Element;T:in out T_Table;Dir:T_Direction)return Integer is
      Target:P_Element:=new Element;
   begin
      Case Dir is
	 when Est =>
	    Target.all.Serpent:=(S.all.Serpent.posx,(S.Serpent.Posy+1) mod 16);
	 when Ouest =>
	    Target.all.Serpent:=(S.all.Serpent.Posx,( S.Serpent.Posy+15) mod 16);
	 when Sud =>
	    Target.all.Serpent:=((S.all.Serpent.Posx+1) mod 12,S.Serpent.Posy);    
	 when Nord =>
	    Target.all.Serpent:=((S.all.Serpent.Posx+11)mod 12,S.Serpent.Posy);    
	 when Immobile => 
	    EffacerMemoireElement(Target);
	    return 0;
	 when others => 
	    return -42;--help !!!
      end case;
      case T(Target.all.Serpent.Posx,Target.all.Serpent.Posy) is
	 when Mur =>
	    EffacerMemoireElement(Target);  -- TODO Collision handling
	    return -1;
	 when Vide => 
	    Target.all.Suiv:=S;
	    S:=Target;
	    T(Target.all.Serpent.Posx,Target.all.Serpent.Posy):=Snake;
	    Shorten(S,T);
	    return 1;
	 when Snake =>
	    EffacerMemoireElement(Target); -- TODO Collision handling
	    return -2;
	 when Cerise =>
	    Target.all.Suiv:=S;
	    S:=Target;
	    T(Target.all.Serpent.Posx,Target.all.Serpent.Posy):=Snake;
	    return 2;
	 when others => 
	    EffacerMemoireElement(Target); --help !!!
	    return -42;
      end case;
   end move;
 
   Lost:integer:=0;
   Score:integer:=0;
   Screen:T_Table;
   Head:P_Element:=new Element;
 
begin   
   InitialiserCarte;
   InitialiserJeu(Screen,Head.all.Serpent);
   while(Lost>=0) loop
 
      Lost:=move(Head,Screen,DetecterDirection);
      if(Lost=2)then
	 Score:=Score+1;
	 Lost:=0;
	 end if;
      PlacerCerise(Screen);
      draw(Screen);
 
   end loop;
   Effacerecran;
   Ecrireecran(1,1,"Lost !");
   Ecrireecran(1,2,"Length : "& Integer'Image(Length(Head)));
   Ecrireecran(1,3,"Score : "& Integer'Image(Score)&" pts");
   Ecrireecran(1,4,"Return code : "& Integer'Image(Lost));
   --free memory here free(Head);
end missionsnake;
