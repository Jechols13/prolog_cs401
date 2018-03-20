% This program was written with much frustration and tears.
% Here is the general gist:
%  * The predicate "main" is the main entry point to this program.
%    - Main calls itself recursively without a base case to create
%      the main program loop.
%  * The predicate "is_a" is the rule that the users will assert
%  * The predicate "check_is_a" is called for the users' queries.
%    - This allows chains like "A is a B. B is a C. Is A a C?" 
%      to work correctly.
%  * "stmt" and "quer" are the delegate predicates that main calls
%     after figuring out the type of the user input.
%  * "type_is_query" will check the first letter of the input (via
%     the "is_I" predicates) and return true if the type is query.
%  * "deleteLastElement" is a helper predicate used for removing the
%    punctuation


% is_a is a dynamic rule that take two aruments.
% this is the rule that will be asserted/queried for everything
% the user says/asks
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
    split_string(Str, "", "A ", Clean_first),
    Clean_first = [Almost_first | _],                % Take the 2nd part (effectively stripping 'A ' off)
    string_to_atom(Almost_first, Final_first),
    List_atoms = [First, Last],                     % Assign Last to last element of the original list
    assert(is_a(Final_first, Last)),                % Finally, assert the new rule
    write("Ok."), nl.                                   % Print ok


quer(IA) :-
    atomic_list_concat(List_atoms, 'Is ', IA),      % split into list based on 'Is a '
    atomic_list_concat(List_atoms, '' , EndStr),    % glue back into string
    split_string(EndStr, "", "a ", GoStr),          % OPTIONALLY split the first 'a' off of the string
    GoStr = [GoStr1],
    string_to_atom(GoStr1, SplitMe),                % convert string into atom
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