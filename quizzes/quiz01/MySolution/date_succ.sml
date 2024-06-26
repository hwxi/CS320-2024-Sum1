
type date =
{year: int, month: int, day: int}
	 
val today = {year=2024, month=5, day=31}

exception NotImplemented

fun is_leap(year: int): bool = 
    (year mod 400 = 0) orelse (year mod 4 = 0 andalso year mod 100 <> 0)

fun days_in_month(month: int, year:int): int =
    case month of 
      1 => 31
    | 2 => if is_leap(year) then 29 else 28
    | 3 => 31
    | 4 => 30
    | 5 => 31
    | 6 => 30
    | 7 => 31
    | 8 => 31
    | 9 => 30
    | 10 => 31
    | 11 => 30
    | 12 => 31
    

fun date_succ(date: date):date =
    let
        val {year, month, day} = date
        val case_check = days_in_month(month, year)
    in
        if day < case_check then
            {year = year, month=month, day=day+1}
        (*in same month*)
        else if month <12 then 
            {year = year, month = month+1, day=1}
        (*in same year*)
        else
            {year= year+1, month=1, day=1}
    end
(*
//
Year X is a leap year if
(1) X is a mutiple of 400, or
(2) X is a mutiple of 4 but not a mutiple of 100
For instance, year 2024 is a leap year.
//
In a leap year, there are 29 days in February.
In a non-leap year, there are only 28 days in February.
//
*)


(*
Given a valid date of a day, [date_succ] returns
the date of the following day.
*)
(*
fun
date_succ(date: date): date = raise NotImplemented
*)
(* ****** ****** *)

(*
Please give your implementation of [date_succ] below *)

(* ****** ****** *)

(* end of [quizzes/quiz01/date_succ.sml] *)
