main :-
        write('Welcome to Branwins therapy. Please enter all sentences with quotation marks. Eneter in QUIT at any point, after your name, in time to exit.'),nl,
        write('--> --> --> --> --> --> --> --> --> --> --> --> --> --> -->'), nl, 
        write('--> --> --> --> --> --> --> --> --> --> --> --> --> --> -->'), nl,
        write('Hi, what is your name?'),nl,
        read(X),
        write('Hello, ' ), write(X), write(', how are you today?'),nl,
        keep_going.

keep_going :- %figure out a way to loop this and keep reading in input
        read(Y), 
        split_string(Y, ' ',' ', List),
        read_stmts(List,_),
        keep_going.

read_stmts(List, Y) :- 
                %will change to while loop 
                nth0(0, List, X, R), %indexing through list. I is index, list, res, rest of list.
                ((X = "this"), (Y = "is") -> write('What else do you regard as too much?'), nl, keep_going;      
                ((X = "mother"); (X = "father"); (X = "sister"); (X = "brother")) -> write('Tell me more about your family'), nl, keep_going;
                (X = "why") -> write('Why should you what?'), nl, keep_going;
                (X = "good") -> write('Thats good to hear!'), nl, keep_going;
                (X = "bad") -> write('Will food make it better?'), nl, keep_going;
                (X = "yes") -> write('Perfect!'), nl, keep_going;
                (X = "no") -> write('Sorry I couldnt help'), nl, keep_going;
                (X = "hello"); (X = "hey"); (X = "hi") -> write('Hello, how are you?'), nl, keep_going;
                (X = "quit") ->write('Nice conversation, chat later!'), nl, halt();
                write("I don't understand. Tell me more."), nl, keep_going).





    