main :-
        write('Welcome to Branwins therapy. Please enter all sentences with quotation marks. Eneter in QUIT at any point, after your name, time to exit.'),nl,
        write('--> --> --> --> --> --> --> --> --> --> --> --> --> --> -->'), nl, 
        write('--> --> --> --> --> --> --> --> --> --> --> --> --> --> -->'), nl,
        write('Hi, what is your name?'),nl,
        read(X),
        write('Hello, ' ), write(X), write(', how are you today?'),nl,
        read(Y), 
        split_string(Y, ' ',' ', List),
        read_stmts(List).

read_stmts(List) :- 
                nth0(I, List, X, R),write(X), %indexing through list. I is index, list, res, rest of list.
                (X = "this"), (Y = "is") -> write('What else do you regard as too much?');      
                (X = "mother"); (X = "father"); (X = "sister"); (X = "brother") -> write('Tell me more about your family');
                (X = "why") -> write('Why should you what?');
                (X = "good") -> write('Thats good to hear!');
                (X = "bad") -> write('Will food make it better');
                (X = "yes") -> write('Perfect!');
                (X = "no") -> write('Sorry I couldnt help');
                (X = "hello"); (X = "hey"); (X = "hi") -> write('Hello, how are you?');
                (X = "quit") ->write('Nice conversation, chat later!'), nl, halt();
                write("I don't understand. Tell me more."), read_stmts(List).

            




    