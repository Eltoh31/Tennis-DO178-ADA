with Screen_Interface; use Screen_Interface;
with Player;use Player;

procedure Tennis is 
   Mid_Width : Integer;
   P1, P2 : T_Player;
begin
   Screen_Interface.Initialize;
   ------------- Fond d'ecran -----------------------
   Screen_Interface.Fill_Screen(Green);
   ------------- Ligne blanche separant les deux parties du court de tennis ------------------
   for X in Width'First .. Width'Last loop
      Set_Pixel ((X, (Height'Last - Height'First) / 2), White);
   end loop;
   
   Mid_Width := (Width'Last - Width'First) / 2;
   ------------ Une barre pour  joueur 1 -----------------------------
   Init(P1, Mid_Width, Height'First, Red);
   ------------ Une barre pour  joueur 2 -----------------------------
   Init(P2, Mid_Width, Height'Last -8, Blue);
   -------------------- DRaw des players -----------------------------
   Draw(P1);
   Draw(P2);
   
   
   
   if True then
      loop
         null;
      end loop;
   end if;
end Tennis;
  
