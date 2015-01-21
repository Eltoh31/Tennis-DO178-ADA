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
--   procedure Colision(B:in T_Ball; P1: in T_Player; P2: in T_Player) is
--      Next_W_Pos :constant Integer := B.Position_W + B.Radius + B.Direction_W;
--      Next_H_Pos :constant Integer := B.Position_H + B.Radius + B.Direction_H;
 --  begin
      
      -------------------- Collisions murs --------------------

 --     if (Next_W_Pos < Width'First) then 
--	 null;
--      elsif (Next_W_Pos > Width'Last) then 
--	 null;
--      elsif (Next_H_Pos < Height'First) then
--	 null;
--     elsif (Next_H_Pos > Height'Last) then
--	 null;
      ----------Collisions avec  player 1---------------------
      --elsif (Next_W_Pos = P1.Position_W) then
--	 null;
--      elsif (Next_H_Pos = P1.Position_H) then	
--	 null; 
      ----------Collisions avec player 2---------------------
--      elsif (Next_W_Pos = P2.Position_W) then
--	 null;
--      elsif (Next_H_Pos = P2.Position_H) then	
--	 null;	 
      ------------ Autre ------------------------------------
--      else
--	 null;
--      end if;
	   
--   end Colision;
   

   -- Pour changer le sens de la balle a voir si un angle conviens pas mieux que deux coord -----

   procedure Set_Direction(B:in T_Ball; D_W: in Natural; D_H: in Natural) is
   begin
      null;
   end Set_Direction;
   
   ------ Procedure d'affichage ------------------------------------
   procedure Draw(B:in T_Ball) is
      Mid_Width: constant Natural := (Width'Last - Width'First) / 2;
      Mid_Height: constant Natural := (Height'Last - Height'First) / 2;
   begin
      Set_Pixel ((Mid_Width, Mid_Height), B.Colour);
      Set_Pixel ((Mid_Width + 1, Mid_Height), B.Colour);
      Set_Pixel ((Mid_Width, Mid_Height + 1), B.Colour);   
      Set_Pixel ((Mid_Width + 1, Mid_Height + 1), B.Colour);
      Set_Pixel ((Mid_Width -1, Mid_Height), B.Colour);
      Set_Pixel ((Mid_Width, Mid_Height - 1), B.Colour);
      Set_Pixel ((Mid_Width - 1, Mid_Height - 1), B.Colour);
      Set_Pixel ((Mid_Width, Mid_Height), B.Colour);
      Set_Pixel ((Mid_Width + 2, Mid_Height), B.Colour);
      Set_Pixel ((Mid_Width, Mid_Height + 2), B.Colour);   
      Set_Pixel ((Mid_Width + 2, Mid_Height + 2), B.Colour);
      Set_Pixel ((Mid_Width -2, Mid_Height), B.Colour);
      Set_Pixel ((Mid_Width, Mid_Height - 2), B.Colour);
      Set_Pixel ((Mid_Width - 2, Mid_Height - 2), B.Colour);
      Set_Pixel ((Mid_Width, Mid_Height), B.Colour);
      Set_Pixel ((Mid_Width + 3, Mid_Height), B.Colour);
      Set_Pixel ((Mid_Width, Mid_Height + 3), B.Colour);   
      Set_Pixel ((Mid_Width + 3, Mid_Height + 3), B.Colour);
      Set_Pixel ((Mid_Width -3, Mid_Height), B.Colour);
      Set_Pixel ((Mid_Width, Mid_Height - 3), B.Colour);
      Set_Pixel ((Mid_Width - 3, Mid_Height - 3), B.Colour);
   end Draw;
   
   function Get_WPos(B:in T_Ball) return Natural is 
   begin
      return B.Position_W;
   end Get_WPos;
   
   function Get_HPos(B:in T_Ball) return Natural is
   begin 
      return B.Position_H;
   end Get_HPos;
   
   function Get_WDir(B:in T_Ball) return Natural is
   begin
      return B.Direction_W; 
   end Get_WDir;
   
   function Get_HDir(B:in T_Ball) return Natural is 
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
   procedure Set_WDir(B:in out T_Ball; Wdir:in Natural)is
   begin
      B.Direction_W := Wdir;
   end Set_WDir;   
   
   procedure Set_HDir(B:in out T_Ball; Hdir:in Natural)is 
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

