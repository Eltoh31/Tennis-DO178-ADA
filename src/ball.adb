package body Ball is
   procedure Init(B:in out T_Ball; W: in Natural; H:in Natural; C: in Color; D_W: in Natural; D_H: in Natural) is
   begin
      B.Position_W := W;
      B.Position_H := H;
      B.Direction_W := D_W;
      B.Direction_H := D_H;
      B.Colour := C;
      B.Radius := 1;
   end Init;
   ------------------------------ Prediction du mouvement de la  balle -------------------
   procedure Colision(B:in out T_Ball; P1: in out T_Player; P2: in out T_Player) is
      Next_W_Pos :constant Integer := B.Position_W + B.Direction_W;
      Next_H_Pos :constant Integer := B.Position_H + B.Direction_H;
      Mid_Width, Mid_Height :Integer;
   begin
      Mid_Width := (Width'Last - Width'First) / 2;
      Mid_Height := (Height'Last - Height'First) / 2;
      -------------------- Collisions murs --------------------
      if (Next_W_Pos < Width'First) then
	 -- Balle sort sur un côté (en bas)
	 -- Set_Score(, Get_Score() + 1);
	 -- Replacer la balle qui doit partir vers perdant
	 B.Position_H :=  Mid_Height;
	 B.Position_W :=  Mid_Width;
	 B.Colour:= White;
	 null;
      elsif (Next_W_Pos > Width'Last) then
	  B.Position_H :=  Mid_Height;
	  B.Position_W :=  Mid_Width;
	  B.Colour := Black;
	 null;
	 -- Balle sort sur un côté (en haut)
	 -- Set_Score(, Get_Score() + 1);
	 -- Replacer la balle qui doit partir vers perdant
      elsif (Next_H_Pos < Height'First + 5) then
	 -- Balle sort derriere un player (P1)
	 Set_Score(P2, Get_Score(P2) + 1);
	 -- Replacer la balle qui doit partir vers P1
	 B.Position_H :=  Mid_Height;
	 B.Position_W :=  Mid_Width;
	 B.Colour:= Red;
	 B.Direction_H := 4;
	 B.Direction_H := 0;
      elsif (Next_H_Pos > Height'Last - 5) then
	 -- Balle sort derriere un player (P2)
	 Set_Score(P1, Get_Score(P1) + 1);
	 -- Replacer la balle qui doit partir vers P2
	 B.Position_H :=  Mid_Height;
	 B.Position_W :=  Mid_Width;
	 B.Direction_H := -4;
	 B.Direction_W := 0;
     ----------Collisions avec  player 1---------------------
     -- elsif (Next_W_Pos = Get_WPos(P1)) then
--	 null;
--       elsif (Next_H_Pos = Get_HPos(P1)) then
-- 	 null;
      ----------Collisions avec player 2---------------------
--       elsif (Next_W_Pos = Get_WPos(P2)) then
-- 	 null;
--       elsif (Next_H_Pos = Get_HPos(P2)) then
-- 	 null;
	 ------------ Autre ------------------------------------
      else

	 B.Position_H := Next_H_Pos;
	 B.Position_W := Next_W_Pos;
      end if;

   end Colision;


   -- Pour changer le sens de la balle a voir si un angle conviens pas mieux que deux coord -----

   procedure Set_Direction(B:in T_Ball; D_W: in Natural; D_H: in Natural) is
   begin
      null;
   end Set_Direction;

   ------ Procedure d'affichage ------------------------------------
   procedure Draw(B:in T_Ball) is
   begin
      for X in B.Position_H - 5 ..  B.Position_H + 5 loop
	 for Y in B.Position_W - 5  ..  B.Position_W + 5 loop
	    Set_Pixel ((Y, X), B.Colour);
            if (B.Direction_H > 0) then
               Set_Pixel((Y, X-10), Green);
            else
               Set_Pixel((Y, X+10), Green);
            end if;
            end loop;
      end loop;
   end Draw;

   procedure Clear(B:in T_Ball) is
   begin
      for X in B.Position_H - 5 ..  B.Position_H + 5 loop
	 for Y in B.Position_W - 5  ..  B.Position_W + 5 loop
	    Set_Pixel ((Y, X), Green);
	 end loop;
      end loop;
      for X in Width'First .. Width'Last loop
	 Set_Pixel ((X, (Height'Last - Height'First) / 2), White);
     end loop;
   end Clear;

   function Get_WPos(B:in T_Ball) return Natural is
   begin
      return B.Position_W;
   end Get_WPos;

   function Get_HPos(B:in T_Ball) return Natural is
   begin
      return B.Position_H;
   end Get_HPos;

   function Get_WDir(B:in T_Ball) return Integer is
   begin
      return B.Direction_W;
   end Get_WDir;

   function Get_HDir(B:in T_Ball) return Integer is
   begin
      return B.Direction_H;
   end Get_HDir;

   function Get_Radius(B:in T_Ball) return Natural is
   begin
      return B.Radius;
   end Get_Radius;

   procedure Set_WPos(B:in out T_Ball; Wpos:in Natural)is
   begin
      B.Position_W := Wpos;
   end Set_WPos;

   procedure Set_HPos(B:in out T_Ball; Hpos:in Natural)is
   begin
      B.Position_H := Hpos;
   end Set_HPos;
   procedure Set_WDir(B:in out T_Ball; Wdir:in Integer)is
   begin
      B.Direction_W := Wdir;
   end Set_WDir;

   procedure Set_HDir(B:in out T_Ball; Hdir:in Integer)is
   begin
      B.Direction_H := Hdir;
   end Set_HDir;

   procedure Equals(B:in out T_Ball; B_Aux: in T_Ball) is
   begin
      B.Position_W := B_Aux.Position_W;
      B.Position_H := B_Aux.Position_W;
      B.Direction_W := B_Aux.Direction_W;
      B.Direction_H := B_Aux.Direction_H;
      B.Colour := B_Aux.Colour;
      B.Radius := B_Aux.Radius;
   end Equals;

end Ball;
