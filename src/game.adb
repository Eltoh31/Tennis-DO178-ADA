with Screen_Interface; use Screen_Interface;
package body Game is
   procedure Init(G:in out T_Game) is
      Mid_Width, Mid_Height : Integer;
   
   begin
      Screen_Interface.Initialize;
      ------------- Fond d'ecran -----------------------
      Screen_Interface.Fill_Screen(Green);
      ------------- Ligne blanche separant les deux parties du court de tennis ------------------
      for X in Width'First .. Width'Last loop
	 Set_Pixel ((X, (Height'Last - Height'First) / 2), White);
      end loop;
   
      Mid_Width := (Width'Last - Width'First) / 2;
      Mid_Height := (Height'Last - Height'First) / 2;
      ------------ Une barre pour  joueur 1 -----------------------------
      Init(G.Player1, Mid_Width, Height'First, Red);
      ------------ Une barre pour  joueur 2 -----------------------------
      Init(G.Player2, Mid_Width, Height'Last -8, Blue);
      
      
      Init(G.Ball, Mid_Width, Mid_Height, Violet, 1, 1);
      -------------------- DRaw des players -----------------------------
      Draw(G.Player1);
      Draw(G.Player2);
      Draw(G.Ball);
   end Init;
   
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
  
end Game;
