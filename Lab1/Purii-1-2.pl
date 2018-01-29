/* Показує (кінотеатр (код кінотеатру, назва, адреса, телефон, кількість місць), кінофільм (код кінофільму, назва, рік випуску, режисер, кількість серій), дата, час, виручка за сеанс). */
showing(cinema(1, 'Boomer', '4, Lavrykhina st., Kyiv', '+380679778833', 800), movie(5726616, 'Call Me by Your Name', 2017, 'Luca Guadagnino', 1), '25.01.2018', '18:30', 1200).
showing(cinema(2, 'Zhovten', '26, Konstantynivska st., Kyiv', '+380445678782', 450), movie(5726616, 'Call Me by Your Name', 2017, 'Luca Guadagnino', 1), '26.01.2018', '21:10', 2600).
showing(cinema(2, 'Zhovten', '26, Konstantynivska st., Kyiv', '+380445678782', 450), movie(0309987, 'The Dreamers', 2003, 'Bernardo Bertolucci', 1), '19.01.2018', '22:30', 900).
showing(cinema(5, 'Lira', '40, Zhytomyr st., Kyiv', '+380442724100', 270), movie(1844624, 'American Horror Story', 2011, 'Brad Falchuk', 7), '26.01.2018', '13:50', 9090).
showing(cinema(5, 'Lira', '40, Zhytomyr st., Kyiv', '+380442724100', 270), movie(1714915,'Only Lovers Left Alive', 2013, 'Jim Jarmusch', 1), '25.01.2018', '17:10', 4000).

/* 
Телефон кінотеатру, що показує потрібний фільм 
X - назва фільму
Y - номер телефону кінотеатру
*/
getPhoneByMovie(X,Y):-showing(cinema(_,_,_,Y,_),movie(_,X,_,_,_),_,_,_).

/* 
В яких кінотеатрах йдуть фільми заданого режисера 
X - повне ім'я режисера
Y - назва кінотеатру
*/
getCinemaByDirector(X,Y):-showing(cinema(_,Y,_,_,_),movie(_,_,_,X,_),_,_,_).

/*
Сеанси фільму
X - назва фільму
Y - дата сеансу
Z - час сеансу
*/
getShowsByMovie(X,Y,Z):-showing(_,movie(_,X,_,_,_),Y,Z,_).

/*
Фільми в кінотеатрі у вказаний день
X - назва кінотеатру
Y - дата
Z - назва фільму
*/
getMovies(X,Y,Z):-showing(cinema(_,X,_,_,_),movie(_,Z,_,_,_),Y,_,_).

/* 
Фільми режисера
X - назва фільму
Y - повне ім'я режисера
*/
getDirectorByMovie(X,Y):-showing(_,movie(_,X,_,Y,_),_,_,_).
