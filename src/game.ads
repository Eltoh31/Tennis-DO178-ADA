with Player;use Player;
with Ball;use Ball;


package Game is
   type T_Game is limited private;
   procedure Init_Screen;
   procedure Init_Game(G:in out T_Game);
   procedure Draw_Menu;
   procedure Draw_Winner(G:in T_Game);
   procedure Game_Loop(G:in out T_Game);
private 
      type T_Game is
      record
	 Player1: T_Player;
	 Player2: T_Player;
	 Ball: T_Ball;
      end record;

end Game;
