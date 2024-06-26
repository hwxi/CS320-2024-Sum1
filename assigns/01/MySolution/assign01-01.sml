(* ****** ****** *)

use "./../assign01-lib.sml";

(* ****** ****** *)

(*
fun
fact(x: int): int =
if x > 0 then x * fact(x-1) else 1
*)
val
rec
fact = fn(x: int) =>
if x > 0 then x * fact(x-1) else 1

(* ****** ****** *)

(* end of [CS320-2024-Sum1-assign01-01.sml] *)
