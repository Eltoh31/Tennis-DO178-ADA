with Screen_Interface; use Screen_Interface;
with Player; use Player;
package Ball is
   
   type T_Ball is limited private;
   procedure Init(B:in out T_Ball; W: in Natural; H:in Natural; C: in Color; D_W: in Natural; D_H: in Natural);
   procedure Colision(B:in T_Ball; P1: in T_Player; P2: in T_Player);
   procedure Set_Direction(B:in T_Ball; D_W: in Natural; D_H: in Natural);
   procedure Draw(B:in T_Ball);
private
   type T_Ball is
      record
	 Position_W: Natural := 0;
	 Position_H: Natural := 0;
	 Direction_W: Natural := 0;
	 Direction_H: Natural := 0;
	 Colour: Color := White;
	 Radius: Natural := 0;
      end record;
   
   
end Ball;
