
% is_a is a dynamic rule that take two aruments.
:- dynamic is_a/2.

main_loop :-
    %prompt1(">"),
    read(X),
    % the next part will be either input or query,
    % We will base this on 
    % input
    write("Ok.");


    % query
    % We'll need to write one of these as a response, to be changed.
    write("Yes."); write("No."); write("Unknown."),
    nl,
    main_loop.