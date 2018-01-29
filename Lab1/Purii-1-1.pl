/* Кінотеатр (код кінотеатру, назва, адреса, телефон, кількість місць). */
cinema(1, 'Boomer', '4, Lavrykhina st., Kyiv', '+380679778833', 800).
cinema(2, 'Zhovten', '26, Konstantynivska st., Kyiv', '+380445678782', 450).
cinema(3, 'Wizoria', '1, Verbytsky st., Kyiv', '+380638080700', 380).
cinema(4, 'Shevchenko', '49, Vyshgorod st., Kyiv', '+380444305148', 700).
cinema(5, 'Lira', '40, Zhytomyr st., Kyiv', '+380442724100', 270).

/* Кінофільм (код кінофільму, назва, рік випуску, режисер, кількість серій). */
movie(0309987, 'The Dreamers', 2003, 'Bernardo Bertolucci', 1).
movie(5726616, 'Call Me by Your Name', 2017, 'Luca Guadagnino', 1).
movie(1714915,'Only Lovers Left Alive', 2013, 'Jim Jarmusch', 1).
movie(0099785, 'Home Alone', 1990, 'Chris Columbus', 5).
movie(1844624, 'American Horror Story', 2011, 'Brad Falchuk', 7).

/* Показує (код кінотеатру, код кінофільму, дата, час, виручка за сеанс). */
showing(1, 5726616, '25.01.2018', '18:30', 1200).
showing(2, 5726616, '26.01.2018', '21:10', 2600).
showing(2, 0309987, '19.01.2018', '22:30', 900).
showing(5, 1844624, '26.01.2018', '13:50', 9090).
showing(3, 1714915, '25.01.2018', '17:10', 4000).

/* 
Телефон кінотеатру, що показує потрібний фільм 
X - назва фільму
Y - номер телефону кінотеатру
*/
getPhoneByMovie(X,Y):-movie(A,X,_,_,_),showing(B,A,_,_,_),cinema(B,_,_,Y,_).

/* 
В яких кінотеатрах йдуть фільми заданого режисера 
X - повне ім'я режисера
Y - назва кінотеатру
*/
getCinemaByDirector(X,Y):-movie(A,_,_,X,_),showing(B,A,_,_,_),cinema(B,Y,_,_,_).

/*
Сеанси фільму
X - назва фільму
Y - дата сеансу
Z - час сеансу
*/
getShowsByMovie(X,Y,Z):-movie(A,X,_,_,_),showing(_,A,Y,Z,_).

/*
Фільми в кінотеатрі у вказаний день
X - назва кінотеатру
Y - дата
Z - назва фільму
*/
getMovies(X,Y,Z):-cinema(A,X,_,_,_),showing(A,B,Y,_,_),movie(B,Z,_,_,_).

/* 
Фільми режисера
X - назва фільму
Y - повне ім'я режисера
*/
getDirectorByMovie(X,Y):-movie(_,X,_,Y,_).
