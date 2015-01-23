with Game; use Game;
with Screen_Interface; use Screen_Interface;

procedure Tennis is 
   Game:T_Game;
   I: Integer := 0;
begin
   Init_Screen;
   while (True) loop
      Draw_Menu;
      while not Get_Touch_State.Touch_Detected loop
	 null;
      end loop;
      Init_Game(Game);
      Game_Loop(Game);
      Draw_Winner(Game);
      while not Get_Touch_State.Touch_Detected loop
	 null;
      end loop;
      
   end loop;
end Tennis;
  
