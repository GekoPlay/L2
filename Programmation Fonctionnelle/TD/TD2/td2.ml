let prem_car = function ch -> String.sub ch 0 1;;
let reste_mot = function ch -> String.sub ch 1 ((String.length ch) - 1);;
let est_vide = function mot -> (mot = "") ;;
let est_voyelle = function caract -> ((caract = "a") || (caract = "e") || (caract = "i") || (caract = "o") || (caract = "u") || (caract = "y"));;

(* on va compter nb de voyelle dans une chaine de charactère *)

let rec nb_voyelle = function ch ->
if est_vide ch then 0 
else
	if est_voyelle (prem_car ch) then
		1 + nb_voyelle (reste_mot ch)
	else
		nb_voyelle (reste_mot ch);;
		
let m_nb_voyelles = function ch1 -> function ch2 ->
if nb_voyelle ch1 = nb_voyelle ch2 then true
else false;;