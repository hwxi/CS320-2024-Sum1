(*
Final: Question 21
(* ****** ****** *)
This question is worth 15 points.
(* ****** ****** *)
Given two integer lists xs and ys, please implement
list_sublist(xs, ys) which tests whether xs is a (consecutive)
sublist of ys. Note that [] is a sublist of any list. For example:
list_sublist ([2,4], [1,2,3,4,5]) = false
list_sublist ([2,3,4], [1,2,3,4,5]) = true
list_sublist ([4,5,6], [1,2,3,4,5]) = false

Your implementation cannot use explicit recursion. It can only use
list_length, list_head (head of a given list), and list_tail (tail of
a given list) in addition to list_foldleft and/or list_foldright.
(You can also use list_prefix mentioned above even if you do not implement it).
*)

(* ****** ****** *)

val list_sublist = ...

(* ****** ****** *)
		       
(* end of [final-q21.sml] *)
		       
