package body Player is
   procedure Init(P:in out T_Player; W: in Natural; H:in Natural; C: in Color) is
   begin
      P.Position_W := W;
      P.Position_H := H;
      P.Colour := C;
      P.Score := 0;      
   end Init;
   
   procedure Draw(P: in T_Player) is 
      Mid_Width: constant Natural := (Width'Last - Width'First) / 2;
   begin 
      for Y in (P.Position_W - Mid_Width/4 ).. (P.Position_W + Mid_Width/4) loop
	 
	 Set_Pixel ((Y, P.Position_H + 2), P.Colour);
	 Set_Pixel ((Y, P.Position_H + 3), P.Colour);
	 Set_Pixel ((Y, P.Position_H + 4), P.Colour);   
	 Set_Pixel ((Y, P.Position_H + 5), P.Colour);
	 Set_Pixel ((Y, P.Position_H + 6), P.Colour);
      end loop;
   end Draw;
   
   function Is_Wining(P:in T_Player) return Integer is
   begin
      if (P.Score = 7) then 
	 return 1;
      end if;
      return 0;
   end Is_Wining;
   procedure Equals(P:in out T_Player; P_Aux: in T_Player) is
   begin
      P.Position_W := P_Aux.Position_W;
      P.Position_H := P_Aux.Position_H;
      P.Colour := P_Aux.Colour;
      P.Score := P_Aux.Score;      
   end Equals;
   
   function Get_WPos(P:in T_Player) return Natural is
   begin 
      return P.Position_W;
   end Get_WPos;
   
   function Get_HPos(P:in T_Player) return Natural is
   begin 
      return P.Position_H;
   end Get_HPos;
   
   function Get_Score(P:in T_Player) return Natural is
   begin 
      return P.Score;
   end Get_Score;
   
   procedure Set_WPos(P:in out T_Player; Wpos:in Natural) is
   begin 
      P.Position_W := Wpos;   
   end Set_WPos;
   
   procedure Set_HPos(P:in out T_Player; Hpos:in Natural) is
   begin 
      P.Position_H := Hpos;   
   end Set_HPos;
   
   procedure Set_Score(P:in out T_Player; Score:in Natural)is   
   begin 
      P.Score := Score;
   end Set_Score;
   
   
end Player;
