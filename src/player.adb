package body Player is
   procedure Init(P:in out T_Player; W: in Natural; H:in Natural; C: in Color; ID: in Integer) is
   begin
      P.Position_W := W;
      P.Position_H := H;
      P.Colour := C;
      P.Score := 0;
      P.ID    := ID;
   end Init;

   procedure Draw(P: in T_Player) is
      Last_X         : Width         := (Width'Last - Width'First) / 4;
      Last_Y         : Height        := (Height'Last - Height'First) / 4;
      State          : Touch_State;
      BarWidth       : Natural       := 10;
      BarSize        : Natural       := (Width'Last - Width'First)/4;
      FieldSide      : Natural       := 12;
   begin
      loop
         State := Get_Touch_State;
         exit when State.Touch_Detected and
           then (State.X /= Last_X or State.Y /= Last_Y);
      end loop;
      ----------------------------PLAYER RED
      if  (State.Y < ((Height'Last-Height'First)/2)-40) then
         --DRAW BAR
         Last_Y := State.Y;
         Last_X := State.X;
         for I in 1..BarWidth loop
            Set_Pixel ((Last_X, I), Red);
            for N in 1..BarSize loop
               if Last_X+N < Width'Last and Last_X-N > Width'First then
                  Set_Pixel ((Last_X+N, I), Red);
                  Set_Pixel ((Last_X-N, I), Red);
               end if;
            end loop;
         end loop;
         -- ERASE TRACE
         for K in Width'First..Width'Last loop
            if ((K < Last_X-(BarSize/2)) or (K >  Last_X+(BarSize/2))) then
               for R in 1..BarWidth loop
                  Set_Pixel ((K, R), Green);
               end loop;
            end if;
         end loop;
      end if;
      ------------------------------------
      ------------------------ PLAYER BLUE
      --Draw Blue
      Last_Y := State.Y;
      Last_X := State.X;
      if  (State.Y >= ((Height'Last-Height'First)/2)+40) then
         for J in 1..BarWidth loop
            Set_Pixel ((Last_X, Height'Last-J), Blue);
            for M in 1..BarSize loop
               if Last_X+M < Width'Last and Last_X-M > Width'First then
                  Set_Pixel ((Last_X+M, Height'Last-J), Blue);
                  Set_Pixel ((Last_X-M, Height'Last-J), Blue);
                  ---------------------------------------
               end if;
            end loop;
         end loop;
            for K in Width'First..Width'Last loop
               if ((K < Last_X-(BarSize/2)) or (K >  Last_X+(BarSize/2))) then
                  for R in 1..BarWidth loop
                     Set_Pixel ((K, Height'Last-R), Green);
                  end loop;
               end if;
            end loop;
         end if;
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
