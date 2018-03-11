
% is_a is a dynamic rule that take two aruments.
:- dynamic is_a/2.
% TODO: need a way to check if x is a z by finding a y so that x is a y and y is a z.

main :-
    prompt1("> "),
    read(X),
    write(X),
    term_string(X, STR),
    string_length(STR, LEN),
    LEN_MINUS_ONE is LEN-1,
    sub_string(STR, LEN_MINUS_ONE, 1, 0, PUNCT),
    write(PUNCT),
    main.

    %(PUNCT is "." ->
    % the next part will be either input or query,
    % We will base this on 
    % input
    %atomic_list_concat([N1, N2], ' is a ', X),
    %assert(is_a(N1, N2)),
    %write("Ok."),
    %nl,
    %main_loop;

    %PUNCT is "?" ->
    % query
    % We'll need to write one of these as a response, to be changed.
    %write("Yes."); write("No."); write("Unknown."),
    %nl,
    %main. 


last_char(STR) :-
    string_length(STR, LEN),
    LEN_MINUS_ONE is LEN -2,
    sub_string(STR, LEN_MINUS_ONE, 1, 0, PUNCT),
    write(PUNCT), nl.

str_test() :-
    read_line_to_codes(user_input, X),
    term_string(X, STR),
    last_char(STR),
    (string(STR) ->
        write("X is a string."),nl;
     compound(STR) ->
        write(STR),nl;
     atom(STR) ->
        write("X is atom.")).

new_main :-
    write("> "),
    read_line_to_codes(user_input, Input),
    deleteLastElement(Input, WithoutPunc),
    string_to_atom(WithoutPunc, IA),
    (
        type_is_query(Input) -> quer(IA)
        ; stmt(IA)
    ),
    new_main.


stmt(IA) :- % TODO: still need to split off last period
    atomic_list_concat(List_atoms,' is a ',IA),     % split on ' is a '
    List_atoms = [First | _],                       % First = the first in the list
    string_to_atom(Str, First),                     % convert First into string
    atomic_list_concat([_ | Clean_first],'A ',Str), % Split 'A ' off the beginning of first
    Clean_first = [Final_first | _],                % Take the 2nd part (effectively stripping 'A ' off)
    List_atoms = [First, Last],                     % Assign Last to last element of the original list
    assert(is_a(Final_first, Last)),                % Finally, assert the new rule
    write("Ok."), nl.                                   % Print ok


quer(IA) :- % TODO: still need split off last period 
    atomic_list_concat(List_atoms, 'Is a ', IA),    % split into list based on 'Is a '
    atomic_list_concat(List_atoms, '' , EndStr),    % glue back into string
    string_to_atom(EndStr, SplitMe),                % convert string into atom
    atomic_list_concat(Split, ' a ', SplitMe),      % split into list around ' a ' 
    Split = [First, Last],                          % Assign separate variables
    (
        is_a(First, Last) -> write("Yes."), nl
        ; write("No."), nl
    ).

is_I(73).
is_I(105).
deleteLastElement([_], []).
deleteLastElement([Head, Next|Tail], [Head|NTail]):-
  deleteLastElement([Next|Tail], NTail).

type_is_query(Input) :-
    Input = [FirstCode | _],
    is_I(FirstCode).

% maybe this offers some insight: https://stackoverflow.com/questions/37380645/prolog-type-errors-with-dcg-library-functions


some_glue :-
    write("This was true"); write("This was false").
% prolog if then else https://stackoverflow.com/questions/2849045/if-in-prolog