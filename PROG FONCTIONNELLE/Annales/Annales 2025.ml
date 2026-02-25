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


let calculer_primeV0 = function vect_deplac ->
    let vect_mob_douce = vecteur_mobilite_douce vect_deplac in
    let somme_total = somme vect_mob_douce in
    somme_total ;;

(* PARTIE 2 *)

(* La fonction combine *)

(* 2.1.1 Elle renvoie un sring-> on le determine par la présence du symbole '^' *)

(* 2.1.2  On pourrait avoir a la palce de f uen focntion est egale ou n'est pas egale ou est meme type*)

(* 2.2.2 Cette focntion est une focntion général, elle prend une fonction f et l'applique au 2 premuer charactere de ch1 et ch2 *)


let et_logique = function c1 -> function c2 ->
    if c2  = "1" then
        "0"
    else
        c1;;

let rec combine = function f -> function ch1 -> function ch2->
    if est_vide ch1 || est_vide ch2 then ""
    else
        let c = f(prem_lettre ch1) (prem_lettre ch2) in
        c^combine f(reste_mot ch1)(reste_mot ch2);;

let corriger_vecteur = combine et_logique;;


let calculer_primeV1 = function vect_deplac -> function vect_ferm ->  function vect_conge ->
    let correc1 = corriger_vecteur vect_deplac vect_ferm in 
    (* on corrige une premeir fois avec jour ferme *)
    let correc2 = corriger_vecteur correc1 vect_conge in
    (* on ocrrige une secodne fois avec conge *)
     calculer_primeV0 correc2;;

     