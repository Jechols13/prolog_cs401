:-style_check(-singleton).

main :-
        write('Welcome to Branwins therapy. Please enter all sentences with quotation marks. Eneter in QUIT at any point, after your name, in time to exit.'),nl,
        write('--> --> --> --> --> --> --> --> --> --> --> --> --> --> -->'), nl, 
        write('--> --> --> --> --> --> --> --> --> --> --> --> --> --> -->'), nl,
        write('Hi, what is your name?'),nl,
        read(_Input),
        write('Hello, ' ), write(_Input), write(', how are you today?'),nl,
        keep_going.

keep_going :- %figure out a way to loop this and keep reading in input
        read(Y),
        string_lower(Y,Lowercase), 
        split_string(Lowercase, ' ',' ', List),
        (read_stmts(List); write("I dont understand. Tell me more."),nl),
        keep_going.

read_stmts(List) :- 
                %will change to while loop 
               ((nth0(Index, List, X, R),nth0(Index, R, Y, R1)); %find first and second word (if it exists)
                nth0(Index, List, X, R)), %finds first word.
                (((X == "this"), (Y == "is")) -> write('What else do you regard as too much?'), nl, keep_going;      
                ((X == "mother"); (X == "father"); (X == "sister"); (X == "brother")) -> write('Tell me more about your family'), nl, keep_going;
                (X == "why") -> write('Why should you what?'), nl, keep_going;
                (X == "good") -> write('Thats good to hear!'), nl, keep_going;
                (X == "bad") -> write('Will food make it better?'), nl, keep_going;
                (X == "yes") -> write('Perfect!'), nl, keep_going;
                (X == "no") -> write('Sorry I couldnt help'), nl, keep_going;
                (X == "sick") -> write('Get well soon.'), nl, keep_going;
                (X == "thank"); (X == "thanks") -> write('My pleasure.'), nl, keep_going;
                (X == "quit") ->write('Nice conversation, chat later!'), nl, halt()); 

                % if X not the end of list continue, otherwise propmt for more input
                (not(last(R,X)), read_stmts(R)). 


    