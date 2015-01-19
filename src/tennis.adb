with Screen_Interface; use Screen_Interface;

procedure Tennis is 
   Mid_Width : Integer;
begin
   Screen_Interface.Initialize;
   ------------- Fond d'ecran -----------------------
   Screen_Interface.Fill_Screen(Green);
   ------------- Ligne blanche separant les deux parties du court de tennis ------------------
   for X in Width'First .. Width'Last loop
      Set_Pixel ((X, (Height'Last - Height'First) / 2), White);
   end loop;
   
   ------------ Une barre pour  joueur 1 -----------------------------
   Mid_Width := (Width'Last - Width'First) / 2;
   for Y in (Mid_Width - Mid_Width/4 ).. (Mid_Width + Mid_Width/4) loop
      Set_Pixel ((Y, Height'First + 2), Red);
      Set_Pixel ((Y, Height'First + 3), Red);
      Set_Pixel ((Y, Height'First + 4), Red);   
      Set_Pixel ((Y, Height'First + 5), Red);
      Set_Pixel ((Y, Height'First + 6), Red);
   end loop;

   ------------ Une barre pour  joueur 2 -----------------------------
   for Y in (Mid_Width - Mid_Width/4 ).. (Mid_Width + Mid_Width/4) loop
      Set_Pixel ((Y, Height'Last - 2), Blue);
      Set_Pixel ((Y, Height'Last - 3), Blue);
      Set_Pixel ((Y, Height'Last - 4), Blue);   
      Set_Pixel ((Y, Height'Last - 5), Blue);
      Set_Pixel ((Y, Height'Last - 6), Blue);
   end loop;
   
   if True then
      loop
         null;
      end loop;
   end if;
end Tennis;
  
