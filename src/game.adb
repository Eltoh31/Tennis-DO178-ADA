
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
      Screen_Interface.Fill_Screen(Green);
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
	 Colision(G.Ball, P1, P2);
	  Draw(G.Player1);
	  Draw(G.Player2);
	  Draw(G.Ball);
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
   
   procedure Draw_Winner(G:in T_Game) is 
      C : Color;
      Mid_Width : Integer;      
      P1: T_Player;
      P2: T_Player;
      I : Integer:= 0;
   begin
      Equals(P1, G.Player1);
      Equals(P2, G.Player2);

      Mid_Width := (Width'Last - Width'First) / 2;

      Screen_Interface.Fill_Screen(Green);
      for X in Width'First .. Width'Last loop
	 Set_Pixel ((X, (Height'Last - Height'First) / 2), White);
      end loop;
      
      if Is_Wining(P1) = 1 then
	 C:= Red;
	 --R
	 
	 for Y  in (Mid_Width + Mid_Width/4)..(Mid_Width + 3 * Mid_Width/4) loop
	    Set_Pixel((Y, Height'First + 2), C);
	 end loop;
	 
	 for X in 2 .. 62 loop
	    Set_Pixel ((Mid_Width + 3 * Mid_Width / 4, X), C);	 
	 end loop;      	 
	 --E
	 for Y in (Mid_Width + Mid_Width/4) .. (Mid_Width + 3 * Mid_Width/4) loop
	    Set_Pixel ((Y, Height'First + 65), C);
	 end loop;
	 
	 for X in 65 .. 125 loop
	    
	    Set_Pixel ((Mid_Width + Mid_Width / 4, X), C);
	    Set_Pixel ((Mid_Width + Mid_Width / 2, X), C);
	    Set_Pixel ((Mid_Width + 3 * Mid_Width / 4, X), C);	 
	 end loop;      	 
	 --D
	 for Y in (Mid_Width + Mid_Width / 4).. (Mid_Width + Mid_Width/2) loop
	    Set_Pixel ((Y, Height'First + 130), C);
	 end loop;
	 
	 For Y in (Mid_Width + Mid_Width / 4).. (Mid_Width + 3 * Mid_Width/4) loop
	    Set_Pixel ((Y, Height'First + 190), C);
	 end loop;
	 
	 for X in 130 .. 190 loop
	    Set_Pixel ((Mid_Width + Mid_Width / 4, X), C);
	    Set_Pixel ((Mid_Width + Mid_Width / 2, X), C);
	 end loop;      	  
	 
      else
	 C:= Blue;
	 --b
	 for Y in (Mid_Width + Mid_Width / 4).. (Mid_Width + 3 * Mid_Width/4) loop
	    Set_Pixel ((Y, Height'First + 2), C);
	    Set_Pixel ((Y, Height'First + 62), C);
	 end loop;
      
	 for X in 2 .. 62 loop
	    Set_Pixel ((Mid_Width + Mid_Width / 4, X), C);
	    Set_Pixel ((Mid_Width + Mid_Width / 2, X), C);
	    Set_Pixel ((Mid_Width + 3 * Mid_Width / 4, X), C);	 
	 end loop;
	 --l
	 for Y in (Mid_Width + Mid_Width / 4) .. (Mid_Width + 3 * Mid_Width/4) loop
	    Set_Pixel ((Y, Height'First + 70), C);
	 end loop;
	 for X in 70 .. 130  loop
	    Set_Pixel ((Mid_Width + Mid_Width/4 , X), C);
	 end loop; 
	 
	 --u
	 for Y in (Mid_Width + Mid_Width / 4) .. (Mid_Width + 3 * Mid_Width/4) loop
	    Set_Pixel ((Y, Height'First + 140), C);
	    Set_Pixel ((Y, Height'First + 200), C);
	 end loop;
	 for X in 140 .. 200  loop
	    Set_Pixel ((Mid_Width + Mid_Width/4 , X), C);
	 end loop; 
	 --e
	 for Y in (Mid_Width + Mid_Width / 4) .. (Mid_Width + 3 * Mid_Width/4) loop
	    Set_Pixel ((Y, Height'First + 210), C);
	 end loop;
	 
	 for X in 210 .. 270 loop
	    Set_Pixel ((Mid_Width + Mid_Width / 4, X), C);
	    Set_Pixel ((Mid_Width + Mid_Width / 2, X), C);
	    Set_Pixel ((Mid_Width + 3 * Mid_Width / 4, X), C);	 
	 end loop;      

	 
      end if;
      -----------------------W----------------------------------------
      for Y in (Mid_Width - 3 * Mid_Width / 4).. (Mid_Width - Mid_Width/4) loop	 
	 Set_Pixel ((Y, Height'First + 2), C);	 
	 Set_Pixel ((Y, Height'First + 32), C); 
	 Set_Pixel ((Y, Height'First + 62), C); 
      end loop;
      
      for X in 2 .. 62 loop
	 Set_Pixel ((Mid_Width - 3 * Mid_Width/4 , X), C);
      end loop;
      ------------------------ I --------------------------------------
      for Y in (Mid_Width - 3 * Mid_Width / 4).. (Mid_Width - Mid_Width/4) loop	 
	 Set_Pixel ((Y, Height'First + 92), C);	 
      end loop;
      for X in 82 .. 102 loop
	 Set_Pixel ((Mid_Width - 3 * Mid_Width/4 , X), C);
	 Set_Pixel ((Mid_Width - Mid_Width/4 , X), C);
      end loop;
      
      --------------------------------- N  -------------------------------
      for Y in (Mid_Width - 3 * Mid_Width / 4).. (Mid_Width - Mid_Width/4) loop
	 Set_Pixel ((Y, Height'First + 114), C);	 
	 Set_Pixel ((Y, Height'First + 174), C);	 
      end loop; 
      for Y in  reverse (Mid_Width - 3 * Mid_Width / 4).. (Mid_Width - Mid_Width/4) loop
	 Set_Pixel ((Y, Height'First + 114 + I), C);
	 I:= I+1;
      end loop;
      
      -------------------------------------------S---------------------------------
      for Y in (Mid_Width - 3 * Mid_Width / 4).. (Mid_Width - Mid_Width/2) loop	 
	 Set_Pixel ((Y, Height'First + 242), C);	 
      end loop;
      for Y in (Mid_Width - Mid_Width / 2).. (Mid_Width - Mid_Width/4) loop	 
	 Set_Pixel ((Y, Height'First + 182), C);	 
      end loop;
      
      for X in 182 .. 242 loop
	 Set_Pixel ((Mid_Width - 3 * Mid_Width/4 , X), C);
	 Set_Pixel ((Mid_Width - Mid_Width/2 , X), C);
	 Set_Pixel ((Mid_Width - Mid_Width/4 , X), C);
      end loop;
      
   end Draw_Winner;
end Game;
