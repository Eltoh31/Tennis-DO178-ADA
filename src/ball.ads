with Screen_Interface; use Screen_Interface;
with Player; use Player;


package Ball is   
   
   type T_Ball is limited private;
   
   procedure Init(B:in out T_Ball; W: in Natural; H:in Natural; C: in Color; D_W: in Natural; D_H: in Natural);

   procedure Colision(B:in out T_Ball; P1: in out T_Player; P2: in out T_Player);
   procedure Set_Direction(B:in T_Ball; D_W: in Natural; D_H: in Natural); 
   procedure Clear(B:in T_Ball);
   procedure Draw(B:in T_Ball);
   function Get_WPos(B:in T_Ball) return Natural;
   function Get_HPos(B:in T_Ball) return Natural;
   function Get_WDir(B:in T_Ball) return Integer;   
   function Get_HDir(B:in T_Ball) return Integer;
   procedure Set_WPos(B:in out T_Ball; Wpos:in Natural);
   procedure Set_HPos(B:in out T_Ball; Hpos:in Natural);
   procedure Set_WDir(B:in out T_Ball; Wdir:in Integer);   
   procedure Set_HDir(B:in out T_Ball; Hdir:in Integer);
   procedure Equals(B:in out T_Ball; B_Aux: in T_Ball);
private   
   type T_Ball is
      record
	 Position_W: Natural := 0;
	 Position_H: Natural := 0;
	 Direction_W: Integer := 0;
	 Direction_H: Integer := 0;
	 Colour: Color := White;
	 Last_Player: Natural := 1;
      end record;
   
end Ball;
