:-style_check(-singleton).

main :- %beginning of program
        write("Hello, im an attempt at an AI."),nl,
        write('---------------------------------------------'), nl, 
        write("Eneter in QUIT at any point, after your name, in time to exit."),nl,
        write('---------------------------------------------'), nl,
        write('Hi, what is your name?'),nl,
        read_line_to_codes(user_input, Input),
        string_to_atom(Input, Name),
        write('Hello, ' ), write(Name), write(', how are you today?'),nl,
        keep_going.

keep_going :-  %loop this and keep reading in input
        read_line_to_codes(user_input, Input),
        string_to_atom(Input, Y),
        string_lower(Y,Lowercase),                   %converts string to lowercase (will match against lowercase letters) 
        split_string(Lowercase, ' ','. ? ! ', List), %first split at whitespaces, else split at punctuation
        (read_stmts(List),nl ;  write("I dont understand. Tell me more."),nl), % call read_stmts and find a match or require more input.
        keep_going.

read_stmts(List) :- %uses tail recursion to match X against any index in the list.
        ((nth0(Index, List, X, R),nth0(Index, R, Y, R1)); %find first and second word (if it exists) OR
        nth0(Index, List, X, R)), %finds first word. AND
        (
                ((X == "this"), (Y == "is")) -> write('What else do you regard as '),atomic_list_concat(R1, ' ', Atom), atom_string(Atom, String), write(String), write('?');
                ((X == "im"), ((Y == "ok");(Y == "okay"))) -> write('Why just ok?');
                ((X == "mother"); (X == "father");
                 (X == "mom"); (X == "dad");
                 (X == "sister"); (X == "brother")) -> write('Tell me more about your family');
                (X == "why") -> write('Why should you what?');
                (X == "you") -> write('Enough about me, tell me a little about you.');
                (X == "movie") -> write('Justice League is a good movie. Check it out!');
                (X == "died") -> write('Im so sorry to hear that?');
                (X == "food") -> write('Now is not the time to be thinking about food.');
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
        (not(last(R,X)), read_stmts(R)).  % if X not the end of list continue.