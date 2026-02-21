let prem_car = function ch -> String.sub ch 0 1;;
let reste_mot = function ch -> String.sub ch 1 ((String.length ch) - 1);;
let est_vide = function mot -> (mot = "") ;;
let est_voyelle = function caract -> ((caract = "a") || (caract = "e") || (caract = "i") || (caract = "o") || (caract = "u") || (caract = "y"));;
let est_ponctuation = function caract -> ((caract = ",") || (caract = "'") || (caract = ";") || (caract = ":") || (caract = "!") || (caract = "?") || (caract = ".")|| (caract = " "));;
let caractere_min =function char-> String.lowercase_ascii char;;

let derniere_lettre = function ch -> 
  String.sub ch ((String.length ch) - 1) 1;;
let reste_mot_milieu mot =
  let n = String.length mot in
  if n <= 2 then
    ""
  else
    String.sub mot 1 (n - 2)
;;
(*TES*)

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


let mult2 = function nmbre->
nmbre * 2;;

let div2 = function nmbre ->
nmbre / 2;;

let rec mult_egyptien = function x -> function y ->
if x = 1 then y
else
	if x mod 2 = 0 then
	mult_egyptien (div2 x) (mult2 y)
	else
	mult_egyptien (x-1) y + y ;;

	let rec compte_lettres = function phrase -> function lettre ->
	if est_vide phrase then
		0
	else
	if prem_car phrase = lettre then
		1 + compte_lettres (reste_mot phrase) lettre
	else
		compte_lettres (reste_mot phrase) lettre;;


		let rec supprime_voyelles = function phrase ->
if est_vide phrase then
""
else
	if est_voyelle (prem_car phrase) then
		supprime_voyelles (reste_mot phrase)
	else
		prem_car phrase ^ supprime_voyelles (reste_mot phrase);;



(*Question 6 TDs3&4*)
let rec palindrome mot =
  if est_vide mot || est_vide (reste_mot_milieu mot) then
    true
  else if prem_car mot = derniere_lettre mot then
    palindrome (reste_mot_milieu mot)
  else
    false
;;


(*retire la ponctuation et les majuscules*)
let rec mise_en_ligne = function phrase ->
	if est_vide phrase then
		""
	else
		if est_ponctuation(prem_car phrase)then
			mise_en_ligne(reste_mot phrase)
		else
			caractere_min(prem_car phrase) ^ mise_en_ligne (reste_mot phrase);;

let rec palindrome_phrase = function phrase ->
	let nv_phrase = mise_en_ligne phrase in
	palindrome nv_phrase;;
 

	(*Question 7 TDs3&4*)
let rec compte_mot = function phrase ->
	if est_vide phrase || est_vide (reste_mot phrase) then
		1 (*on met 1 car on considere que la pharse ne commence pas par un espace mais par un mot*)
	else
	let char = prem_car phrase in
if char = " " then
		 1 + compte_mot(reste_mot phrase)
else
	compte_mot(reste_mot phrase);;
	
	
	(*Question 8 TDs3&4*)

let rec motCache = function phrase -> function mot ->
	if est_vide phrase  then
		false
	else
		if est_vide mot then
			true
		else
		let phrase_maj = mise_en_ligne phrase in
		if prem_car phrase_maj = prem_car mot then
			motCache (reste_mot phrase_maj) (reste_mot mot)
		else
			motCache (reste_mot phrase_maj) mot
