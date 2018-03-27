:-style_check(-singleton).

main :-
    read_line_to_codes(user_input, Input),
    string_to_atom(Input, Y),
    split_string(Y, ' ',' !.?', List),write(List),nl, %first split at whitespaces
    (
        nth0(Index, List, X, R),
        (
            (X == "A") -> nth0(Index,R,This,R1),nth0(Index,R1,IS,R2),(IS=="is"),nth0(Index,R2,A,R3),(A=="a"),
                          nth0(Index,R3,That,R4),assert(produce(This,That)),write("ok"),nl,main;

            (X == "Is") -> nth0(Index,R,This,R1),nth0(Index,R1,A,R2),nth0(Index,R2,That,R3),((check_produce(This, That)->write("Yes")),nl,main;write("no"),nl,main);

            nth0(Index,R,IS,R1),(IS=="is"),nth0(Index,R1,A,R2),(A=="a"),nth0(Index,R2,That,R3),assert(produce(X,That)),write("ok"),nl,main;

            write("say what?"),nl,main
         )
    ).
:- dynamic produce/2.

check_produce(X,Y) :-
    produce(X,Y).

check_produce(X,Y):-
    produce(X,Z),produce(Z,Y).

%------------------------------------------------------------------------------------------%
%------------------------------------------------------------------------------------------%
%------------------------------------------------------------------------------------------%

psychiatrist:-
    write("Hello, I am your psychiatrist. Talk to me"),nl,
    keep_asking.

keep_asking:-
    read_line_to_codes(user_input, Input),
    string_to_atom(Input, Y),
    string_lower(Y,Lowercase),
    split_string(Lowercase, ' ',' !.?', List), %first split at whitespaces then punctuation
        (
            member("smart",List) -> write("Yes Yes, I am a genius."),nl,keep_asking;
            member("branwin",List) -> write("Cool guy"),nl,keep_asking;
            member("mom",List) -> write("Hey thats my wife!"),nl,keep_asking;
            member("dad",List) -> write("Yes i am your father"),nl,keep_asking;
            member("hello",List) -> write("I didnt say hi"),nl,keep_asking;
            member("bye",List) -> write("Did I say you could go anywhere?"),nl,keep_asking;
            member("quit",List) -> write("Why are you leaving me?"),nl,keep_asking;
            member("good",List),member("point",List) -> write("I know, im pretty smart."),nl,keep_asking;
            member("dont",List) -> write("You dont want to do a lot of things, but you do."),nl,keep_asking;
            member("nice",List) -> write("It really is isnt it"),nl,keep_asking;
            write("say what?"),nl,keep_asking
        ).


