--	-----------------------------------------------------------------------------------
--	Project Phase II
--	Group 8 (Get Movies & Chill)
--	Jasmine Dacones, Trinh Nguyen, Trung Thai
--	This script was executed on Microsoft SQL
--	===================================================================================
--	PART A - RELATIONAL SCHEMA
--	===================================================================================

--	Stores details for a movie: its unique ID, title, description, runtime, MPAA film
--	rating, its Rotten Tomatoes score, IMDB user rating, and when it was released

	CREATE TABLE MOVIES (  
		id					INTEGER			NOT NULL,  
		title               VARCHAR(50)		NOT NULL,  
		description         VARCHAR(500)				DEFAULT 'Unknown',
		runtime             INTEGER			NOT NULL,
		rating              VARCHAR(5)		NOT NULL	DEFAULT 'NR',
		rt_rating           INTEGER						CHECK(rt_rating <= 100),
		user_rating         DECIMAL(2,1)				DEFAULT 0.0		CHECK(user_rating <= 10.0),
		release_year        INTEGER			NOT NULL,   CHECK(release_year <= 2018),   
		director_id			INTEGER			NOT NULL	UNIQUE,
		PRIMARY KEY(id) 
	)

--	Stores the genres of each movie as there may be multiple for a movie

	CREATE TABLE GENRES (  
		movie_id			INTEGER			NOT NULL, 
		genre				VARCHAR(15)		NOT NULL,  
		PRIMARY KEY(movie_id, genre),
		FOREIGN KEY(movie_id) references MOVIES(id) ON DELETE CASCADE	ON UPDATE CASCADE
	)

--	Stores the places a movie can be viewed
	CREATE TABLE LOCATIONS (  
		movie_id			INTEGER			NOT NULL,  
		location			VARCHAR(25)		NOT NULL	DEFAULT 'YouTube', 
		PRIMARY KEY(movie_id, location),
		FOREIGN KEY(movie_id) references MOVIES(id) ON DELETE CASCADE	ON UPDATE CASCADE
	)

--	Stores the full name of a director for a movie
	CREATE TABLE DIRECTORS (  
		director_id			INTEGER			NOT NULL, 
		fname				VARCHAR(20)		NOT NULL	CHECK (fname > ''),
		lname				VARCHAR(20)		NOT NULL	CHECK (lname > ''), 
		PRIMARY KEY(director_id),
		FOREIGN KEY(director_id) references MOVIES(director_id) ON DELETE CASCADE	ON UPDATE CASCADE
	)

--	Stores the names of actors/actresses along with the role they play in a movie
	CREATE TABLE ROLES (  
		movie_id			INTEGER			NOT NULL, 
		actor_id			INTEGER			NOT NULL,  
		fname				VARCHAR(25)		NOT NULL,  
		lname				VARCHAR(25)		NOT NULL,  
		role				VARCHAR(25)		NOT NULL,  
		PRIMARY KEY(actor_id, movie_id),
		FOREIGN KEY(movie_id) references MOVIES(id) ON DELETE CASCADE  ON UPDATE CASCADE
	)

--	===================================================================================
--	PART B - SAMPLE DATA
--	===================================================================================

--	MOVIE 1 ---------------------------------------------------------------------------

	INSERT INTO 	MOVIES
	VALUES			(5000, 'Get Out', 'It''s time for a young African-American to meet with his white
					girlfriend''s parents for a weekend in their secluded estate in the woods, but 
					before long, the friendly and polite ambience will give way to a nightmare', 
					104, 'R', 99, 7.7, 2017, 1);

	INSERT INTO GENRES VALUES (5000, 'Horror');
	INSERT INTO GENRES VALUES (5000, 'Mystery');
	INSERT INTO GENRES VALUES (5000, 'Thriller');

	INSERT INTO LOCATIONS VALUES (5000, 'Amazon Video');
	INSERT INTO LOCATIONS VALUES (5000, 'Google Play');
	INSERT INTO LOCATIONS VALUES (5000, 'YouTube');
	INSERT INTO LOCATIONS VALUES (5000, 'HBO Go');

	INSERT INTO DIRECTORS VALUES (1, 'Jordan', 'Peele');

	INSERT INTO ROLES VALUES (5000, 100, 'Daniel', 'Kaluuya', 'Chris Washington');
	INSERT INTO ROLES VALUES (5000, 101, 'Allison', 'Williams', 'Rose Armitage');
	INSERT INTO ROLES VALUES (5000, 102, 'Catherine', 'Keener', 'Missy Armitage');	

--	MOVIE 2 ---------------------------------------------------------------------------

	INSERT INTO 	MOVIES
	VALUES			(5001, 'Jumanji: Welcome to the Jungle', 'Four teenagers are sucked into a magical
					video game, and the only way they can escape is to work together to finish the game.', 
					119, 'PG-13', 76, 7.2, 2017, 2);

	INSERT INTO GENRES VALUES (5001, 'Action');
	INSERT INTO GENRES VALUES (5001, 'Adventure');
	INSERT INTO GENRES VALUES (5001, 'Comedy');

	INSERT INTO LOCATIONS VALUES (5001, 'Theaters');

	INSERT INTO DIRECTORS VALUES (2, 'Jake', 'Kasdan');

	INSERT INTO ROLES VALUES (5001, 103, 'Dwayne', 'Johnson', 'Spencer');
	INSERT INTO ROLES VALUES (5001, 104, 'Kevin', 'Hart', 'Fridge');
	INSERT INTO ROLES VALUES (5001, 105, 'Jack', 'Black', 'Bethany');
	INSERT INTO ROLES VALUES (5001, 106, 'Karen', 'Gillan', 'Martha');
	INSERT INTO ROLES VALUES (5001, 107, 'Nick', 'Jonas', 'Alex');

--	MOVIE 3 ---------------------------------------------------------------------------

	INSERT INTO 	MOVIES
	VALUES			(5002, 'Deadpool', 'A fast-talking mercenary with a morbid sense of humor is
					subjected to a rogue experiment that leaves him with accelerated healing powers 
					and a quest for revenge.', 108, 'R', 83, 8.0, 2016, 3);

	INSERT INTO GENRES VALUES (5002, 'Action');
	INSERT INTO GENRES VALUES (5002, 'Adventure');
	INSERT INTO GENRES VALUES (5002, 'Comedy');

	INSERT INTO LOCATIONS VALUES (5002, 'Amazon Video');
	INSERT INTO LOCATIONS VALUES (5002, 'Google Play');
	INSERT INTO LOCATIONS VALUES (5002, 'YouTube');

	INSERT INTO DIRECTORS VALUES (3, 'Tim', 'Miller');

	INSERT INTO ROLES VALUES (5002, 108, 'Ryan', 'Reynolds', 'Wade');
	INSERT INTO ROLES VALUES (5002, 109, 'TJ', 'Miller', 'Weasel');

--	MOVIE 4 ---------------------------------------------------------------------------

	INSERT INTO 	MOVIES
	VALUES			(5003, 'Thor: Ragnarok', 'Thor is imprisoned on the other side of the universe
					and finds himself in a race against time to get back to Asgard to stop Ragnarok, 
					the destruction of his homeworld and the end of Asgardian civilization, at the 
					hands of an all-powerful new threat, the ruthless Hela.', 130, 'PG-13', 82, 8.0, 2017, 4);

	INSERT INTO GENRES VALUES (5003, 'Action');
	INSERT INTO GENRES VALUES (5003, 'Adventure');
	INSERT INTO GENRES VALUES (5003, 'Comedy');

	INSERT INTO LOCATIONS VALUES (5003, 'Theaters');

	INSERT INTO DIRECTORS VALUES (4, 'Taika', 'Waititi');

	INSERT INTO ROLES VALUES (5003, 110, 'Chris', 'Hemsworth', 'Thor');
	INSERT INTO ROLES VALUES (5003, 111, 'Tom', 'Hiddleston', 'Loki');
	INSERT INTO ROLES VALUES (5003, 112, 'Benedict', 'Cumberbatch', 'Doctor Strange');	

--	MOVIE 5 ---------------------------------------------------------------------------

	INSERT INTO 	MOVIES
	VALUES			(5004, 'Blade Runner 2049', 'A young blade runner''s discovery of a long-buried 
					secret leads him to track down former blade runner Rick Deckard, who''s been 
					missing for thirty years.', 164, 'R', 87, 8.2, 2017, 5);

	INSERT INTO GENRES VALUES (5004, 'Drama');
	INSERT INTO GENRES VALUES (5004, 'Mystery');
	INSERT INTO GENRES VALUES (5004, 'Sci-Fi');

	INSERT INTO LOCATIONS VALUES (5004, 'Theaters');

	INSERT INTO DIRECTORS VALUES (5, 'Denis', 'Villeneuve');

	INSERT INTO ROLES VALUES (5004, 113, 'Ryan', 'Gosling', 'K');
	INSERT INTO ROLES VALUES (5004, 114, 'Ana de', 'Armas', 'Joi');
	INSERT INTO ROLES VALUES (5004, 115, 'Harrison', 'Ford', 'Rick Deckard');

--	MOVIE 6 ---------------------------------------------------------------------------

	INSERT INTO 	MOVIES
	VALUES			(5005, 'Maze Runner: The Death Cure', 'Young hero Thomas embarks on a mission
					to find a cure for a deadly disease known as the "Flare".', 141, 'PG-13', 43, 
					7.0, 2017, 6);

	INSERT INTO GENRES VALUES (5005, 'Action');
	INSERT INTO GENRES VALUES (5005, 'Sci-Fi');
	INSERT INTO GENRES VALUES (5005, 'Thriller');

	INSERT INTO LOCATIONS VALUES (5005, 'Theaters');

	INSERT INTO DIRECTORS VALUES (6, 'Wes', 'Ball');

	INSERT INTO ROLES VALUES (5005, 116, 'Dylan', 'O''Brien', 'Thomas');
	INSERT INTO ROLES VALUES (5005, 117, 'Ki Hong', 'Lee', 'Minho');
	INSERT INTO ROLES VALUES (5005, 118, 'Kaya', 'Scodelario', 'Teresa');

--	MOVIE 7 ---------------------------------------------------------------------------

	INSERT INTO 	MOVIES
	VALUES			(5006, 'It', 'In the summer of 1989, a group of bullied kids band together to 
					destroy a shapeshifting monster, which disguises itself as a clown and preys on 
					the children of Derry, their small Maine town.', 135, 'R', 85, 7.5, 2017, 7);

	INSERT INTO GENRES VALUES (5006, 'Drama');
	INSERT INTO GENRES VALUES (5006, 'Horror');
	INSERT INTO GENRES VALUES (5006, 'Thriller');

	INSERT INTO LOCATIONS VALUES (5006, 'Amazon Video');
	INSERT INTO LOCATIONS VALUES (5006, 'YouTube');
	INSERT INTO LOCATIONS VALUES (5006, 'Google Play');

	INSERT INTO DIRECTORS VALUES (7, 'Andy', 'Muschietti');

	INSERT INTO ROLES VALUES (5006, 119, 'Bill', 'Skargard', 'Pennywise');
	INSERT INTO ROLES VALUES (5006, 120, 'Jaden', 'Lieberher', 'Bill Denbrough');
	INSERT INTO ROLES VALUES (5006, 121, 'Finn', 'Wolfhard', 'Richie Tozier');


--	MOVIE 8 ---------------------------------------------------------------------------

	INSERT INTO 	MOVIES
	VALUES			(5007, 'Jigsaw', 'Bodies are turning up around the city, each having met a 
					uniquely gruesome demise. As the investigation proceeds, evidence points to 
					one suspect: John Kramer, the man known as Jigsaw, who has been dead for ten 
					years.', 92, 'R', 34, 5.9, 2017, 8);

	INSERT INTO GENRES VALUES (5007, 'Crime');
	INSERT INTO GENRES VALUES (5007, 'Horror');
	INSERT INTO GENRES VALUES (5007, 'Mystery');

	INSERT INTO LOCATIONS VALUES (5007, 'Amazon Video');
	INSERT INTO LOCATIONS VALUES (5007, 'YouTube');
	INSERT INTO LOCATIONS VALUES (5007, 'Google Play');

	INSERT INTO DIRECTORS VALUES (8, 'Michael', 'Spierig');

	INSERT INTO ROLES VALUES (5007, 122, 'Matt', 'Passmore', 'Logan Nelson');
	INSERT INTO ROLES VALUES (5007, 123, 'Tobin', 'Bell', 'Jigsaw');
	INSERT INTO ROLES VALUES (5007, 124, 'Callum Keith', 'Rennie', 'Detective Halloran');


--	MOVIE 9 ---------------------------------------------------------------------------

	INSERT INTO 	MOVIES
	VALUES			(5008, 'Pitch Perfect 3', 'Following their win at the world championship, the
					now separated Bellas reunite for one last singing competition at an overseas 
					USO tour, but face a group who uses both instruments and voices.', 93, 'PG-13',
					31, 6.2, 2017, 9);

	INSERT INTO GENRES VALUES (5008, 'Comedy');
	INSERT INTO GENRES VALUES (5008, 'Music');

	INSERT INTO LOCATIONS VALUES (5008, 'Theater');

	INSERT INTO DIRECTORS VALUES (9, 'Trish', 'Sie');

	INSERT INTO ROLES VALUES (5008, 125, 'Anna', 'Kendrick', 'Beca');
	INSERT INTO ROLES VALUES (5008, 126, 'Rebel', 'Wilson', 'Fat Amy');
	INSERT INTO ROLES VALUES (5008, 127, 'Brittany', 'Snow', 'Chloe');

--	MOVIE 10 ---------------------------------------------------------------------------

	INSERT INTO 	MOVIES
	VALUES			(5009, 'Kingsman: The Golden Circle', 'When their headquarters are destroyed and 
					the world is held hostage, the Kingsman''s journey leads them to the discovery of 
					an allied spy organization in the US. These two elite secret organizations must 
					band together to defeat a common enemy.', 141, 'R', 52, 6.9, 2017, 10);

	INSERT INTO GENRES VALUES (5009, 'Action');
	INSERT INTO GENRES VALUES (5009, 'Adventure');
	INSERT INTO GENRES VALUES (5009, 'Comedy');

	INSERT INTO LOCATIONS VALUES (5009, 'Amazon Video');
	INSERT INTO LOCATIONS VALUES (5009, 'YouTube');
	INSERT INTO LOCATIONS VALUES (5009, 'Google Play');

	INSERT INTO DIRECTORS VALUES (10, 'Matthew', 'Vaughn');

	INSERT INTO ROLES VALUES (5009, 128, 'Taron', 'Egerton', 'Eggsy');
	INSERT INTO ROLES VALUES (5009, 129, 'Colin', 'Firth', 'Harry Hart');
	INSERT INTO ROLES VALUES (5009, 130, 'Mark', 'Strong', 'Merlin');

--	MOVIE 11 ---------------------------------------------------------------------------

	INSERT INTO 	MOVIES
	VALUES			(5010, 'The Dark Knight', 'When the menace known as the Joker emerges from his mysterious
					past, he wreaks havoc and chaos on the people of Gotham, the Dark Knight must accept one 
					of the greatest psychological and physical tests of his ability to fight injustice.', 152, 
					'PG-13', 94, 9.0, 2008, 11);

	INSERT INTO GENRES VALUES (5010, 'Action');
	INSERT INTO GENRES VALUES (5010, 'Crime');
	INSERT INTO GENRES VALUES (5010, 'Thriller');

	INSERT INTO LOCATIONS VALUES (5010, 'Amazon Video');
	INSERT INTO LOCATIONS VALUES (5010, 'YouTube');
	INSERT INTO LOCATIONS VALUES (5010, 'Google Play');
	INSERT INTO LOCATIONS VALUES (5010, 'iTunes');
	INSERT INTO LOCATIONS VALUES (5010, 'Vudu');

	INSERT INTO DIRECTORS VALUES (11, 'Christopher', 'Nolan');

	INSERT INTO ROLES VALUES (5010, 131, 'Christian', 'Bale', 'Bruce Wayne');
	INSERT INTO ROLES VALUES (5010, 132, 'Heath', 'Ledger', 'Joker');
	INSERT INTO ROLES VALUES (5010, 133, 'Aaron', 'Eckhart', 'Harvey Dent');

--	MOVIE 12 ---------------------------------------------------------------------------

	INSERT INTO 	MOVIES
	VALUES			(5011, 'Pulp Fiction', 'The lives of two mob hitmen, a boxer, a gangster''s wife, and a pair
					of diner bandits intertwine in four tales of violence and redemption.', 154, 'R', 94, 8.9, 1994, 12);

	INSERT INTO GENRES VALUES (5011, 'Crime');
	INSERT INTO GENRES VALUES (5011, 'Drama');

	INSERT INTO LOCATIONS VALUES (5011, 'Amazon Video');
	INSERT INTO LOCATIONS VALUES (5011, 'YouTube');
	INSERT INTO LOCATIONS VALUES (5011, 'Google Play');
	INSERT INTO LOCATIONS VALUES (5011, 'iTunes');
	INSERT INTO LOCATIONS VALUES (5011, 'Vudu');

	INSERT INTO DIRECTORS VALUES (12, 'Quentin', 'Tarantino');

	INSERT INTO ROLES VALUES (5011, 134, 'John', 'Travolta', 'Vincent Vega');
	INSERT INTO ROLES VALUES (5011, 135, 'Uma', 'Thurman', 'Mia Wallce');
	INSERT INTO ROLES VALUES (5011, 136, 'Samuel L.', 'Jackson', 'Jules Winnfield');

--	MOVIE 13 ---------------------------------------------------------------------------

	INSERT INTO 	MOVIES
	VALUES			(5012, 'Spirited Away', 'During her family''s move to the suburbs, a sullen 10-year-old
					girl wanders into a world ruled by gods, witches, and spirits, and where humans are 
					changed into beasts.', 125, 'PG', 97, 8.6, 2001, 13);

	INSERT INTO GENRES VALUES (5012, 'Animation');
	INSERT INTO GENRES VALUES (5012, 'Adventure');
	INSERT INTO GENRES VALUES (5012, 'Family');

	INSERT INTO LOCATIONS VALUES (5012, 'Amazon Video');

	INSERT INTO DIRECTORS VALUES (13, 'Hayao', 'Miyazaki');

	INSERT INTO ROLES VALUES (5012, 137, 'Daveigh', 'Chase', 'Chihiro');
	INSERT INTO ROLES VALUES (5012, 138, 'Suzanne', 'Pleshette', 'Yubaba / Zeniba');
	INSERT INTO ROLES VALUES (5012, 139, 'Miyu', 'Irino', 'Haku');

--	MOVIE 14 ---------------------------------------------------------------------------

	INSERT INTO 	MOVIES
	VALUES			(5013, 'The Green Mile', 'The lives of guards on Death Row are affected by one of their
					charges: a black man accused of child murder and rape, yet who has a mysterious gift.', 
					189, 'R', 80, 8.5, 1999, 14);

	INSERT INTO GENRES VALUES (5013, 'Crime');
	INSERT INTO GENRES VALUES (5013, 'Drama');
	INSERT INTO GENRES VALUES (5013, 'Fantasy');

	INSERT INTO LOCATIONS VALUES (5013, 'Amazon Video');
	INSERT INTO LOCATIONS VALUES (5013, 'YouTube');
	INSERT INTO LOCATIONS VALUES (5013, 'Google Play');
	INSERT INTO LOCATIONS VALUES (5013, 'iTunes');
	INSERT INTO LOCATIONS VALUES (5013, 'Vudu');

	INSERT INTO DIRECTORS VALUES (14, 'Frank', 'Darabont');

	INSERT INTO ROLES VALUES (5013, 140, 'Tom', 'Hanks', 'Paul Edgecomb');
	INSERT INTO ROLES VALUES (5013, 141, 'Michael Clarke', 'Duncan', 'John Coffey');
	INSERT INTO ROLES VALUES (5013, 142, 'David', 'Morse', 'Brutus Howell');

--	MOVIE 15 ---------------------------------------------------------------------------

	INSERT INTO 	MOVIES
	VALUES			(5014, 'Monsters, Inc', 'In order to power the city, monsters have to scare children so that
					they scream. However, the children are toxic to the monsters, and after a child gets through, 
					2 monsters realize things may not be what they think.', 92, 'G', 96, 8.1, 2001, 15);

	INSERT INTO GENRES VALUES (5014, 'Animation');
	INSERT INTO GENRES VALUES (5014, 'Adventure');
	INSERT INTO GENRES VALUES (5014, 'Comedy');

	INSERT INTO LOCATIONS VALUES (5014, 'Amazon Video');
	INSERT INTO LOCATIONS VALUES (5014, 'YouTube');
	INSERT INTO LOCATIONS VALUES (5014, 'Google Play');
	INSERT INTO LOCATIONS VALUES (5014, 'iTunes');
	INSERT INTO LOCATIONS VALUES (5014, 'Vudu');

	INSERT INTO DIRECTORS VALUES (15, 'Pete', 'Docter');

	INSERT INTO ROLES VALUES (5014, 143, 'Billy', 'Crystal', 'Mike');
	INSERT INTO ROLES VALUES (5014, 144, 'John', 'Goodman', 'Sullivan');
	INSERT INTO ROLES VALUES (5014, 145, 'Mary', 'Gibbs', 'Boo');


--	===================================================================================
--	PART C - SQL QUERIES
--	===================================================================================
--	QUERY 1
--	Purpose:	Retrieves movie titles
--	Expected:	A table displaying the title of 2017 movies that are still in theaters

	SELECT title AS "2017 comedy movies still in theaters"
	FROM GENRES JOIN MOVIES ON movie_id = id JOIN LOCATIONS ON id = LOCATIONS.movie_id
	WHERE genre = 'Comedy' AND release_year = 2017 AND location = 'Theaters'

--	-----------------------------------------------------------------------------------
--	-----------------------------------------------------------------------------------
--	QUERY 2
--	Purpose:	Retrieves the release year, title, and the user ratings for movies
--	Expected:	A table displaying movies with a user rating above an 8 (out of 10)
--				and grouped according to the release year, the title, and the user
--				rating the movie received

	SELECT release_year, title, user_rating
	FROM MOVIES
	WHERE user_rating > ALL
			(SELECT user_rating FROM MOVIES WHERE user_rating < 8)
			 GROUP BY release_year, title, user_rating

--	-----------------------------------------------------------------------------------
--	-----------------------------------------------------------------------------------
--	QUERY 3
--	Purpose:	Retrieves all attributes from the MOVIES relation.
--	Expected:	A table displaying movies that received a user_rating higher than the
--				average user rating of all the movies (average: 7.713333)

	SELECT * 
	FROM MOVIES
	WHERE user_rating > (SELECT AVG(user_rating) FROM MOVIES);

--	-----------------------------------------------------------------------------------
--	-----------------------------------------------------------------------------------
--	QUERY 4
--	Purpose:	Retrieves the title of a movie and the director's name
--	Expected:	A table displaying the titles of movies and the full name of directed
--				each one

	SELECT M.title AS Movies, D.fname AS "First", D.lname AS "Last"
	FROM MOVIES AS M FULL JOIN DIRECTORS AS D ON M.director_id = D.director_id;

--	-----------------------------------------------------------------------------------
--	-----------------------------------------------------------------------------------
--	QUERY 5
--	Purpose:	Retrieves the title of a movie, its user rating, and whether the rating
--				is considered a high or low rating
--	Expected:	A table displaying all movies and an indication that the movie is highly
--				(ratings >= 8) or lowly rated (ratings < 8)

	SELECT title AS "Movie", user_rating AS "User Rating", 'High' AS "High/Low Rating"
	FROM MOVIES
	WHERE user_rating >= 8
	UNION
		(SELECT title, user_rating, 'Low'
		 FROM MOVIES
		 WHERE user_rating < 8 )

--	-----------------------------------------------------------------------------------
--	-----------------------------------------------------------------------------------
--	QUERY 6
--	Purpose:	Retrieves the title of a movie and its Rotten Tomatoes score.
--	Expected:	A table displaying the top action movies (Rotten Tomatoes score >= 70%) 
--				of 2017. Ordering set to display the highest rated movies at the top

	SELECT title AS 'Top Action Movies of 2017', rt_rating AS 'Rotten Tomatoes Score' 
	FROM MOVIES JOIN GENRES ON id = movie_id
	WHERE GENRES.genre = 'Action' AND MOVIES.rt_rating >= 70 AND MOVIES.release_year = 2017
	ORDER BY rt_rating DESC

--	-----------------------------------------------------------------------------------
--	-----------------------------------------------------------------------------------
--	QUERY 7
--	Purpose:	Retrieves the title of a movie, the locations of where the movie can be
--				viewed, and its ratings from both users and Rotten Tomatoes
--	Expected:	A table displaying "critically-acclaimed movies" (ratings above the
--				average for both user ratings (7.713333) and Rotten Tomatoes ratings
--				(75%)

	SELECT M.title AS "Movie", L.location AS "Where to watch", M.user_rating 
				   AS "User Rating", M.rt_rating AS "Rotten Tomatoes Score"
	FROM MOVIES AS M JOIN LOCATIONS AS L ON M.id = L.movie_id
	WHERE user_rating >= (SELECT AVG(user_rating) FROM MOVIES) 
							AND 
							rt_rating > = (SELECT AVG(rt_rating) FROM MOVIES);

--	-----------------------------------------------------------------------------------
--	-----------------------------------------------------------------------------------
--	QUERY 8
--	Purpose:	Retrieves the full details of a movie
--	Expected:	A table displaying the highest-rated movie of 2017

	SELECT *
	FROM MOVIES
	WHERE user_rating = (SELECT MAX(user_rating) FROM MOVIES WHERE release_year = 2017);

--	-----------------------------------------------------------------------------------
--	-----------------------------------------------------------------------------------
--	QUERY 9
--	Purpose:	Retrieves the full details of movies
--	Expected:	A table displaying PG-13 movies that were released before 2017

	SELECT *
	FROM (
		 SELECT * FROM MOVIES WHERE rating = 'PG-13'
		 ) as pg13movies
	WHERE release_year < 2017
	
--	-----------------------------------------------------------------------------------
--	-----------------------------------------------------------------------------------
--	QUERY 10
--	Purpose:	Retrieves the full details of movies
--	Expected:	A table displaying movies that aren't comedies

	SELECT *
	FROM MOVIES AS M
	WHERE NOT EXISTS(SELECT * FROM GENRES AS G WHERE G.movie_id = M.id AND G.genre = 'Comedy')

--	-----------------------------------------------------------------------------------
--	END OF SCRIPT (February 5, 2018)

--	FOR RE-RUNS
--	DROP TABLE ROLES, GENRES, LOCATIONS, DIRECTORS, MOVIES
