(* ****** ****** *)

use "./../../assign02-lib.sml";

(* ****** ****** *)

(*
//
Assign02-01: 10 points
//
Please implement a function
that computes the size of an xlist DIRECTLY:
//
fun xlist_size(xs: 'a xlist): int
//
That is, you should NOT convert xlist into list
and then compute the size of the converted list
//
*)

(* ****** ****** *)

(*
fun
xlist_size
(xs: 'a xlist): int = raise NotImplemented320
*)

(* ****** ****** *)

(*
datatype 'a xlist =
xlist_nil
|
xlist_cons of ('a * 'a xlist)
|
xlist_snoc of ('a xlist * 'a)
|
xlist_append of ('a xlist * 'a xlist)
|
xlist_reverse of ( 'a xlist )
*)

fun xlist_foreach
(xs: 'a xlist, work: 'a -> unit): unit =
let
fun
worklst(xs: 'a xlist): unit =
case xs of
xlist_nil => ()
|
xlist_cons(x1, xs) => (work(x1); worklst(xs))
|
xlist_snoc(xs, x1) => (worklst(xs); work(x1))
|
xlist_append(xs, ys) => (worklst(xs); worklst(ys))
|
xlist_reverse(xs) => rworklst(xs)

and
rworklst(xs: 'a xlist): unit =
case xs of
xlist_nil => ()
|
xlist_cons(x1, xs) => (rworklst(xs); work(x1))
|
xlist_snoc(xs, x1) => (work(x1); rworklst(xs))
|
xlist_append(xs, ys) => (rworklst(ys); rworklst(xs))
|
xlist_reverse(xs) => worklst(xs)
in
    worklst(xs)
end

(* ****** ****** *)

(* end of [CS320-2024-Sum1-assign02-01.sml] *)

			    
