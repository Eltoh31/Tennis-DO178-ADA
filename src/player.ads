with Screen_Interface; use Screen_Interface;
package Player is
   
   type T_Player is limited private;
   

   procedure Init(P:in out T_Player; W: in Natural; H:in Natural; C: in Color);
   procedure Draw(P:in T_Player);
   function Is_Wining(P:in T_Player) return Integer;
   procedure Equals(P:in out T_Player; P_Aux: in T_Player);
   function Get_WPos(P:in T_Player) return Natural;
   function Get_HPos(P:in T_Player) return Natural;
   function Get_Score(P:in T_Player) return Natural;
   procedure Set_WPos(P:in out T_Player; Wpos:in Natural);
   procedure Set_HPos(P:in out T_Player; Hpos:in Natural);
   procedure Set_Score(P:in out T_Player; Score:in Natural);


   
private
   type T_Player is
      record
	 Position_W: Natural := 0;
	 Position_H: Natural := 0;
	 Colour: Color := White;
	 Score: Natural := 0;
    end record;

end Player;	
    
