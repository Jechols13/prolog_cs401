:-style_check(-singleton).

main :-
        write('Welcome to Branwins therapy. Please enter all sentences with DOUBLE QUOTATION marks. Eneter in QUIT at any point, after your name, in time to exit.'),nl,
        write('---------------------------------------------'), nl, 
        write('---------------------------------------------'), nl,
        write('Hi, what is your name?'),nl,
        read(_Input),
        write('Hello, ' ), write(_Input), write(', how are you today?'),nl,
        keep_going.

keep_going :-  %loop this and keep reading in input
        read(Y),
        string_lower(Y,Lowercase),
        split_string(Lowercase, ' ','. ? ! ', List), write(List),nl, %first split at whitespaces, else split at punctuation
        (read_stmts(List),nl ;  write("I dont understand. Tell me more."),nl),
        keep_going.

read_stmts(List) :-
        ((nth0(Index, List, X, R),nth0(Index, R, Y, R1)); %find first and second word (if it exists) OR
        nth0(Index, List, X, R)), %finds first word. AND
        (
                ((X == "this"), (Y == "is")) -> write('What else do you regard as '),atomic_list_concat(R1, ' ', Atom), atom_string(Atom, String), write(String), write('?');
                ((X == "im"), (Y == "ok")) -> write('Why just ok?');
                ((X == "mother"); (X == "father"); (X == "sister"); (X == "brother")) -> write('Tell me more about your family');
                (X == "why") -> write('Why should you what?');
                (X == "movie") -> write('A good movie is Snpw pn da Bluff. Check it out?');
                (X == "died") -> write('Im so sorry to hear that?');
                (X == "food") -> write('Now is not the time to be thinking about food.');
                (X == "why") -> write('Why should you what?');
                (X == "good") -> write('Thats good to hear!');
                (X == "bad") -> write('Will food make it better?');
                (X == "yes") -> write('Perfect!');
                (X == "birthday") -> write('Happy birthday!');
                (X == "uab") -> write('SWEET! I know a cool guy named Muhammad that goes there.');
                (X =="school") -> write('What school do you attend?');
                (X == "sports") -> write('I see your a sports fan. I must ask, Auburn or Alabama?');
                (X == "auburn") -> write('WAR EAGLE!');
                (X == "alabama") -> write('ROLL TIDE!');
                (X == "beautiful") -> write('Looks can be decieving someimes.');
                (X == "no") -> write('Sorry I couldnt help');
                (X == "sick") -> write('Get well soon.');
                ((X == "thank"); (X == "thanks")) -> write('My pleasure.');
                (X == "quit") ->write('Nice conversation, chat later!'), nl, halt()
        );
        % if X not the end of list continue, otherwise propmt for more input
        (not(last(R,X)), read_stmts(R)).