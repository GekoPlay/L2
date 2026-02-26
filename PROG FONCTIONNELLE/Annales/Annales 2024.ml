(* Annales 2024 *)

let est_vide = function mot -> (mot = "") ;;
let prem_lettre = function ch -> String.sub ch 0 1;;
let reste_mot = function ch -> String.sub ch 1 ((String.length ch) - 1);;

let suivant s =
  if s = "" then "" 
  else
    let c = s.[0] in                 (* On récupère le premier caractère de la chaîne *)
    let code = char_of_int (int_of_char c + 1) in (* On calcule le caractère suivant *)
    String.make 1 code;;             (* On transforme ce caractère en chaîne de 1 élément *)


(* QUESTION 1 *)

(* 1.1 *) 
let rec lettre_se_suivent = function ch1 ->
  if est_vide ch1 || est_vide (reste_mot ch1) then
    false
  else
    if suivant(prem_lettre ch1) = prem_lettre (reste_mot ch1) then
      true
    else
      lettre_se_suivent (reste_mot ch1)



let rec lettres_idem = function ch1 ->
  if est_vide ch1 || est_vide (reste_mot ch1) then
    false
  else
    if prem_lettre(reste_mot ch1) = prem_lettre ch1 then
      true
    else
      lettres_idem (reste_mot ch1);;


let rec test_prop =  function generalise-> function ch1->
   if est_vide ch1 || est_vide (reste_mot ch1) then
    false
  else
    if generalise(prem_lettre(ch1)) (prem_lettre (reste_mot ch1)) then
      true
    else
      test_prop generalise (reste_mot ch1);;

let est_identique = function ch1 ->function ch2 ->
  ch1 = ch2;;

let est_suivant = function ch1 -> function ch2 ->
  suivant ch1 = ch2;;

let lettres_idemV2 = test_prop est_identique;;

let lettre_se_suiventV2 = test_prop est_suivant;;


(* (string->string -> string) -> string -> bool *)