
% is_a is a dynamic rule that take two aruments.
:- dynamic is_a/2.

% is A a B?
check_is_a(A, B) :- is_a(A, B).
% is A a B that is a C?
check_is_a(A, C) :-
    is_a(A, B),
    check_is_a(B, C).

main :-
    write("> "),
    read_line_to_codes(user_input, Input),
    deleteLastElement(Input, WithoutPunc),
    string_to_atom(WithoutPunc, IA),
    (
        type_is_query(Input) -> quer(IA)
        ; stmt(IA)
    ),
    main.


stmt(IA) :-
    atomic_list_concat(List_atoms,' is a ',IA),     % split on ' is a '
    List_atoms = [First | _],                       % First = the first in the list
    string_to_atom(Str, First),                     % convert First into string
    %atomic_list_concat([_ | Clean_first],'A ',Str), % Split 'A ' off the beginning of first
    split_string(Str, "", "A ", Clean_first),
    Clean_first = [Almost_first | _],                % Take the 2nd part (effectively stripping 'A ' off)
    string_to_atom(Almost_first, Final_first),
    List_atoms = [First, Last],                     % Assign Last to last element of the original list
    assert(is_a(Final_first, Last)),                % Finally, assert the new rule
    write("Ok."), nl.                                   % Print ok


quer(IA) :-
    %TODO: optionally split the 'a' off, only if it is there
    atomic_list_concat(List_atoms, 'Is a ', IA),    % split into list based on 'Is a '
    atomic_list_concat(List_atoms, '' , EndStr),    % glue back into string
    string_to_atom(EndStr, SplitMe),                % convert string into atom
    atomic_list_concat(Split, ' a ', SplitMe),      % split into list around ' a ' 
    Split = [First, Last],                          % Assign separate variables
    (
        check_is_a(First, Last) -> write("Yes."), nl
        ; write("No."), nl
    ).

% define what an 'I/i' is
is_I(73).
is_I(105).

% remove last element (for removing punctuation from my input (?/.))
deleteLastElement([_], []).
deleteLastElement([Head, Next|Tail], [Head|NTail]):-
  deleteLastElement([Next|Tail], NTail).

% Since all queries begin with the word "is", I will check if the first letter is an "i" or not
type_is_query(Input) :-
    Input = [FirstCode | _],
    is_I(FirstCode).

% maybe this offers some insight: https://stackoverflow.com/questions/37380645/prolog-type-errors-with-dcg-library-functions