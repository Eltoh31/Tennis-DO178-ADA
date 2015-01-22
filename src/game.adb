
with Screen_Interface; use Screen_Interface;
package body Game is
   procedure Init_Screen is
   begin
      Screen_Interface.Initialize;
      ------------- Fond d'ecran -----------------------
      Screen_Interface.Fill_Screen(Black);
      
   end Init_Screen;
      
   procedure Init_Game(G:in out T_Game) is
      Mid_Width, Mid_Height : Integer;   
   begin
      ------------- Ligne blanche separant les deux parties du court de tennis ------------------
      for X in Width'First .. Width'Last loop
	 Set_Pixel ((X, (Height'Last - Height'First) / 2), White);
      end loop;
      Mid_Width := (Width'Last - Width'First) / 2;
      Mid_Height := (Height'Last - Height'First) / 2;
      ------------ Une barre pour joueur 1 -----------------------------
      Init(G.Player1, Mid_Width, Height'First, Red);
      ------------ Une barre pour joueur 2 -----------------------------
      Init(G.Player2, Mid_Width, Height'Last -8, Blue);
      Init(G.Ball, Mid_Width, Mid_Height, Violet, 1, 1);
      -------------------- DRaw des players -----------------------------
      Draw(G.Player1);
      Draw(G.Player2);
      Draw(G.Ball);
   end Init_Game;
   
   procedure Game_Loop(G:in out T_Game) is
      P1: T_Player;
      P2: T_Player;
   begin
      Equals(P1, G.Player1);
      Equals(P2, G.Player2);
      while (Is_Wining(P1) = 0 and then Is_Wining(P2) = 0) loop
	 null;
      end loop;
   end Game_Loop;
   
   procedure Draw_Menu is 
      Mid_Width, Mid_Height : Integer;
      I:Integer := 0;
   begin
      
      Mid_Width := (Width'Last - Width'First) / 2;
      Mid_Height := (Height'Last - Height'First) / 2;
      
      ---------------------------- N ------------------------
      for Y in (Mid_Width + Mid_Width / 4).. (Mid_Width + 3 * Mid_Width/4) loop
	 Set_Pixel ((Y, Height'First + 2), White);	 
	 Set_Pixel ((Y, Height'First + 65), White);	 
      end loop; 
      for Y in  reverse (Mid_Width + Mid_Width / 4).. (Mid_Width + 3 * Mid_Width/4) loop
	 Set_Pixel ((Y, Height'First + 2 + I), White);
	 I:= I+1;
      end loop;
      ---------------------------- E ------------------------                                                                                    
      for Y in (Mid_Width + Mid_Width / 4).. (Mid_Width + 3 * Mid_Width/4) loop
	 Set_Pixel ((Y, Height'First + 70), White);
      end loop;
      
      for X in 70 .. 130 loop
	 Set_Pixel ((Mid_Width + Mid_Width / 4, X), White);
	 Set_Pixel ((Mid_Width + Mid_Width / 2, X), White);
	 Set_Pixel ((Mid_Width + 3 * Mid_Width / 4, X), White);	 
      end loop;
      ---------------------------- W -----------------------------------
      for Y in (Mid_Width + Mid_Width / 4).. (Mid_Width + 3 * Mid_Width/4) loop	 
	 Set_Pixel ((Y, Height'First + 140), White);	 
	 Set_Pixel ((Y, Height'First + 200), White); 
	 Set_Pixel ((Y, Height'First + 170), White); 
      end loop;
      
      for X in 140 .. 200 loop
	 Set_Pixel ((Mid_Width + Mid_Width/4 , X), White);
      end loop;
      
      ------------------------------ G ----------------------------
      for Y in (Mid_Width - 3 * Mid_Width / 4).. (Mid_Width - Mid_Width/4) loop
	 Set_Pixel ((Y, Height'First + 2), White);
      end loop;
      
      for Y in (Mid_Width - 3 * Mid_Width / 4).. (Mid_Width - Mid_Width/2) loop
	 Set_Pixel ((Y, Height'First + 60), White);
      end loop;
      
      for X in 2..60 loop
	 Set_Pixel ((Mid_Width -  Mid_Width / 4, X), White);
	 Set_Pixel ((Mid_Width -  3 *Mid_Width / 4, X), White);
      end loop;
      
      for X in 55..65 loop
	 Set_Pixel ((Mid_Width -  Mid_Width / 2, X), White);
      end loop;
      ---------------------------- A -----------------------
      for Y in (Mid_Width - 3 * Mid_Width / 4).. (Mid_Width - Mid_Width/4) loop
	 Set_Pixel ((Y, Height'First + 70), White);
	 Set_Pixel ((Y, Height'First + 130), White);
      end loop;
      for X in 70..130 loop
	 Set_Pixel ((Mid_Width -  Mid_Width / 4, X), White);
	 Set_Pixel ((Mid_Width -  Mid_Width / 2, X), White);
      end loop;
      ---------------------------- M -------------------------                                                                                      
      for Y in (Mid_Width - 3 * Mid_Width / 4).. (Mid_Width - Mid_Width/4) loop	 
	 Set_Pixel ((Y, Height'First + 140), White);	 
	 Set_Pixel ((Y, Height'First + 200), White); 
	 Set_Pixel ((Y, Height'First + 170), White); 
      end loop;
      
      for X in 140 .. 200 loop
	 Set_Pixel ((Mid_Width - Mid_Width/4 , X), White);
      end loop;
       
      ---------------------------- E ------------------------                                                                                    
      for Y in (Mid_Width -  3 * Mid_Width / 4).. (Mid_Width - Mid_Width/4) loop
	 Set_Pixel ((Y, Height'First + 205), White);
      end loop;
      
      for X in 205 .. 265 loop
	 Set_Pixel ((Mid_Width  - Mid_Width / 4, X), White);
	 Set_Pixel ((Mid_Width - Mid_Width / 2, X), White);
	 Set_Pixel ((Mid_Width - 3 * Mid_Width / 4, X), White);	 
      end loop;
   end Draw_Menu;
end Game;




















