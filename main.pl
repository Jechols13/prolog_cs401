
% is_a is a dynamic rule that take two aruments.
:- dynamic is_a/2.

main :-
    prompt1(">"),
    read(X),
    % the next part will be either input or query,
    % We will base this on 
    % input
    atomic_list_concat([N1, N2], ' is a ', X),
    assert(is_a(N1, N2)),
    write("Ok.");


    % query
    % We'll need to write one of these as a response, to be changed.
    %write("Yes."); write("No."); write("Unknown."),
    nl,
    main. 


last_char(STR) :-
    string_length(STR, X),
    LEN_MINUS_ONE is X -1,
    sub_string(STR, LEN_MINUS_ONE, 1, 0, Y),
    write(Y).