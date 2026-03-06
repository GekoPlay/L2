



type rat = Crat of int * int ;;

let creer_rat -> function a -> function b -> Crat(a,b);;

function nummer -> function Crat(n,_) -> n;;
function denom -> function Crat(_,d) -> d;;


let print_rat = function rat ->
    let num = numer rat
    and let denum = denom rat in
    "( " ^ num ^ " , " ^ denum ^ " )";;

let div_rat = function rat ->
    let num = numer rat
    and let denum = denom rat in
    num / denum;;

    let mult_rat = function rat ->
    let num = numer rat
    and let denum = denom rat in
    num * denum;;

    let inverse_rat = function rat ->
    let num = denom rat
    and denum = numer rat in
    creer_rat ( num , denum);;

    let egal_rat = function rat ->
    let num = numer rat
    and let denum = denom rat in
    num = denum;;


