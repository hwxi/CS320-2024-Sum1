fun
list_foldleft
(xs: 'a list, r0: 'b, f0: 'b * 'a -> 'b): 'b =
case xs of [] => r0
	 | x1 :: xs => list_foldleft(xs, f0(r0, x1), f0)

fun
list_reverse(xs: 'a list): 'a list =
list_foldleft(xs, [], fn(r0, x1) => x1 :: r0)
				    
(*
fun
list_foldright
(xs: 'a list, r0: 'b, f0: 'a * 'b -> 'b): 'b =
case xs of [] => r0
	 | x1 :: xs => f0(x1, list_foldright(xs, r0, f0))
*)

fun
list_foldright
(xs: 'a list, r0: 'b, f0: 'a * 'b -> 'b): 'b =
list_foldleft
(list_reverse(xs), r0, fn(r0, x1) => f0(x1, r0))

fun
list_append
(xs: 'a list, ys: 'a list): 'a list =
list_foldleft(xs, ys, fn(r0, x1) => x1 :: r0)

fun
list_map (* = list_map_list *)
(xs: 'a list, fopr: 'a -> 'b): 'b list =
list_foldright(xs, [], fn(x1, r0) => fopr(x1) :: r0)

fun
list_maprev (* = list_map_list *)
(xs: 'a list, fopr: 'a -> 'b): 'b list =
list_foldleft(xs, [], fn(r0, x1) => fopr(x1) :: r0)

(* ************************************************ *)

fun
int1_foldleft
(xs: int, r0: 'a, f0: 'a * int -> 'a): 'a =
let
  fun loop(i, res) =
  if i < xs then loop(i+1, f0(res, i)) else res
in
  loop(0, r0)
(* Python:
   res = r0;
   for i in range(xs): res = f0(i, res); res *)
end

(* ************************************************ *)

fun pow(x: int, n: int): int =
int1_foldleft(n, 1, fn(r, i) => r * x)

fun fact(n: int): int =
int1_foldleft(n, 1, fn(r, i) => (i+1)*r)

fun fibo(n: int): int =
#1(int1_foldleft(n, (0, 1), fn((f0, f1), _) => (f1, f0+f1)))

(* ************************************************ *)

fun
int1_foldright
(xs: int, r0: 'a, f0: int * 'a -> 'a): 'a =
if xs <= 0 then r0
           else int1_foldright(xs-1, f0(xs-1, r0), f0)

(*
HX: list_tabulate
*)
fun
int1_map_list
(xs: int, fopr: int -> 'a): 'a list =
int1_foldright(xs, [], fn(x1, r0) => fopr(x1) :: r0)

(* ************************************************ *)

fun
list_range(n: int): int list = int1_map_list(n, fn x1 => x1)

(* ************************************************ *)

fun
string_foldleft
(cs: string, r0: 'a, f0: ('a * char) -> 'a): 'a =
int1_foldleft
( String.size(cs)
, r0, fn(r0, i1) => f0(r0, String.sub(cs, i1)))

fun
string_foldright
(cs: string, r0: 'a, f0: (char * 'a) -> 'a): 'a =
int1_foldright
( String.size(cs)
, r0, fn(i1, r0) => f0(String.sub(cs, i1), r0))

fun
string_map_list(cs, fopr) =
string_foldright(cs, [], fn(ch, r0) => fopr(ch) :: r0)

fun explode(cs) = string_map_list(cs, fn c => c)

(* ************************************************ *)
