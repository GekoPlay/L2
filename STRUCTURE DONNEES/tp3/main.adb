with Ada.Text_IO; use Ada.Text_IO;
with Ada.Strings.Unbounded; 
use Ada.Strings.Unbounded;
with Ada.Strings.Unbounded.Text_IO;
use Ada.Strings.Unbounded.Text_IO;
with tp3_file;

procedure Main is

   type Client is record
      nom  : Unbounded_String;
      prod : Character;
      nb   : Integer;
   end record;

   type Stock is array (Character range 'a'..'c') of Integer;

   function Client_Image (C : Client) return String is
   begin
      return "Nom: " & To_String(C.nom) & ", Prod: " & C.prod & ", Nb: " & Integer'Image(C.nb);
   end Client_Image;

   package File_Clients is new tp3_file(T => Client, Image => Client_Image);
   use File_Clients;
   type File_Attente_Prod is array (Character range 'a'..'c') of File_Attente;


   Ma_File : File_Attente := File_vide;
   Choix : Character;
   Nouveau_Client : Client;



   procedure Simuler_client(f : in out File_Attente) is
   begin
      skip_line;
      Put_Line ("Votre Nom : ");
      Nouveau_Client.nom := Get_Line;

      Put_Line ("Nom du Produit : ");
      Nouveau_Client.prod := Get_Line;

      Put_Line ("Nombre d'exemplaire du produit");
      Nouveau_Client.nb := Get_Line;

   end Simuler_client;
begin


      


   loop
   Put_Line("===== MENU ====");
   PUT_Line("1 - Simuler l'arrivée d'un nouveau client");
   PUT_Line("2 - Simuler l'arrivé d'un produit en nb exempalire");
   PUT_Line("3 - Quitter");
   Get (Choix);
   case Choix is
      when '1' => Simuler_client(Ma_File);
      --  when '2' => Simuler_produit;
      when '3' => Put_Line ("Au revoir");
      WHEN OTHERS => PUT_LINE("Inférieur ou égale à 0 ou supérieur à 8");
   end case;
   exit when Choix = '3';
   end loop;

   Nouveau_Client.nom := To_Unbounded_String("Alice");
   Nouveau_Client.prod := 'A';
   Nouveau_Client.nb := 5;


   Ajoute(Ma_File, Nouveau_Client);
   Put("File actuelle : ");
   Affiche(Ma_File);
   
end Main;