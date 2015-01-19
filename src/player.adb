package body Player is
   procedure Init(P:in out T_Player; W: in Natural; H:in Natural; C: in Color) is
   begin
      P.Position_W := W;
      P.Position_H := H;
      P.Colour := C;
      P.Score := 0;      
   end Init;
   
   procedure Draw(P: in T_Player) is 
      Mid_Width: Natural := (Width'Last - Width'First) / 2;
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
end Player;
