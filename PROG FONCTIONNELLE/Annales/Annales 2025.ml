(* Annales 2025 *)

let est_vide = function mot -> (mot = "") ;;
let prem_lettre = function ch -> String.sub ch 0 1;;
let reste_mot = function ch -> String.sub ch 1 ((String.length ch) - 1);;



let rec somme = function vect_mob_douce ->
    if est_vide vect_mob_douce then
        0
    else
        if prem_lettre vect_mob_douce = "0" then
            somme(reste_mot vect_mob_douce)
        else
            1 + somme(reste_mot vect_mob_douce);;

let est_eligible = function car ->
    car = "V" || car = "C" || car = "c" || car = "E";;

let rec vecteur_mobilite_douce = function vect_deplac ->
    if est_vide vect_deplac then
        ""
    else
        if est_eligible (prem_lettre vect_deplac) then
            "1" ^ vecteur_mobilite_douce( reste_mot vect_deplac)
        else
            "0" ^vecteur_mobilite_douce (reste_mot vect_deplac);;