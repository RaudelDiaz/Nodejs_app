-- Create the database
CREATE DATABASE cinequest;

-- Use the created database
USE cinequest;

-- Create users table
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
-- Create action_movies table
CREATE TABLE action_movies (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(200) NOT NULL,
    release_year INT,
    description TEXT,
    image_url VARCHAR(255),
    trailer_url VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE comedy_movies (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(200) NOT NULL,
    release_year INT,
    description TEXT,
    image_url VARCHAR(255),
    trailer_url VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE Drama_movies (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(200) NOT NULL,
    release_year INT,
    description TEXT,
    image_url VARCHAR(255),
    trailer_url VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE fantasy_movies (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(200) NOT NULL,
    release_year INT,
    description TEXT,
    image_url VARCHAR(255),
    trailer_url VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE historical_movies (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(200) NOT NULL,
    release_year INT,
    description TEXT,
    image_url VARCHAR(255),
    trailer_url VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE horror_movies (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(200) NOT NULL,
    release_year INT,
    description TEXT,
    image_url VARCHAR(255),
    trailer_url VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE fiction_movies (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(200) NOT NULL,
    release_year INT,
    description TEXT,
    image_url VARCHAR(255),
    trailer_url VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE thriller_movies (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(200) NOT NULL,
    release_year INT,
    description TEXT,
    image_url VARCHAR(255),
    trailer_url VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE mystery_movies (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(200) NOT NULL,
    release_year INT,
    description TEXT,
    image_url VARCHAR(255),
    trailer_url VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE romance_movies (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(200) NOT NULL,
    release_year INT,
    description TEXT,
    image_url VARCHAR(255),
    trailer_url VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE animation_movies (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(200) NOT NULL,
    release_year INT,
    description TEXT,
    image_url VARCHAR(255),
    trailer_url VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE documentary_movies (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(200) NOT NULL,
    release_year INT,
    description TEXT,
    image_url VARCHAR(255),
    trailer_url VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE musical_movies (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(200) NOT NULL,
    release_year INT,
    description TEXT,
    image_url VARCHAR(255),
    trailer_url VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE western_movies (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(200) NOT NULL,
    release_year INT,
    description TEXT,
    image_url VARCHAR(255),
    trailer_url VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE adventure_movies (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(200) NOT NULL,
    release_year INT,
    description TEXT,
    image_url VARCHAR(255),
    trailer_url VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
-- Create genres table
CREATE TABLE genres (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE,
    description TEXT
);

-- Create movies table with the image_url and trailer_url columns
CREATE TABLE most_popular (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(200) NOT NULL,
    genre_id INT,
    director VARCHAR(100),
    release_year INT,
    description TEXT,
    image_url VARCHAR(255),
    trailer_url VARCHAR(255),  -- New column for trailer URL
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (genre_id) REFERENCES genres(id)
);

-- Create news table
CREATE TABLE news (
    id INT AUTO_INCREMENT PRIMARY KEY,        
    title VARCHAR(200) NOT NULL,                
    genre_id INT DEFAULT NULL,                  
    director VARCHAR(100) DEFAULT NULL,           
    release_year INT NOT NULL, 
    description TEXT NOT NULL,                 
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    news_date DATE,                              
    movie_title VARCHAR(255),  
    image_url VARCHAR(1000)
);

-- Create questions_and_answers table (combined questions and answers in one table)
CREATE TABLE questions_and_answers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    movie_id INT,
    title VARCHAR(200) NOT NULL,
    question_content TEXT NOT NULL,
    answer_content TEXT,  -- New column to store the answer
    answered_by INT,      -- User who provided the answer
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (movie_id) REFERENCES most_popular(id),
    FOREIGN KEY (answered_by) REFERENCES users(id)  -- Foreign key to track who answered
);
CREATE TABLE answers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    question_id INT NOT NULL,
    answer_content TEXT NOT NULL,
    answered_by INT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (question_id) REFERENCES questions_and_answers(id) ON DELETE CASCADE,
    FOREIGN KEY (answered_by) REFERENCES users(id) ON DELETE CASCADE
);
-- Insert sample users
INSERT INTO users (username, password, email) VALUES 
('filmFanatic', 'hashed_password', 'fanatic@example.com'),
('movieBuff', 'hashed_password', 'buff@example.com');

INSERT INTO action_movies (title, release_year, description, image_url, trailer_url) VALUES 
('Mad Max: Fury Road', '2015', 'In a dystopian, post-apocalyptic world where resources like water and gasoline are scarce, Max Rockatansky (Tom Hardy) is a former cop who’s haunted by his past and captured by a tyrannical warlord, Immortan Joe (Hugh Keays-Byrne). After escaping captivity, Max becomes entangled with Furiosa (Charlize Theron), a rogue war commander who rebels against Joe to free his five wives. Together, they embark on a high-octane chase across the barren wasteland, battling Joe’s army in a desperate bid for freedom and survival. With stunning visual effects, heart-pounding action, and an empowering narrative about defiance, survival, and the fight for freedom, *Fury Road* is a frenetic, immersive thrill ride.', 'https://m.media-amazon.com/images/M/MV5BZDRkODJhOTgtOTc1OC00NTgzLTk4NjItNDgxZDY4YjlmNDY2XkEyXkFqcGc@._V1_.jpg','https://www.youtube.com/embed/hEJnMQG9ev8'),
('Die Hard', '1988', 'Set during a Christmas Eve party at the Nakatomi Plaza in Los Angeles, *Die Hard* follows off-duty NYPD officer John McClane (Bruce Willis), who finds himself in the wrong place at the wrong time. A group of terrorists, led by the cunning Hans Gruber (Alan Rickman), take control of the building and hold its occupants hostage. Using his wit, resourcefulness, and sheer willpower, McClane becomes a one-man army, fighting to save the hostages and thwart Gruber\'s meticulously planned heist. With its thrilling suspense, memorable one-liners, and gripping pace, *Die Hard* set the standard for the modern action movie and remains a holiday classic.', 'https://m.media-amazon.com/images/I/819cf1ZR2WL._AC_UF1000,1000_QL80_.jpg','https://www.youtube.com/embed/jaJuwKCmJbY'),
('John Wick', '2014', 'John Wick (Keanu Reeves), a former hitman seeking peace after the death of his wife, is pulled back into the criminal underworld when a group of Russian mobsters, led by Iosef Tarasov (Alfie Allen), steal his car and kill his beloved dog—a final gift from his late wife. Consumed by rage, Wick sets out on a bloody quest for vengeance, taking down anyone who crosses his path. What follows is a sleek, stylish, and relentless action film that redefined modern action choreography with its signature "gun-fu" style. As he uncovers the vast criminal network that betrayed him, *John Wick* explores themes of grief, revenge, and redemption in a world where honor and loyalty are rare commodities.', 'https://m.media-amazon.com/images/M/MV5BMTU2NjA1ODgzMF5BMl5BanBnXkFtZTgwMTM2MTI4MjE@._V1_.jpg','https://www.youtube.com/embed/C0BMx-qxsP4'),
('Gladiator', '2000', 'In ancient Rome, Maximus Decimus Meridius (Russell Crowe), a once-celebrated general, is betrayed by the corrupt Emperor Commodus (Joaquin Phoenix), who murders his family and sends him into slavery. Forced to become a gladiator, Maximus rises through the brutal arena, seeking revenge against the emperor who destroyed his life. With breathtaking action sequences, a powerful performance from Crowe, and a gripping tale of betrayal, redemption, and the quest for justice, *Gladiator* explores the human spirit\'s resilience, the cost of power, and the enduring desire for vengeance.', 'https://upload.wikimedia.org/wikipedia/en/f/fb/Gladiator_%282000_film_poster%29.png','https://www.youtube.com/embed/P5ieIbInFpg'),
('The Bourne Identity', '2002', 'Jason Bourne (Matt Damon), suffering from amnesia, is found floating in the Mediterranean Sea, with no memory of his identity or past. As he tries to piece together his fragmented memories, he’s pursued by a group of CIA agents intent on neutralizing him. Bourne uncovers a complex conspiracy involving black-ops missions and shadowy political figures, all while questioning his own role in a world filled with betrayal and danger. With intense action sequences, mind-bending twists, and a highly relatable lead character, *The Bourne Identity* kickstarted one of the most successful action franchises of the 21st century.', 'https://m.media-amazon.com/images/M/MV5BYTk1ZTcyMWMtMWUxYS00MmEzLTlmODYtOTk1MGRjOTg1ZjlmXkEyXkFqcGc@._V1_FMjpg_UX1000_.jpg','https://www.youtube.com/embed/FpKaB5dvQ4g'),
('Mission: Impossible - Fallout', '2018', 'Ethan Hunt (Tom Cruise) and his IMF team are tasked with recovering stolen nuclear weapons that could lead to global devastation. However, a botched mission leaves him with the responsibility of retrieving the weapons and stopping a terrorist group known as the Apostles. Betrayed by his government and pursued by agents with their own agendas, Hunt is forced to make difficult decisions that push him to his physical and emotional limits. *Fallout* features some of the most jaw-dropping action scenes in cinema, including a halo jump, a helicopter chase, and thrilling hand-to-hand combat, all while exploring themes of loyalty, trust, and sacrifice.', 'https://m.media-amazon.com/images/I/A1M0qlxNo6L.jpg', 'https://www.youtube.com/embed/wb49-oV0F78'),
('The Dark Knight', '2008', 'Batman (Christian Bale) faces his most challenging adversary yet in the form of the Joker (Heath Ledger), a psychopathic criminal mastermind intent on creating chaos in Gotham City. As the Joker’s schemes push Batman to his moral and ethical limits, the hero must confront his own identity and the consequences of his crusade. With unforgettable performances, especially by Ledger as the Joker, and a darker, more introspective take on the superhero genre, *The Dark Knight* explores the nature of good and evil, order and chaos, and sacrifice in a corrupted world.', 'https://th.bing.com/th/id/OIP.NN9rKH-vZbFgtH4FuoW7OwHaLH?rs=1&pid=ImgDetMain','https://www.youtube.com/embed/EXeTwQWrcwY'),
('Terminator 2: Judgment Day', '1991', 'A cyborg (Arnold Schwarzenegger) is sent from the future to protect John Connor (Edward Furlong), a young boy who will one day lead the resistance against the machines. Meanwhile, a more advanced and deadly Terminator (Robert Patrick) is also sent to kill John, triggering a battle for the boy\'s survival. With groundbreaking special effects, an emotionally resonant story, and a thrilling cat-and-mouse chase, *Terminator 2* became a benchmark for action and science fiction cinema, exploring themes of fate, free will, and the nature of humanity.', 'https://m.media-amazon.com/images/M/MV5BNGMyMGNkMDUtMjc2Ni00NWFlLTgyODEtZTY2MzBiZTg0OWZiXkEyXkFqcGc@._V1_.jpg', 'https://www.youtube.com/embed/CRRlbK5w8AE'),
('The Expendables', '2010', 'A group of elite mercenaries, led by Barney Ross (Sylvester Stallone), are hired to overthrow a brutal dictator, General Garza (David Zayas), on a small Caribbean island. However, the mission becomes far more complicated when the mercenaries uncover Garza’s ties to a corrupt CIA agent (Eric Roberts). *The Expendables* is a high-energy, action-packed ensemble film, featuring an all-star cast of action legends, including Stallone, Jason Statham, Jet Li, and Dolph Lundgren. The movie celebrates old-school action, combining explosive battles with a sense of camaraderie and loyalty.', 'https://m.media-amazon.com/images/M/MV5BNTUwODQyNjM0NF5BMl5BanBnXkFtZTcwNDMwMTU1Mw@@._V1_.jpg', 'https://www.youtube.com/embed/8KtYRALe-xo'),
('300', '2006', 'Based on the graphic novel by Frank Miller, *300* chronicles the heroic stand of King Leonidas (Gerard Butler) and his 300 Spartan warriors against the massive Persian army led by Xerxes (Rodrigo Santoro) at the Battle of Thermopylae. With stunning visual effects and a stylized, slow-motion aesthetic, the film brings to life the brutal clash of forces. *300* is a tale of honor, sacrifice, and brotherhood, where the Spartans fight not just for survival, but for the freedom of their people.', 'https://c8.alamy.com/comp/2K3MF4R/300-2006-300-movie-poster-gerard-butler-2K3MF4R.jpg', 'https://www.youtube.com/embed/UrIbxk7idYA'),
('Lethal Weapon', '1987', 'Mismatched LAPD detectives Martin Riggs (Mel Gibson) and Roger Murtaugh (Danny Glover) are forced to work together to solve a high-stakes case involving a dangerous drug cartel. Riggs, a suicidal, unpredictable cop with a tragic past, and Murtaugh, a family man on the verge of retirement, develop an unlikely but powerful partnership. Combining humor, explosive action, and heart, *Lethal Weapon* became the quintessential buddy-cop movie and spawned a successful franchise, exploring themes of redemption, friendship, and the complexities of life and death in law enforcement.', 'https://upload.wikimedia.org/wikipedia/en/d/d9/Lethal_weapon1.jpg','https://www.youtube.com/embed/bKeW-MGu-qQ'),
('The Equalizer', '2014', 'Robert McCall (Denzel Washington), a former black-ops operative, lives a quiet life in Boston. However, he is drawn back into action when he befriends a young woman (Chloë Grace Moretz) who is brutally beaten by Russian gangsters. McCall uses his lethal skills to bring justice to those who can\'t protect themselves, while also confronting the dark forces of his past. With Washington’s compelling performance and taut direction, *The Equalizer* combines vigilante justice with a story of personal redemption.', 'https://m.media-amazon.com/images/I/61QcjAJ8e1S._AC_UF894,1000_QL80_.jpg','https://www.youtube.com/embed/VjctHUEmutw'),
('Inception', '2010', 'Cobb (Leonardo DiCaprio) is a thief who specializes in extracting secrets from people\'s subconscious while they dream. However, when offered a chance to have his criminal record erased, he must perform an unprecedented task: planting an idea into someone\'s mind through a process called inception. To do this, Cobb assembles a team and navigates multiple layers of dreams, blurring the line between reality and illusion. *Inception* is a mind-bending, visually spectacular exploration of dreams, consciousness, and the power of ideas, with themes of guilt, loss, and redemption running through its intricate plot.', 'https://4.bp.blogspot.com/-L80GvZteuZQ/T8iT9fY-LHI/AAAAAAAAAKs/SXTF2pEK9Ao/s1600/inception-movie-poster.jpg', 'https://www.youtube.com/embed/YoHD9XEInc0'),
('Mad Max', '1979', 'In a near-future, post-apocalyptic Australia, Max Rockatansky (Mel Gibson) is a former highway patrol officer who seeks vengeance after his family is killed by a violent gang led by the sadistic Toecutter (Hugh Keays-Byrne). As the last vestige of law and order in a desolate wasteland, Max becomes a vigilante, hunting down the gang and battling their lawless reign. *Mad Max* was the film that launched Gibson’s career and set the tone for future post-apocalyptic action movies, with gritty visuals, high-speed chases, and a bleak, dystopian atmosphere.', 'https://m.media-amazon.com/images/M/MV5BMTM4Mjg5ODEzMV5BMl5BanBnXkFtZTcwMDc3NDk0NA@@._V1_.jpg', 'https://www.youtube.com/embed/caHnaRq8Qlg'),
('The Raid: Redemption', '2011', 'A SWAT team is sent to take down a ruthless crime lord in his high-rise apartment building, but things quickly go awry as they become trapped inside. With no way out and the entire building against them, the team must fight their way to the top in an all-out, brutal battle for survival. Directed by Gareth Evans, *The Raid* is a high-intensity, martial arts-driven action film known for its jaw-dropping fight choreography and brutal combat sequences, making it a must-watch for action fans.', 'https://m.media-amazon.com/images/M/MV5BOGUxM2Q0MzItZDRmYy00ZWY1LWFiNzctNmY3Njg2ODJjZWNmXkEyXkFqcGc@._V1_FMjpg_UX1000_.jpg','https://www.youtube.com/embed/m6Q7KnXpNOg'),
('Star Wars: Episode IV - A New Hope', '1977', 'On a desert planet, young Luke Skywalker (Mark Hamill) discovers a droid carrying secret plans to defeat the tyrannical Galactic Empire. After meeting wise Jedi Master Obi-Wan Kenobi (Alec Guinness) and smuggler Han Solo (Harrison Ford), Luke joins a rebellion to fight against the Empire and its deadly weapon, the Death Star. *Star Wars* is a groundbreaking sci-fi adventure that introduced iconic characters, thrilling space battles, and themes of hope, destiny, and rebellion. It became a cultural phenomenon and launched a beloved franchise that would change cinema forever.', 'https://m.media-amazon.com/images/I/712phcZ5ljL._AC_UF1000,1000_QL80_.jpg', 'https://www.youtube.com/embed/vZ734NWnAHA'),
('Skyfall', '2012', 'James Bond’s loyalty to M (Judi Dench) is tested when she becomes a target of an old nemesis, Raoul Silva (Javier Bardem), a former MI6 agent with a vendetta against the organization. As Silva unleashes a series of attacks on MI6, Bond must confront his past while also protecting M from a dangerous foe. With stunning cinematography, a gripping story, and Daniel Craig’s defining performance as Bond, *Skyfall* redefined the franchise and explored themes of loyalty, identity, and the modern challenges faced by intelligence agencies.', 'https://m.media-amazon.com/images/M/MV5BNjAzMWNkODUtM2FlMi00NzgyLWJhMGUtMWEyNDYyZGFiN2RlXkEyXkFqcGc@._V1_.jpg', 'https://www.youtube.com/embed/6kw1UVovByw'),
('Deadpool', '2016', 'Wade Wilson (Ryan Reynolds), a former Special Forces operative turned mercenary, undergoes a rogue medical procedure that leaves him with accelerated healing powers and a disfigured face. Taking on the persona of Deadpool, Wade seeks revenge against the man who ruined his life. Combining irreverent humor, R-rated action, and a subversive take on the superhero genre, *Deadpool* became a massive hit, exploring themes of love, pain, and self-identity in an antihero’s journey.', 'https://m.media-amazon.com/images/M/MV5BNzY3ZWU5NGQtOTViNC00ZWVmLTliNjAtNzViNzlkZWQ4YzQ4XkEyXkFqcGc@._V1_.jpg', 'https://www.youtube.com/embed/Xithigfg7dA'),
('Iron Man', '2008', 'Tony Stark (Robert Downey Jr.), a wealthy and genius inventor, is kidnapped by terrorists who force him to build a weapon of mass destruction. Using his intellect and resources, he instead builds a suit of armor to escape and vows to use his technology for good. As he assumes the mantle of Iron Man, Stark confronts both personal demons and larger threats, including a rival industrialist (Jeff Bridges) who seeks to exploit his technology. *Iron Man* is a blend of action, humor, and heart, setting the stage for the Marvel Cinematic Universe and the character’s evolution from a playboy to a hero.', 'https://i.ebayimg.com/00/s/MTYwMFgxMTA4/z/2aYAAOSwfzZgOAIX/$_57.JPG?set_id=8800005007', 'https://www.youtube.com/embed/8ugaeA-nMTc'),
('The Avengers', '2012', 'When an alien army led by the villainous Loki (Tom Hiddleston) threatens Earth, a team of superheroes—Iron Man, Captain America (Chris Evans), Thor (Chris Hemsworth), Hulk (Mark Ruffalo), Black Widow (Scarlett Johansson), and Hawkeye (Jeremy Renner)—are assembled by Nick Fury (Samuel L. Jackson) to stop the invasion. *The Avengers* is an explosive team-up movie that combines action, humor, and heart, bringing together Marvel’s greatest heroes and setting the bar for ensemble superhero films.', 'https://upload.wikimedia.org/wikipedia/en/8/8a/The_Avengers_%282012_film%29_poster.jpg','https://www.youtube.com/embed/eOrNdBpGMv8'),
('Captain America: The Winter Soldier', '2014', 'Captain America (Chris Evans) teams up with Black Widow (Scarlett Johansson) to uncover a conspiracy within S.H.I.E.L.D. after a series of mysterious events shake the organization. As they dig deeper, they discover the return of Bucky Barnes (Sebastian Stan), Steve Rogers\'s old friend, who has been brainwashed into becoming the deadly assassin known as the Winter Soldier. *The Winter Soldier* is a thrilling, action-packed political thriller that explores themes of trust, loyalty, and the consequences of secret organizations operating in the shadows.', 'https://upload.wikimedia.org/wikipedia/en/9/9e/Captain_America_The_Winter_Soldier_poster.jpg','https://www.youtube.com/embed/tbayiPxkUMM');

-- Insert into adventure_moovies
INSERT INTO adventure_movies (title, release_year, description, image_url, trailer_url) VALUES 
('Indiana Jones and the Raiders of the Lost Ark', '1981', 'Archaeologist and adventurer Indiana Jones (Harrison Ford) embarks on a quest to find the legendary Ark of the Covenant before the Nazis can get their hands on it. Along the way, he faces deadly traps, ancient mysteries, and ruthless enemies. With thrilling action sequences, iconic one-liners, and an unforgettable score, *Raiders of the Lost Ark* became a defining film of the adventure genre, blending history, mythology, and high-stakes action.', 'https://m.media-amazon.com/images/I/81UOBSDQh0L._AC_UF894,1000_QL80_.jpg', 'https://www.youtube.com/embed/Rh_BJXG1-44'),
('The Lord of the Rings: The Fellowship of the Ring', '2001', 'Frodo Baggins (Elijah Wood), a humble hobbit, is tasked with destroying the One Ring, a powerful artifact that can bring great evil to Middle-earth. Joined by a group of unlikely heroes, including Aragorn (Viggo Mortensen), Gandalf (Ian McKellen), and Legolas (Orlando Bloom), Frodo embarks on an epic journey to the fires of Mount Doom, where the ring must be destroyed. With its richly detailed world, grand scope, and powerful themes of friendship and sacrifice, *The Fellowship of the Ring* is a cinematic masterpiece.', 'https://upload.wikimedia.org/wikipedia/en/f/fb/Lord_Rings_Fellowship_Ring.jpg', 'https://www.youtube.com/embed/_nZdmwHrcnw'),
('Pirates of the Caribbean: The Curse of the Black Pearl', '2003', 'Captain Jack Sparrow (Johnny Depp) is a charming but unpredictable pirate who must team up with blacksmith Will Turner (Orlando Bloom) to save the woman he loves, Elizabeth Swann (Keira Knightley), from cursed pirates led by Captain Barbossa (Geoffrey Rush). As Jack seeks to reclaim his ship, the Black Pearl, he becomes entangled in a supernatural adventure filled with high-seas action, witty banter, and plenty of swashbuckling fun. *The Curse of the Black Pearl* reinvigorated the pirate genre with humor, thrilling set-pieces, and Depp’s iconic performance.', 'https://m.media-amazon.com/images/I/71zji3aER6L._AC_UF894,1000_QL80_.jpg', 'https://www.youtube.com/embed/naQr0uTrH_s'),
('The Princess Bride', '1987', 'A young woman named Buttercup (Robin Wright) is in love with her true love, Westley (Cary Elwes), but he is thought to be dead. When Buttercup is kidnapped by a group of criminals, Westley returns to rescue her, setting off an unforgettable adventure. With witty dialogue, memorable characters, and a mix of romance, fantasy, and comedy, *The Princess Bride* has become a beloved cult classic that transcends generations.', 'https://m.media-amazon.com/images/I/712n+hhjX3L._AC_UF1000,1000_QL80_.jpg', 'https://www.youtube.com/embed/O3CIXEAjcc8'),
('Jumanji: Welcome to the Jungle', '2017', 'Four high school students find themselves transported into a video game, where they take on the avatars of their adult selves, played by Dwayne Johnson, Kevin Hart, Jack Black, and Karen Gillan. To escape the game, they must work together to complete dangerous missions and avoid perilous traps. Packed with humor, action, and heart, *Jumanji: Welcome to the Jungle* reinvents the classic 1995 adventure movie, bringing new thrills and laughs for a modern audience.', 'https://m.media-amazon.com/images/M/MV5BZjI5MzdmODctYjA4NS00ZmMxLWJlOWUtOGVhMjA0OGMxMWYzXkEyXkFqcGc@._V1_FMjpg_UX1000_.jpg', 'https://www.youtube.com/embed/v_TJKwJwN0E'),
('The Goonies', '1985', 'A group of misfit kids from a small town in Oregon discover an ancient pirate treasure map and embark on a perilous adventure to find the hidden loot. Along the way, they face dangerous traps, a family of criminals, and a series of twists and turns. With its iconic cast of characters and spirit of adventure, *The Goonies* has become a beloved family classic, full of humor, heart, and unforgettable moments.', 'https://m.media-amazon.com/images/I/91hz3I9r1hL._AC_UF894,1000_QL80_.jpg', 'https://www.youtube.com/embed/hJ2j4oWdQtU'),
('Avatar', '2009', 'In the distant future, paraplegic Marine Jake Sully (Sam Worthington) is sent to the lush alien world of Pandora, where he is tasked with infiltrating the native Na’vi people to help secure resources for a human mining operation. As Jake becomes more deeply involved with the Na’vi, he finds himself torn between his mission and his growing bond with the Na’vi and their way of life. Directed by James Cameron, *Avatar* is an immersive visual spectacle that combines groundbreaking technology with a compelling adventure story about identity, imperialism, and environmentalism.', 'https://upload.wikimedia.org/wikipedia/en/thumb/d/d6/Avatar_%282009_film%29_poster.jpg/220px-Avatar_%282009_film%29_poster.jpg', 'https://www.youtube.com/embed/5PSNL1qE6VY'),
('King Kong', '2005', 'In 1930s New York, a film crew led by director Carl Denham (Jack Black) travels to a mysterious island in search of exotic wildlife for their new film. There, they encounter Kong, a gigantic gorilla who forms a bond with the beautiful actress Ann Darrow (Naomi Watts). As Kong is captured and brought to the city, the film becomes a thrilling adventure as man and beast face the consequences of greed, ambition, and exploitation. Peter Jackson’s *King Kong* is a visually stunning epic that blends action, emotion, and adventure.', 'https://m.media-amazon.com/images/M/MV5BMWY0NWE0ZjUtNjRlOS00ZDViLTgxNTQtMGMwN2FhNDY1YTg2XkEyXkFqcGc@._V1_.jpg', 'https://www.youtube.com/embed/9extfjDZCts'),
('The Secret Life of Walter Mitty', '2013', 'Walter Mitty (Ben Stiller) is a mild-mannered photo editor at Life magazine who escapes his mundane life through vivid daydreams of adventure. When his job is on the line, Walter embarks on a real-life journey to find a missing negative and travels to exotic and dangerous locations, from the mountains of Afghanistan to the shores of Iceland. *The Secret Life of Walter Mitty* is an inspiring and heartwarming adventure that explores themes of self-discovery and the power of stepping outside your comfort zone.', 'https://m.media-amazon.com/images/M/MV5BODYwNDYxNDk1Nl5BMl5BanBnXkFtZTgwOTAwMTk2MDE@._V1_.jpg', 'https://www.youtube.com/embed/QD6cy4PBQPI'),
('Life of Pi', '2012', 'After a shipwreck, Pi Patel (Suraj Sharma), a young Indian boy, finds himself stranded on a lifeboat in the Pacific Ocean with a Bengal tiger named Richard Parker. As the days stretch into weeks, Pi must rely on his faith, resourcefulness, and courage to survive the harsh conditions while learning to coexist with the tiger. Ang Lee’s *Life of Pi* is a visually breathtaking and deeply philosophical adventure about survival, faith, and the human spirit.', 'https://m.media-amazon.com/images/I/81lBmZWYktL._UF1000,1000_QL80_.jpg', 'https://www.youtube.com/embed/3mMN693-F3U'),
('The NeverEnding Story', '1984', 'Bastian Bux (Barret Oliver), a shy young boy, discovers a magical book that transports him to the mystical land of Fantasia, where he follows the adventures of a young warrior named Atreyu (Noah Hathaway). As Bastian reads, he realizes that he holds the key to saving Fantasia from destruction by the evil force known as The Nothing. *The NeverEnding Story* is a beloved adventure fantasy film that explores the power of imagination, storytelling, and the importance of believing in oneself.', 'https://m.media-amazon.com/images/I/71Eze7ZeRsL._AC_UF1000,1000_QL80_.jpg', 'https://www.youtube.com/embed/YKGYgFPAP14'),
('The Jungle Book', '2016', 'Raised by wolves in the jungle, Mowgli (Neel Sethi) must face the dangers of the wild and discover his true identity after the tiger Shere Khan (Idris Elba) threatens his life. With the help of his animal friends, including the lovable bear Baloo (Bill Murray) and the panther Bagheera (Ben Kingsley), Mowgli embarks on a journey of self-discovery and adventure. Disney’s live-action *The Jungle Book* brings Rudyard Kipling’s classic tale to life with stunning CGI, heartwarming moments, and thrilling action.', 'https://m.media-amazon.com/images/M/MV5BMTc3NTUzNTI4MV5BMl5BanBnXkFtZTgwNjU0NjU5NzE@._V1_FMjpg_UX1000_.jpg', 'https://www.youtube.com/embed/zs4ePO-JSYw'),
('The Mummy', '1999', 'A daring adventurer and a librarian inadvertently awaken an ancient curse while exploring the pyramids of Egypt. As they search for the fabled lost city of Hamunaptra, they must face off against a resurrected mummy (Arnold Vosloo) and his army of undead. Packed with action, humor, and supernatural thrills, *The Mummy* is a rollicking adventure that blends the charm of classic adventure films with modern special effects.', 'https://upload.wikimedia.org/wikipedia/en/6/68/The_mummy.jpg', 'https://www.youtube.com/embed/ZsDqiSP9aaQ'),
('The Chronicles of Narnia: The Lion, the Witch and the Wardrobe', '2005', 'Four siblings are sent to the countryside during World War II, where they stumble upon a magical wardrobe that leads to the land of Narnia. In this enchanted realm, they must join forces with the noble lion Aslan to defeat the White Witch and bring peace to the kingdom. Based on C.S. Lewis’s beloved novel, *The Lion, the Witch and the Wardrobe* is an epic adventure filled with magic, mythical creatures, and unforgettable battles between good and evil.', 'https://m.media-amazon.com/images/I/81NEPVv9QVL._AC_UF1000,1000_QL80_.jpg', 'https://www.youtube.com/embed/3mKPrxjwF7A'),
('The G.I. Joe: The Rise of Cobra', '2009', 'A secret military team, G.I. Joe, must battle the evil organization Cobra, which is led by the sinister James McCullen (Christopher Eccleston). Armed with cutting-edge technology and elite soldiers, the G.I. Joe team embarks on a series of daring missions to stop Cobra from taking over the world. Packed with intense action, futuristic gadgets, and daring escapes, *G.I. Joe: The Rise of Cobra* is a high-energy adventure film for fans of military action and espionage.', 'https://m.media-amazon.com/images/I/81WO+ydYaDL.jpg', 'https://www.youtube.com/embed/lDVvFUbnqEM'),
('Stardust', '2007', 'In this magical fantasy adventure, a young man named Tristan (Charlie Cox) journeys into a magical realm to retrieve a fallen star for his beloved. However, he discovers that the star is not a rock, but a beautiful woman (Claire Danes), and he must protect her from a wicked witch and rival princes. *Stardust* is a whimsical, heartwarming adventure with a unique blend of magic, romance, and action that appeals to both adults and children.', 'https://m.media-amazon.com/images/M/MV5BMjkyMTE1OTYwNF5BMl5BanBnXkFtZTcwMDIxODYzMw@@._V1_.jpg', 'https://www.youtube.com/embed/0xhBJNWt0dw'),
('The Lost City', '2022', 'A reclusive romance novelist (Sandra Bullock) is kidnapped by an eccentric billionaire (Daniel Radcliffe) who believes she can lead him to a lost treasure hidden in the jungle. She teams up with her book’s cover model (Channing Tatum), and together they must navigate the dangerous jungle and escape the clutches of their captors. *The Lost City* is a fun and action-packed adventure comedy that blends romance, danger, and laughs into a thrilling ride.', 'https://m.media-amazon.com/images/M/MV5BZjA4YmZjMWItZGNkNS00ODFkLWEwNjUtNGNhMzViZDRmMzgxXkEyXkFqcGc@._V1_.jpg', 'https://www.youtube.com/embed/nfKO9rYDmE8'),
('The Divergent Series: Insurgent', '2015', 'In a dystopian future, the world is divided into factions based on human virtues, and Tris (Shailene Woodley), a rebellious young woman, is forced to go on the run after uncovering dangerous secrets about the society she lives in. With the help of her friends, she battles against an oppressive government and tries to find the truth behind the system. *Insurgent* is a thrilling, action-packed adventure set in a tense, dystopian world full of secrets and intrigue.', 'https://m.media-amazon.com/images/I/71s0knNI7cL._AC_UF1000,1000_QL80_.jpg', 'https://www.youtube.com/embed/IR-l_TSjlEo'),
('National Treasure', '2004', 'Treasure hunter Benjamin Franklin Gates (Nicolas Cage) embarks on a daring adventure to find a hidden treasure, but the clues are embedded in the nation’s history, and the first major clue is found on the back of the Declaration of Independence. With the help of his team, Gates races against time and a secretive group of treasure hunters to uncover the legendary riches of America’s founding fathers. *National Treasure* is an action-packed film full of puzzles, history, and non-stop adventure.', 'https://upload.wikimedia.org/wikipedia/en/1/12/Movie_national_treasure.JPG', 'https://www.youtube.com/embed/mcf4tXYjaxo');

-- Insert comedy_movies
INSERT INTO comedy_movies (title, release_year, description, image_url, trailer_url) VALUES 
('The Hangover', '2009', 'A Las Vegas bachelor party turns into a disaster when three friends wake up with no memory of the previous night and the groom missing. As they retrace their wild adventure to find him, they encounter a series of hilarious and unexpected obstacles. *The Hangover* is a fast-paced comedy about friendship, chaos, and unforgettable moments.', 'https://m.media-amazon.com/images/I/810-lQCEXRL._AC_UF894,1000_QL80_.jpg', 'https://www.youtube.com/embed/tlize92ffnY'),
('Superbad', '2007', 'Two high school seniors, Seth and Evan, try to enjoy their last days of high school by attending a wild party. As they attempt to buy alcohol, they face a series of mishaps and awkward encounters. *Superbad* is a coming-of-age comedy that highlights friendship, adolescence, and the hilarious challenges of growing up.', 'https://m.media-amazon.com/images/I/81fqqQrgyqL._AC_UF1000,1000_QL80_.jpg', 'https://www.youtube.com/embed/LvKvus3vCEY'),
('Step Brothers', '2008', 'Brennan and Dale, two middle-aged men, are forced to live together when their parents marry each other. As they become roommates, their immature and ridiculous behavior leads to hilarious chaos. *Step Brothers* is an outrageous comedy about two adults who refuse to grow up.', 'https://upload.wikimedia.org/wikipedia/en/d/d9/StepbrothersMP08.jpg', 'https://www.youtube.com/embed/CewglxElBK0'),
('21 Jump Street', '2012', 'Two undercover cops, Morton Schmidt and Greg Jenko, are sent back to high school to infiltrate a drug ring. As they relive their teenage years, their differences create hilarious situations. *21 Jump Street* is a fast-paced, irreverent comedy that combines action, humor, and a nostalgia for high school life.', 'https://m.media-amazon.com/images/M/MV5BMTg2NjJiODctM2IyMS00MmQ5LWI1YmQtNTBjMTI4M2U2YzA5XkEyXkFqcGc@._V1_.jpg', 'https://www.youtube.com/embed/RLoKtb4c4W0'),
('Anchorman: The Legend of Ron Burgundy', '2004', 'In 1970s San Diego, the chauvinistic and egotistical Ron Burgundy, a top-rated news anchor, must adjust to his changing world when a woman (Veronica Corningstone) joins the news team. *Anchorman* is a hilarious and satirical look at the world of TV news, with absurd humor and memorable one-liners.', 'https://m.media-amazon.com/images/I/51NsKSYKTyL._AC_UF894,1000_QL80_.jpg', 'https://www.youtube.com/embed/NJQ4qEWm9lU'),
('The 40-Year-Old Virgin', '2005', 'Andy, a 40-year-old man who has never had sex, faces constant pressure from his friends to lose his virginity. As he begins dating a woman named Trish, he learns about love, life, and intimacy in unexpected ways. *The 40-Year-Old Virgin* is a heartfelt and hilarious comedy about overcoming insecurities and finding love.', 'https://upload.wikimedia.org/wikipedia/en/4/43/40-Year-OldVirginMoviePoster.jpg', 'https://www.youtube.com/embed/YnDeJn-BX5Q'),
('Tropic Thunder', '2008', 'A group of actors, who are shooting a war film in Southeast Asia, are accidentally thrown into a real conflict. As they try to survive, the actors’ egos and lack of survival skills result in hilarious and outrageous situations. *Tropic Thunder* is a satirical and irreverent comedy about Hollywood, fame, and the absurdity of action films.', 'https://m.media-amazon.com/images/I/51AQVt+AIVL.jpg', 'https://www.youtube.com/embed/2Isjm_TJ08A'),
('Pineapple Express', '2008', 'When a stoner and his drug dealer witness a murder, they go on the run to avoid being killed by the criminals. *Pineapple Express* is a stoner action-comedy that blends humor with thrilling moments and a wild chase.', 'https://m.media-amazon.com/images/I/51h2jrm794L._AC_UF894,1000_QL80_.jpg', 'https://www.youtube.com/embed/BWZt4v6b1hI'),
('Hot Fuzz', '2007', 'When a top London cop is transferred to a small village, he teams up with a bumbling partner to investigate a series of strange deaths. As they uncover a larger conspiracy, the film becomes a hilarious parody of action movies. *Hot Fuzz* combines clever humor, action, and British wit.', 'https://m.media-amazon.com/images/M/MV5BYjFkZTkzZTQtNjM1ZS00M2EyLWE3MTAtMmY5Yzk0NTc0NDc3XkEyXkFqcGc@._V1_.jpg', 'https://www.youtube.com/embed/ayTnvVpj9t4'),
('Shaun of the Dead', '2004', 'When a zombie apocalypse breaks out, a group of friends tries to survive in a pub. *Shaun of the Dead* is a unique blend of horror and comedy, using wit and absurdity to explore friendship, survival, and life after the end of the world.', 'https://i.etsystatic.com/43710319/r/il/3ae5c5/4921532842/il_fullxfull.4921532842_mfq9.jpg', 'https://www.youtube.com/embed/LIfcaZ4pC-4'),
('Dumb and Dumber', '1994', 'Lloyd and Harry, two dimwitted friends, embark on a cross-country trip to return a suitcase to its rightful owner. Along the way, they cause a series of comedic disasters. *Dumb and Dumber* is a slapstick comedy about two lovable idiots whose journey is full of ridiculous moments.', 'https://m.media-amazon.com/images/I/51Z07DwVJmL._AC_UF894,1000_QL80_.jpg', 'https://www.youtube.com/embed/OyJhN2Es7Cw'),
('Ferris Bueller\'s Day Off', '1986', 'Ferris Bueller, a high school senior, skips school for a day of fun in Chicago, taking his friends along for the ride. As Ferris outsmarts his principal and parents, his day off becomes an unforgettable adventure. *Ferris Bueller’s Day Off* is a timeless comedy about breaking free from routine and living life to the fullest.', 'https://upload.wikimedia.org/wikipedia/en/9/9b/Ferris_Bueller%27s_Day_Off.jpg', 'https://www.youtube.com/embed/0ZDbKhkLxTs'),
('Legally Blonde', '2001', 'Elle Woods, a fashion-forward sorority girl, enrolls at Harvard Law School to win back her ex-boyfriend. Along the way, she discovers her true potential and becomes a successful lawyer. *Legally Blonde* is a witty and heartwarming comedy about breaking stereotypes and believing in yourself.', 'https://upload.wikimedia.org/wikipedia/en/b/be/Legally_Blonde_film_poster.png', 'https://www.youtube.com/embed/vWOHwI_FgAo'),
('Zombieland', '2009', 'A group of survivors, including a nerdy teen and a tough guy, navigate a post-apocalyptic world filled with zombies. *Zombieland* is a comedy-horror film that combines the thrills of a zombie apocalypse with humorous moments and quirky characters.', 'https://m.media-amazon.com/images/M/MV5BMTU5MDg0NTQ1N15BMl5BanBnXkFtZTcwMjA4Mjg3Mg@@._V1_.jpg', 'https://www.youtube.com/embed/8m9EVP8X7N8'),
('The Grand Budapest Hotel', '2014', 'In the fictional country of Zubrowka, a hotel concierge and his protégé get caught up in a scandal involving a priceless painting and a battle for a family fortune. *The Grand Budapest Hotel* is a whimsical and visually stunning comedy directed by Wes Anderson, full of quirky characters and eccentric humor.', 'https://a.ltrbxd.com/resized/film-poster/9/5/1/1/3/95113-the-grand-budapest-hotel-0-230-0-345-crop.jpg?v=6ac71cf4ba', 'https://www.youtube.com/embed/1Fg5iWmQjwk'),
('Clueless', '1995', 'Cher Horowitz, a rich and popular high school student in Beverly Hills, takes on the task of matchmaking her new friend, while learning valuable lessons about love, friendship, and self-worth. *Clueless* is a hilarious and endearing teen comedy that has become a cultural touchstone.', 'https://m.media-amazon.com/images/I/81QYsU7PmbL._UF1000,1000_QL80_.jpg', 'https://www.youtube.com/embed/lkA05QZgXa0'),
('The Inbetweeners Movie', '2011', 'The four socially awkward friends from *The Inbetweeners* TV series go on a wild trip to Malia, Greece, for a summer of sun, booze, and bad decisions. *The Inbetweeners Movie* is a raunchy, laugh-out-loud comedy about the misadventures of adolescence and friendship.', 'https://m.media-amazon.com/images/M/MV5BZGFmNzAyMjUtMjBkZC00NGY2LWI3ZDQtYjI5N2NiZDkxOTMwXkEyXkFqcGc@._V1_.jpg', 'https://www.youtube.com/embed/Om_HyEy-yog'),
('Ghostbusters', '1984', 'A group of eccentric scientists form a business to hunt ghosts in New York City. *Ghostbusters* is a classic supernatural comedy that combines the paranormal with humor and has become a cultural phenomenon.', 'https://i.etsystatic.com/8078437/r/il/114f43/3498047392/il_570xN.3498047392_jglk.jpg', 'https://www.youtube.com/embed/nDPObxEpmfI'),
('The Princess Diaries', '2001', 'Mia Thermopolis, an awkward teenager, discovers she is the heir to the throne of a small European country. As she navigates her newfound royal responsibilities, Mia learns about growing up, love, and family. *The Princess Diaries* is a charming and humorous story about self-discovery.', 'https://m.media-amazon.com/images/I/51DV7DNASZL._AC_UF1000,1000_QL80_.jpg', 'https://www.youtube.com/embed/CzcGwB7qat8');

-- Insert into drama_movies
INSERT INTO drama_movies (title, release_year, description, image_url, trailer_url) VALUES
('The Shawshank Redemption', '1994', 'Andy Dufresne, a banker wrongfully convicted of murder, is sentenced to life in Shawshank prison. Over the years, he forms a deep friendship with fellow inmate Ellis "Red" Redding, and through his resilience, he eventually finds a way to escape. *The Shawshank Redemption* is an inspiring and emotional story of hope, friendship, and redemption.', 'https://m.media-amazon.com/images/I/717W9DCnyzL._AC_UF894,1000_QL80_.jpg', 'https://www.youtube.com/embed/NmzuHjWmXOc'),
('Forrest Gump', '1994', 'Forrest Gump, a man with low intelligence but a big heart, unwittingly influences many important events in U.S. history through his life journey. From the Vietnam War to meeting presidents, Forrest’s story is one of love, perseverance, and destiny. *Forrest Gump* is a touching drama about the unpredictability of life and the power of kindness.', 'https://m.media-amazon.com/images/I/91++WV6FP4L._AC_UF894,1000_QL80_.jpg', 'https://www.youtube.com/embed/bLvqoHBptjg'),
('A Beautiful Mind', '2001', 'John Nash, a brilliant but socially awkward mathematician, struggles with paranoid schizophrenia while attempting to build a successful academic career. *A Beautiful Mind* is a deeply emotional drama about love, genius, and the battle with mental illness.', 'https://m.media-amazon.com/images/I/61D72s9qelL._AC_UF1000,1000_QL80_.jpg', 'https://www.youtube.com/embed/aS_d0Ayjw4o'),
('The Pursuit of Happyness', '2006', 'Chris Gardner, a struggling salesman, tries to provide a better life for his son despite facing homelessness and financial hardship. *The Pursuit of Happyness* is an inspiring drama about perseverance, fatherhood, and the pursuit of a better life.', 'https://m.media-amazon.com/images/M/MV5BMTQ5NjQ0NDI3NF5BMl5BanBnXkFtZTcwNDI0MjEzMw@@._V1_.jpg', 'https://www.youtube.com/embed/7guyl6_7sBo'),
('The Godfather', '1972', 'The aging patriarch of an organized crime dynasty transfers control of his clandestine empire to his reluctant son. *The Godfather* is a compelling and powerful drama that explores family loyalty, power, and corruption in the criminal underworld.', 'https://m.media-amazon.com/images/M/MV5BYTJkNGQyZDgtZDQ0NC00MDM0LWEzZWQtYzUzZDEwMDljZWNjXkEyXkFqcGc@._V1_.jpg', 'https://www.youtube.com/embed/UaVTIH8mujA'),
('Schindlers List', '1993', 'Oskar Schindler, a German businessman, saves the lives of over a thousand Polish Jews during the Holocaust by employing them in his factory. *Schindler\'s List* is a heart-wrenching and unforgettable drama about the atrocities of war and the power of one person to make a difference.', 'https://m.media-amazon.com/images/I/91RUXhkXchL._AC_UF1000,1000_QL80_.jpg', 'https://www.youtube.com/embed/mxphAlJID9U'),
('The Green Mile', '1999', 'Paul Edgecomb, a prison guard, forms an unlikely bond with John Coffey, a death row inmate with a supernatural gift. As Paul witnesses John’s extraordinary powers, he begins to question the justice system and his role in it. *The Green Mile* is a powerful and emotional drama about faith, compassion, and human dignity.', 'https://m.media-amazon.com/images/I/71RjQDD8X4L._AC_UF1000,1000_QL80_.jpg', 'https://www.youtube.com/embed/Bg7epsq0OIQ'),
('Good Will Hunting', '1997', 'Will Hunting, a janitor at MIT, is a self-taught mathematical genius with a troubled past. After assaulting a police officer, he is sent to therapy, where he forms a life-changing relationship with his therapist. *Good Will Hunting* is a poignant drama about redemption, love, and realizing one’s potential.', 'https://m.media-amazon.com/images/I/71JBbULtGSL._AC_UF894,1000_QL80_.jpg', 'https://www.youtube.com/embed/ReIJ1lbL-Q8'),
('12 Years a Slave', '2013', 'Solomon Northup, a free African American man, is kidnapped and sold into slavery. Over the course of twelve years, he faces unimaginable hardships and is forced to endure brutal labor on a plantation. *12 Years a Slave* is a haunting and powerful drama based on a true story about survival, resilience, and freedom.', 'https://static0.srcdn.com/wordpress/wp-content/uploads/2023/05/12-years-a-slave-movie-poster.jpg', 'https://www.youtube.com/embed/z02Ie8wKKRg'),
('The Social Network', '2010', 'The story of the founding of Facebook, focusing on the legal battles and betrayals that followed. *The Social Network* is a sharp, fast-paced drama about ambition, innovation, and the complexities of friendship and success in the digital age.', 'https://m.media-amazon.com/images/I/518zV7F39qL.jpg', 'https://www.youtube.com/embed/lB95KLmpLR4'),
('The Revenant', '2015', 'After being left for dead by his expedition team, frontiersman Hugh Glass embarks on a grueling journey for survival and revenge. *The Revenant* is a brutal, visually stunning drama about the strength of the human spirit and the fight for survival against all odds.', 'https://m.media-amazon.com/images/I/712nPTA1EPL._AC_UF1000,1000_QL80_.jpg', 'https://www.youtube.com/embed/LoebZZ8K5N0'),
('Birdman', '2014', 'Riggan Thomson, a washed-up actor best known for playing a superhero, struggles to mount a Broadway play while battling his own ego and inner demons. *Birdman* is a unique and darkly comic drama about identity, fame, and the human desire for recognition and redemption.', 'https://www.rogerebert.com/wp-content/uploads/2024/08/Birdman-jpg.webp', 'https://www.youtube.com/embed/uJfLoE6hanc'),
('The Fault in Our Stars', '2014', 'Two teenagers, Hazel and Gus, both battling cancer, fall in love and embark on a poignant journey to understand life, death, and love. *The Fault in Our Stars* is a heartfelt drama about finding beauty and meaning in life, even in the face of terminal illness.', 'https://m.media-amazon.com/images/M/MV5BYTA4ODg5YWUtYmZiYy00Y2M4LWE0NjEtODE5MzhkYmJmZGEwXkEyXkFqcGc@._V1_.jpg', 'https://www.youtube.com/embed/9ItBvH5J6ss'),
('Manchester by the Sea', '2016', 'Lee Chandler returns to his hometown after the death of his brother, only to discover that he has been named the guardian of his nephew. As Lee confronts his painful past, he must navigate the challenges of grief and responsibility. *Manchester by the Sea* is a moving drama about loss, family, and the complexity of healing.', 'https://m.media-amazon.com/images/I/61Is6zNggRL._AC_UF1000,1000_QL80_.jpg', 'https://www.youtube.com/embed/gsVoD0pTge0'),
('Requiem for a Dream', '2000', 'A disturbing and intense look at four individuals whose lives spiral into despair as they become addicted to drugs. *Requiem for a Dream* is a harrowing drama that explores the devastating impact of addiction on the human mind and body.', 'https://resizing.flixster.com/-XZAfHZM39UwaGJIFWKAE8fS0ak=/v3/t/assets/p25574_p_v12_ab.jpg', 'https://www.youtube.com/embed/1O8jX0r_uPE'),
('The Imitation Game', '2014', 'Alan Turing, a brilliant mathematician, is tasked with breaking the German Enigma code during World War II, while also dealing with his own personal struggles. *The Imitation Game* is an inspiring drama about intelligence, secrecy, and the tragic story of a man who changed the course of history.', 'https://m.media-amazon.com/images/I/71j1h5yz+tL._AC_UF1000,1000_QL80_.jpg', 'https://www.youtube.com/embed/j2jRs4EAvWM'),
('The Fighter', '2010', 'Micky Ward, a boxer from a tough neighborhood, struggles to overcome his troubled family, personal demons, and injuries to achieve his dreams. *The Fighter* is a gritty and emotional drama about family, perseverance, and the fight for success.', 'https://m.media-amazon.com/images/I/51znLKWx05L._AC_UF894,1000_QL80_.jpg', 'https://www.youtube.com/embed/LRIZ4mCi5Ps'),
('The Kings Speech', '2010', 'King George VI of Britain enlists the help of an unorthodox speech therapist to overcome his stutter as he prepares to lead the nation during World War II. *The King\'s Speech* is an inspiring and historical drama about leadership, overcoming personal challenges, and the bond between a king and his therapist.', 'https://m.media-amazon.com/images/I/514v4Hm0feL._AC_UF1000,1000_QL80_.jpg', 'https://www.youtube.com/embed/EcxBrTvLbBM');

-- Insert into fantasy_movies
INSERT INTO fantasy_movies (title, release_year, description, image_url, trailer_url) VALUES
('The Lord of the Rings: The Fellowship of the Ring', '2001', 'A young hobbit named Frodo Baggins embarks on a perilous journey with a fellowship of companions to destroy a powerful ring that could bring darkness to the world. *The Fellowship of the Ring* is the first part of a sweeping fantasy epic about bravery, friendship, and the fight against evil.', 'https://upload.wikimedia.org/wikipedia/en/f/fb/Lord_Rings_Fellowship_Ring.jpg', 'https://www.youtube.com/embed/V75dMMIW2B4'),
('Harry Potter and the Sorcerer\'s Stone', '2001', 'Harry Potter, a young boy who discovers he is a wizard, begins his education at Hogwarts School of Witchcraft and Wizardry. Along with his friends, Ron and Hermione, he must uncover the mystery surrounding a magical artifact. *The Sorcerer\'s Stone* is the beginning of a magical fantasy series filled with wonder, danger, and friendship.', 'https://m.media-amazon.com/images/I/71x1RHSaEhL._AC_UF894,1000_QL80_.jpg', 'https://www.youtube.com/embed/Yki6KgoBstM'),
('The Chronicles of Narnia: The Lion, the Witch and the Wardrobe', '2005', 'Four siblings step through a wardrobe into the magical land of Narnia, where they must help the great lion Aslan defeat the White Witch and bring peace to the land. *The Lion, the Witch and the Wardrobe* is a thrilling fantasy adventure about good versus evil, courage, and the power of belief.', 'https://m.media-amazon.com/images/I/71jDHbS3I6L._AC_UF894,1000_QL80_.jpg', 'https://www.youtube.com/embed/3mKPrxjwF7A'),
('The Wizard of Oz', '1939', 'A young girl named Dorothy is swept away to a magical land by a tornado, where she embarks on an unforgettable journey to meet the Wizard and find her way home. Along the way, she befriends a scarecrow, a tin man, and a lion. *The Wizard of Oz* is a timeless fantasy classic about friendship, courage, and following your dreams.', 'https://m.media-amazon.com/images/I/71HDJ0mggsL._AC_UF894,1000_QL80_.jpg', 'https://www.youtube.com/embed/njdreZRjvpc'),
('Avatar', '2009', 'On the distant planet of Pandora, a paraplegic ex-Marine is given a chance to walk again through an avatar body. He becomes torn between his loyalty to his human commanders and his growing connection to the indigenous Na’vi people. *Avatar* is a stunning fantasy and sci-fi adventure about the clash between nature and technology.', 'https://i.etsystatic.com/43710319/r/il/c1ca5a/6095503378/il_570xN.6095503378_m6o4.jpg', 'https://www.youtube.com/embed/5PSNL1qE6VY'),
('The Hobbit: An Unexpected Journey', '2012', 'Bilbo Baggins, a hobbit, is swept into a quest to reclaim a stolen treasure from the fearsome dragon Smaug. Along the way, he encounters trolls, goblins, and elves. *An Unexpected Journey* is a prequel to *The Lord of the Rings*, filled with adventure, magic, and danger.', 'https://m.media-amazon.com/images/I/81Xl382A58L.jpg', 'https://www.youtube.com/embed/SDnYMbYB-nU'),
('Stardust', '2007', 'A young man ventures into a magical realm to capture a falling star for his beloved. However, he soon discovers that the star is a living woman, and he must protect her from witches and princes seeking her power. *Stardust* is a whimsical and adventurous fantasy film about love, destiny, and magic.', 'https://m.media-amazon.com/images/I/51eV9jsY0JL._AC_UF894,1000_QL80_.jpg', 'https://www.youtube.com/embed/0xhBJNWt0dw'),
('Alice in Wonderland', '2010', 'Alice returns to Wonderland, where she must join forces with familiar friends to stop the Red Queen’s reign of terror. In this fantastical world, she embarks on a journey of self-discovery and adventure. *Alice in Wonderland* is a visually stunning fantasy film that reimagines Lewis Carroll’s beloved tale.', 'https://m.media-amazon.com/images/I/51wYoXzxezL._AC_UF894,1000_QL80_.jpg', 'https://www.youtube.com/embed/9POCgSRVvf0'),
('The NeverEnding Story', '1984', 'A young boy named Bastian reads a magical book that takes him to the land of Fantasia, where he must help save the kingdom from an evil force known as The Nothing. *The NeverEnding Story* is a fantasy adventure about the power of imagination and storytelling.', 'https://m.media-amazon.com/images/I/51+C1zEpFNL.jpg', 'https://www.youtube.com/embed/YKGYgFPAP14'),
('Pan\'s Labyrinth', '2006', 'In the midst of the Spanish Civil War, a young girl named Ofelia escapes into a mythical labyrinth where she meets a faun who sets her on a dangerous quest. *Pan’s Labyrinth* is a dark and enchanting fantasy film that blends fairy tale elements with the harsh realities of war.', 'https://m.media-amazon.com/images/I/51frVoyuc7L.jpg', 'https://www.youtube.com/embed/oOQV8gg9b5o'),
('The Dark Crystal', '1982', 'In a mystical world, a young Gelfling named Jen embarks on a quest to heal the Dark Crystal and restore balance to the land. *The Dark Crystal* is a visually breathtaking fantasy film from Jim Henson, filled with puppet creatures and an epic battle between good and evil.', 'https://m.media-amazon.com/images/I/51yBYb2gRdL._AC_UF894,1000_QL80_.jpg', 'https://www.youtube.com/embed/P5Dj3jhy7xM'),
('The Princess Bride', '1987', 'A young woman named Buttercup is kidnapped, and a mysterious hero sets off on a journey to rescue her. Along the way, he battles giants, roguish swordsmen, and the evil Prince Humperdinck. *The Princess Bride* is a charming and humorous fantasy adventure that is beloved by audiences of all ages.', 'https://m.media-amazon.com/images/I/712n+hhjX3L._AC_UF1000,1000_QL80_.jpg', 'https://www.youtube.com/embed/KmXptjknRa8'),
('Eragon', '2006', 'A young farm boy named Eragon discovers a dragon egg, and with the help of a mysterious mentor, he must learn to harness his new powers to fight against an evil empire. *Eragon* is a fantasy adventure film filled with dragons, magic, and heroism.', 'https://m.media-amazon.com/images/I/51IlU1el4NL._AC_UF894,1000_QL80_.jpg', 'https://www.youtube.com/embed/MAqm-1zUyno'),
('The Golden Compass', '2007', 'In a world where people have animal companions that represent their souls, young Lyra Belacqua embarks on a journey to find her kidnapped friend and unravel a mystery surrounding a powerful artifact called the Golden Compass. *The Golden Compass* is a fantastical adventure filled with magic, danger, and destiny.', 'https://m.media-amazon.com/images/I/61oExkGAvrL._AC_UF1000,1000_QL80_.jpg', 'https://www.youtube.com/embed/ackucNuGOfI'),
('Labyrinth', '1986', 'When her brother is kidnapped by goblins, Sarah must journey through a labyrinth to rescue him from the Goblin King. *Labyrinth* is a beloved fantasy film from Jim Henson, filled with strange creatures, puzzles, and a story of bravery and self-discovery.', 'https://m.media-amazon.com/images/I/619yt12HbSL.jpg', 'https://www.youtube.com/embed/-9vcQW_48D4'),
('Percy Jackson & the Olympians: The Lightning Thief', '2010', 'Percy Jackson, a teenager who discovers he is the son of Poseidon, embarks on a quest to prevent a war between the Greek gods. *The Lightning Thief* is an action-packed fantasy adventure that brings ancient mythology into the modern world.', 'https://m.media-amazon.com/images/I/51Xh1SIrwLL.jpg', 'https://www.youtube.com/embed/R86InkfdboA'),
('The Secret of Kells', '2009', 'In medieval Ireland, a young boy named Brendan embarks on a magical journey to complete a mystical illuminated manuscript. *The Secret of Kells* is a visually stunning and imaginative fantasy film inspired by Irish mythology and Celtic culture.', 'https://m.media-amazon.com/images/I/51KqMLIJdvL.jpg', 'https://www.youtube.com/embed/tMPhHTtKZ8Q');

-- Insert into historical_movies
INSERT INTO historical_movies (title, release_year, description, image_url, trailer_url) VALUES
('The Revenant', '2015', 'After being left for dead by his expedition team, frontiersman Hugh Glass embarks on a grueling journey for survival and revenge. *The Revenant* is a brutal, visually stunning drama about the strength of the human spirit and the fight for survival against all odds.', 'https://m.media-amazon.com/images/I/712nPTA1EPL._AC_UF1000,1000_QL80_.jpg', 'https://www.youtube.com/embed/LoebZZ8K5N0'),
('The Patriot', '2000', 'A widowed farmer joins the Continental Army and leads a militia during the American Revolution, with a quest for revenge against British forces.', 'https://m.media-amazon.com/images/I/71g+zsYzXfL._AC_UF894,1000_QL80_.jpg', 'https://www.youtube.com/embed/Clh5qDQ1-lI'),
('Valkyrie', '2008', 'During World War II, a group of German officers attempt to assassinate Adolf Hitler and end the war.', 'https://m.media-amazon.com/images/I/51NEdUXpnzL._AC_UF894,1000_QL80_.jpg', 'https://www.youtube.com/embed/-YppIQUiE9Y'),
('The Last of the Mohicans', '1992', 'A Native American and his adopted white family fight the French and their allies during the French and Indian War.', 'https://m.media-amazon.com/images/I/51w6Y-RGvpL._AC_UF894,1000_QL80_.jpg', 'https://www.youtube.com/embed/yaQeVnN6pUc'),
('Patton', '1970', 'The story of the controversial World War II general George S. Patton, a complex figure known for his military genius and unorthodox style.', 'https://m.media-amazon.com/images/I/51oOD6r47AL._AC_UF894,1000_QL80_.jpg', 'https://www.youtube.com/embed/g-0dTpzNzwo'),
('The Chernobyl Diaries', '2012', 'A group of tourists visit the area around the Chernobyl nuclear disaster site, only to encounter danger when they find themselves trapped in the irradiated zone.', 'https://m.media-amazon.com/images/M/MV5BNzkwNDkyNTUxNV5BMl5BanBnXkFtZTcwODY1NTE3Nw@@._V1_.jpg', 'https://www.youtube.com/embed/n4y4KCrg1P0'),
('The Good Shepherd', '2006', 'A chronicle of the early history of the CIA, focusing on the life of a recruitment officer in the post-World War II era.', 'https://m.media-amazon.com/images/I/81RZIzAmA7L._AC_UF1000,1000_QL80_.jpg', 'https://www.youtube.com/embed/xWy0l2fmo_c'),
('Master and Commander: The Far Side of the World', '2003', 'Set during the Napoleonic Wars, Captain Jack Aubrey faces challenges on both the seas and within his crew during an intense voyage.', 'https://m.media-amazon.com/images/I/819YA2h9hCL._AC_UF894,1000_QL80_.jpg', 'https://www.youtube.com/embed/6oyQGHHz8U8'),
('The Bridge at Remagen', '1969', 'During World War II, American soldiers fight to capture a vital bridge in Germany, using it to secure a decisive military victory.', 'https://m.media-amazon.com/images/M/MV5BNjI2MjgzOTAxNF5BMl5BanBnXkFtZTYwMjA4Mzc5._V1_.jpg', 'https://www.youtube.com/embed/WyXF-hnEKEg'),
('Waterloo', '1970', 'A large-scale epic about the Battle of Waterloo, focusing on the final confrontation between Napoleon Bonaparte and the British army.', 'https://m.media-amazon.com/images/I/61GfPwGQraL._AC_UF1000,1000_QL80_.jpg', 'https://www.youtube.com/embed/JmRDwWiz6kw'),
('Tora! Tora! Tora!', '1970', 'A dramatic re-enactment of the attack on Pearl Harbor, showing the event from both the Japanese and American perspectives.', 'https://m.media-amazon.com/images/I/711KSB6tnRL._AC_UF894,1000_QL80_.jpg', 'https://www.youtube.com/embed/2QwaNhalGcQ'),
('Glory', '1989', 'The true story of the first all-black regiment to fight for the Union Army during the American Civil War, as they struggle with both external enemies and internal prejudice.', 'https://m.media-amazon.com/images/I/71bX5-dI4GL._AC_UF350,350_QL80_.jpg', 'https://www.youtube.com/embed/CvmuHfSgra8'),
('The Siege of Jadotville', '2016', 'Based on a true story, a group of Irish UN peacekeepers fight to hold off a siege by mercenaries in the Congo during the 1960s.', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTRleRUWK6QHReO7Ucq_F14BmXR2iJIruZf3g&s', 'https://www.youtube.com/embed/9_JHsiQTTmg'),
('The Bounty', '1984', 'The story of the famous mutiny aboard the British ship "HMS Bounty" led by Fletcher Christian against Captain William Bligh in 1789.', 'https://m.media-amazon.com/images/M/MV5BOTEzY2U0YmMtMzUzNC00OTVkLWIyZTYtMDBjMTYzZWFkOWQwXkEyXkFqcGc@._V1_FMjpg_UX1000_.jpg', 'https://www.youtube.com/embed/6TWUgR1gPzw'),
('Midway', '2019', 'A historical drama recounting the Battle of Midway, one of the most decisive battles of World War II, through the eyes of American soldiers and aviators.', 'https://m.media-amazon.com/images/M/MV5BZDcyMGVlYzctZjYwNC00MDBiLTg1NDAtNzcxZjlhZTA4NzczXkEyXkFqcGc@._V1_.jpg', 'https://www.youtube.com/embed/BfTYY_pac8o'),
('A Bridge Too Far', '1977', 'A large-scale epic about Operation Market Garden, the failed World War II Allied military operation aimed at crossing the Rhine River in the Netherlands.', 'https://m.media-amazon.com/images/M/MV5BODg5MDQ5OTAtNzU3NC00YjBjLTkzM2MtNDdiOGMwOTJiYWI1XkEyXkFqcGc@._V1_.jpg', 'https://www.youtube.com/embed/AWL184ZcSxA'),
('The Messenger: The Story of Joan of Arc', '1999', 'The story of Joan of Arc, a young peasant girl who led the French army to victory over the English during the Hundred Years\' War before being captured and executed.', 'https://m.media-amazon.com/images/M/MV5BYmE2ZWIxMzYtMTI3Mi00MzUyLTg1MzktNTc0MjVlNDA3ZGI3XkEyXkFqcGc@._V1_FMjpg_UX1000_.jpg', 'https://www.youtube.com/embed/aCbMOQIs45s'),
('The Young Victoria', '2009', 'A historical drama that chronicles the early life and reign of Queen Victoria, focusing on her romance and marriage to Prince Albert.', 'https://m.media-amazon.com/images/M/MV5BZDI4ODBlM2QtYjUxMS00OGRiLWI2YjgtZjI0YjU1YWY2MTJjXkEyXkFqcGc@._V1_FMjpg_UX1000_.jpg', 'https://www.youtube.com/embed/7uKX_9r3X1g'),
('The Lost Battalion', '2001', 'Based on a true story of the American soldiers trapped behind enemy lines during World War I, fighting for survival and recognition.', 'https://m.media-amazon.com/images/M/MV5BMTY1NzQ3OTczNF5BMl5BanBnXkFtZTcwMzQ5MzEyMQ@@._V1_.jpg', 'https://www.youtube.com/embed/CAzp60bwmPs'),
('The Hill', '1965', 'A drama set during World War II that follows a group of U.S. soldiers who must survive the brutal training and discipline of a military prison.', 'https://upload.wikimedia.org/wikipedia/en/0/07/The_Hill_2023_Poster.png', 'https://www.youtube.com/embed/wXj7IRAAGb4');

-- Insert into horror_moviews
INSERT INTO horror_movies (title, release_year, description, image_url, trailer_url) VALUES
('The Conjuring', '2013', 'Paranormal investigators work to help a family terrorized by a dark presence in their farmhouse.', 'https://m.media-amazon.com/images/I/51XZ4OitzbL._AC_UF894,1000_QL80_.jpg', 'https://www.youtube.com/embed/k10ETZ41q5o'),
('Hereditary', '2018', 'A grieving family is haunted by tragic events and dark secrets, revealing a sinister inheritance.', 'https://m.media-amazon.com/images/I/41HCsm-ZScL._AC_UF894,1000_QL80_.jpg', 'https://www.youtube.com/embed/V6wWKNij_1M'),
('It', '2017', 'A group of outcast kids are terrorized by a shape-shifting monster that takes the form of a clown.', 'https://m.media-amazon.com/images/I/61L9icyqjqL._AC_UF1000,1000_QL80_.jpg', 'https://www.youtube.com/embed/WHcLFkL8ulo'),
('The Ring', '2002', 'A journalist investigates a mysterious videotape that seems to cause the deaths of those who view it.', 'https://m.media-amazon.com/images/I/41CGtdWTDvL.jpg', 'https://www.youtube.com/embed/CG7BAY6_hsw'),
('A Quiet Place', '2018', 'In a post-apocalyptic world, a family must live in silence to avoid blind monsters with an acute sense of hearing.', 'https://m.media-amazon.com/images/I/A1VPnDzBH3L._AC_UF894,1000_QL80_.jpg', 'https://www.youtube.com/embed/WR7cc5t7tv8'),
('Get Out', '2017', 'A young African-American man visits his white girlfriend\'s family estate, where his unease grows as he discovers strange occurrences.', 'https://m.media-amazon.com/images/M/MV5BMjUxMDQwNjcyNl5BMl5BanBnXkFtZTgwNzcwMzc0MTI@._V1_.jpg', 'https://www.youtube.com/embed/sRfnevzM9kQ'),
('The Shining', '1980', 'A man takes a job as the caretaker of an isolated hotel, where he and his family are driven insane by supernatural forces.', 'https://m.media-amazon.com/images/I/618E9GBsYpL._AC_UF894,1000_QL80_.jpg', 'https://www.youtube.com/embed/5Cb3ik6zP2I'),
('Psycho', '1960', 'A secretary embezzles money and ends up at a secluded motel run by a disturbed man with a dark secret.', 'https://m.media-amazon.com/images/I/61MeaZihONL._AC_UF894,1000_QL80_.jpg', 'https://www.youtube.com/embed/NG3-GlvKPcg'),
('The Exorcist', '1973', 'When a young girl is possessed by a demon, her mother seeks the help of two priests to save her.', 'https://m.media-amazon.com/images/I/61tF7jKagWL._AC_UF894,1000_QL80_.jpg', 'https://www.youtube.com/embed/PIxpPMyGcpU'),
('Rosemary\'s Baby', '1968', 'A young pregnant woman suspects that an evil cult wants to take her baby for use in their Satanic rituals.', 'https://m.media-amazon.com/images/I/A1Vmrrc2S+L._AC_UF1000,1000_QL80_.jpg', 'https://www.youtube.com/embed/Ffw1u0aXn0o'),
('The Texas Chain Saw Massacre', '1974', 'A group of friends become victims of a family of cannibals after encountering a demented man wielding a chainsaw.', 'https://m.media-amazon.com/images/I/51wujUHTljL.jpg', 'https://www.youtube.com/embed/-e3sv1NzrCA'),
('Paranormal Activity', '2007', 'A young couple is haunted by a supernatural presence in their home, captured through a series of surveillance cameras.', 'https://m.media-amazon.com/images/I/51HKtV4sOcL._AC_UF894,1000_QL80_.jpg', 'https://www.youtube.com/embed/F_UxLEqd074'),
('Insidious', '2010', 'A family is haunted by malevolent spirits as their son falls into a mysterious coma.', 'https://m.media-amazon.com/images/M/MV5BMTYyOTAxMDA0OF5BMl5BanBnXkFtZTcwNzgwNTc1NA@@._V1_FMjpg_UX1000_.jpg', 'https://www.youtube.com/embed/ZuQuOnYnr3Q'),
('Midsommar', '2019', 'A group of friends travel to Sweden to attend a midsummer festival, only to discover the horrifying secrets of the isolated commune.', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQyrcLAg3M-4BhEJXzGLqdTVjnef_4XP3bK9g&s', 'https://www.youtube.com/embed/1Vnghdsjmd0'),
('The Babadook', '2014', 'A single mother and her son are tormented by a mysterious creature from a children\'s book.', 'https://m.media-amazon.com/images/I/71XizrC6dlL._AC_UF894,1000_QL80_.jpg', 'https://www.youtube.com/embed/88DDAyYkvis'),
('It Follows', '2014', 'A young woman is followed by a supernatural entity after a sexual encounter, and must find a way to escape it.', 'https://m.media-amazon.com/images/I/91knd7FVW5L._AC_UF1000,1000_QL80_.jpg', 'https://www.youtube.com/embed/9tyMi1Hn32I'),
('Jaws', '1975', 'A small beach town is terrorized by a giant shark, and a police chief, marine biologist, and fisherman must kill it.', 'https://i.etsystatic.com/31354435/r/il/7df308/3253299542/il_1080xN.3253299542_bwni.jpg', 'https://www.youtube.com/embed/U1fu_sA7XhE'),
('Don\'t Breathe', '2016', 'Three friends break into a blind man\'s house, thinking it will be an easy robbery, only to discover he has terrifying secrets.', 'https://www.movieposters.com/cdn/shop/products/abee3e9e3911a9e2e032eae5b71da73c_c17cdc35-0225-4999-9bc2-7025a49313e0_480x.progressive.jpg?v=1573594826', 'https://www.youtube.com/embed/76yBTNDB6vU'),
('The Witch', '2015', 'A family in 1630s New England is torn apart by paranoia and religious fanaticism as they suspect a witch is living in the nearby woods.', 'https://m.media-amazon.com/images/I/611N8vP4rML._AC_UF894,1000_QL80_.jpg', 'https://www.youtube.com/embed/eYJuGhT5nYs'),
('The Others', '2001', 'A woman living with her two light-sensitive children in an old house begins to suspect that it is haunted.', 'https://m.media-amazon.com/images/I/41DzfqF0JSL._AC_UF894,1000_QL80_.jpg', 'https://www.youtube.com/embed/RfHY291jCLQ');

-- insert into fiction_movies
INSERT INTO fiction_movies (title, release_year, description, image_url, trailer_url) VALUES
('Blade Runner 2049', '2017', 'A young blade runner uncovers a long-buried secret that could plunge what\'s left of society into chaos.', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRWGGiZufoGeozVAY5Kh9nCjp_qlQL1DBpkLg&s', 'https://www.youtube.com/embed/dZOaI_Fn5o4'),
('Inception', '2010', 'A thief who enters the dreams of others to steal secrets is given the task of planting an idea into someone\'s mind.', 'https://cdn11.bigcommerce.com/s-yzgoj/images/stencil/1280x1280/products/2919271/5944675/MOVEB46211__19379.1679590452.jpg?c=2', 'https://www.youtube.com/embed/8hP9D6kZseM'),
('The Matrix', '1999', 'A hacker discovers that reality as he knows it is a simulation created by machines to subjugate humanity.', 'https://m.media-amazon.com/images/I/51DNKuITITL._AC_UF350,350_QL50_.jpg', 'https://www.youtube.com/embed/TPxQqWp7kTA'),
('Interstellar', '2014', 'A group of astronauts travels through a wormhole in space in an attempt to ensure humanity\'s survival.', 'https://m.media-amazon.com/images/I/71JC2qvPx5L._AC_UF894,1000_QL80_.jpg', 'https://www.youtube.com/embed/zSWdZVtXT7E'),
('The Fifth Element', '1997', 'In the 23rd century, a cab driver becomes involved in a mission to save the world from an ancient cosmic evil.', 'https://m.media-amazon.com/images/I/51F9sNOoPDL._AC_UF894,1000_QL80_.jpg', 'https://www.youtube.com/embed/fQ9RqgcR24g'),
('The Martian', '2015', 'An astronaut is stranded on Mars and must use his ingenuity to survive while awaiting rescue.', 'https://lumiere-a.akamaihd.net/v1/images/image_a119dd78.jpeg?region=0%2C0%2C800%2C1200', 'https://www.youtube.com/embed/2p7bgMxewxA'),
('Minority Report', '2002', 'In the future, a specialized police department apprehends criminals based on foreknowledge provided by psychics.', 'https://m.media-amazon.com/images/I/61jDdHDlldL.jpg', 'https://www.youtube.com/embed/lG7DGMgfOb8'),
('Starship Troopers', '1997', 'In the future, a young soldier engages in a war against a deadly alien species known as the Arachnids.', 'https://m.media-amazon.com/images/I/51+pW8yRfhL.jpg', 'https://www.youtube.com/embed/3mmDtxyJFKc'),
('Elysium', '2013', 'In the year 2154, the rich live on a luxurious space station, while the poor are left to suffer on Earth.', 'https://m.media-amazon.com/images/I/51d3PnDJ2IL._AC_UF894,1000_QL80_.jpg', 'https://www.youtube.com/embed/oIBtePb-dGY'),
('Ex Machina', '2014', 'A young programmer is selected to participate in a groundbreaking experiment in artificial intelligence by evaluating the human qualities of a highly advanced humanoid A.I.', 'https://m.media-amazon.com/images/I/71HOQzDja4L._AC_UF894,1000_QL80_.jpg', 'https://www.youtube.com/embed/EoQuVnKhxaM'),
('Arrival', '2016', 'A linguist is recruited to help communicate with extraterrestrial beings who have landed on Earth.', 'https://m.media-amazon.com/images/I/71l6fadsRMS.jpg', 'https://www.youtube.com/embed/7W1m5ER3I1Y'),
('Jurassic Park', '1993', 'A theme park on an island becomes the site of chaos when genetically engineered dinosaurs break free.', 'https://m.media-amazon.com/images/I/91PPR5VVHeL._AC_UF894,1000_QL80_.jpg', 'https://www.youtube.com/embed/bx46tthKXmc'),
('The Terminator', '1984', 'A cyborg assassin from the future is sent back in time to kill the mother of the future leader of a human resistance group.', 'https://m.media-amazon.com/images/I/61sQGAWUOWL.jpg', 'https://www.youtube.com/embed/k64P4l2Wmeg'),
('Avatar', '2009', 'A paraplegic marine dispatched to the moon Pandora on a unique mission becomes torn between following his orders and protecting the world he feels is his home.', 'https://m.media-amazon.com/images/I/41kTVLeW1CL._AC_UF894,1000_QL80_.jpg', 'https://www.youtube.com/embed/5PSNL1qE6VY'),
('Moon', '2009', 'A man working on a lunar base begins to question his reality as he nears the end of his three-year stint on the moon.', 'https://m.media-amazon.com/images/I/511wY7JRlxL.jpg', 'https://www.youtube.com/embed/WWoDBcSW4_c'),
('Children of Men', '2006', 'In a bleak future where humans have become infertile, a disillusioned bureaucrat must protect a miraculously pregnant woman.', 'https://m.media-amazon.com/images/I/81UvDBD1M6L._AC_UF894,1000_QL80_.jpg', 'https://www.youtube.com/embed/2VT2apoX90o'),
('Looper', '2012', 'In a future where time travel exists, a hitman is faced with the moral dilemma of killing his future self.', 'https://m.media-amazon.com/images/I/61amzF02lfL.jpg', 'https://www.youtube.com/embed/2iQuhsmtfHw'),
('A.I. Artificial Intelligence', '2001', 'In a future where robots are created to resemble humans, a child-like android embarks on a journey to become real.', 'https://m.media-amazon.com/images/I/410GDTixUHL._AC_UF894,1000_QL80_.jpg', 'https://www.youtube.com/embed/pm7qlQ2E0iE'),
('Blade Runner', '1982', 'In a dystopian future, a blade runner must track down and terminate rogue replicants who have returned to Earth.', 'https://m.media-amazon.com/images/M/MV5BOWQ4YTBmNTQtMDYxMC00NGFjLTkwOGQtNzdhNmY1Nzc1MzUxXkEyXkFqcGc@._V1_FMjpg_UX1000_.jpg', 'https://www.youtube.com/embed/eogpIG53Cis'),
('The Island', '2005', 'In a futuristic society, residents of a controlled environment are told they are the last survivors of a global disaster, but the truth is far darker.', 'https://m.media-amazon.com/images/I/91BO-pR238L._AC_UF1000,1000_QL80_.jpg', 'https://www.youtube.com/embed/QLTaK2wxJ_w'),
('Dune', '2021', 'A noble family becomes embroiled in a war for control of the most valuable asset in the galaxy – the spice melange.', 'https://i.redd.it/3fl2s0q1ug661.jpg', 'https://www.youtube.com/embed/n9xhJrPXop4');

-- insert into thriller_movies
INSERT INTO thriller_movies (title, release_year, description, image_url, trailer_url) VALUES
('Se7en', '1995', 'Two detectives hunt a serial killer who uses the seven deadly sins as his modus operandi.', 'https://m.media-amazon.com/images/M/MV5BY2IzNzMxZjctZjUxZi00YzAxLTk3ZjMtODFjODdhMDU5NDM1XkEyXkFqcGc@._V1_.jpg', 'https://www.youtube.com/embed/znmZoVkCjpI'),
('Gone Girl', '2014', 'A man becomes the prime suspect in the disappearance of his wife, who may have staged her own kidnapping.', 'https://m.media-amazon.com/images/I/413rc43IWaL._AC_UF894,1000_QL80_.jpg', 'https://www.youtube.com/embed/2-_-1nJf8Vg'),
('The Sixth Sense', '1999', 'A young boy communicates with spirits that don\'t know they\'re dead, and a troubled child psychologist tries to help him.', 'https://m.media-amazon.com/images/I/61heMaZlMEL._AC_UF1000,1000_QL80_.jpg', 'https://www.youtube.com/embed/3-ZP95NF_Wk'),
('Shutter Island', '2010', 'A U.S. Marshal investigates the disappearance of a patient from a mental institution on an isolated island.', 'https://m.media-amazon.com/images/I/51MsI8xR-NL._AC_UF894,1000_QL80_.jpg', 'https://www.youtube.com/embed/v8yrZSkKxTA'),
('Prisoners', '2013', 'When two young girls go missing, the desperate parents take matters into their own hands as the investigation stalls.', 'https://m.media-amazon.com/images/I/412OR7IW-HL._AC_UF894,1000_QL80_.jpg', 'https://www.youtube.com/embed/2SupordEUpw'),
('Zodiac', '2007', 'A newspaper cartoonist, a reporter, and a pair of police detectives investigate a mysterious serial killer who taunts authorities with cryptic letters.', 'https://m.media-amazon.com/images/I/51J8YOLxCRL._AC_UF1000,1000_QL80_.jpg', 'https://www.youtube.com/embed/yNncHPl1UXg'),
('The Girl with the Dragon Tattoo', '2011', 'A journalist and a hacker team up to investigate the disappearance of a young woman from a wealthy family 40 years ago.', 'https://m.media-amazon.com/images/I/61AlsP6Ow2L._AC_UF894,1000_QL80_.jpg', 'https://www.youtube.com/embed/DqQe3OrsMKI'),
('Nightcrawler', '2014', 'A driven man desperate for work discovers the world of crime journalism and blurs the lines of ethics to get the perfect shot.', 'https://m.media-amazon.com/images/I/61n0tcEYikL._AC_UF894,1000_QL80_.jpg', 'https://www.youtube.com/embed/X8kYDQan8bw'),
('Memento', '2000', 'A man suffering from short-term memory loss uses notes and tattoos to hunt for the man he believes killed his wife.', 'https://m.media-amazon.com/images/I/515EOVqRexL._AC_UF894,1000_QL80_.jpg', 'https://www.youtube.com/embed/4CV41hoyS8A'),
('The Prestige', '2006', 'Two magicians engage in a bitter rivalry to create the ultimate stage illusion, which leads to dark and tragic consequences.', 'https://m.media-amazon.com/images/I/619c+UQZaOL._AC_UF1000,1000_QL80_.jpg', 'https://www.youtube.com/embed/RLtaA9fFNXU'),
('The Bone Collector', '1999', 'A quadriplegic detective and his assistant hunt down a serial killer who uses the body parts of his victims as clues.', 'https://m.media-amazon.com/images/I/91T8v+Mk95L._AC_UF894,1000_QL80_.jpg', 'https://www.youtube.com/embed/fI56162Lz0A'),
('Insomnia', '2002', 'A detective sent to a northern town to investigate the methodical murder of a local teen finds himself caught in a web of lies and moral dilemmas.', 'https://m.media-amazon.com/images/I/31cQF+Vg+8L._AC_UF894,1000_QL80_.jpg', 'https://www.youtube.com/embed/emIHzg4VH8A'),
('The Others', '2001', 'A woman with two light-sensitive children becomes convinced that her house is haunted as strange events unfold.', 'https://m.media-amazon.com/images/I/91Xvd0hr6YL._AC_UF1000,1000_QL80_.jpg', 'https://www.youtube.com/embed/C7pKqaPtMiA'),
('The Town', '2010', 'A group of bank robbers from Boston are pursued by law enforcement, leading to a series of thrilling confrontations.', 'https://m.media-amazon.com/images/I/51w35beZZ7L._AC_UF894,1000_QL80_.jpg', 'https://www.youtube.com/embed/uAjECYnrYks'),
('Donnie Brasco', '1997', 'An undercover cop infiltrates the Mafia, only to find himself becoming emotionally involved with his mobster mentor.', 'https://m.media-amazon.com/images/I/61GiVTbFbvL._AC_UF894,1000_QL80_.jpg', 'https://www.youtube.com/embed/omIiE9KKj2o'),
('The Fugitive', '1993', 'Dr. Richard Kimble is wrongly convicted of his wife\'s murder and escapes custody, becoming a fugitive while being pursued by a relentless U.S. Marshal.', 'https://m.media-amazon.com/images/I/51f03SDiVlL._AC_UF894,1000_QL80_.jpg', 'https://www.youtube.com/embed/ETPVU0acnrE'),
('Fight Club', '1999', 'An insomniac office worker forms an underground fight club with a soap salesman, only to see things spiral out of control.', 'https://m.media-amazon.com/images/I/81D+KJkO4SL._AC_UF894,1000_QL80_.jpg', 'https://www.youtube.com/embed/BdJKm16Co6M'),
('The Silence of the Lambs', '1991', 'A young FBI agent seeks the help of a notorious imprisoned cannibalistic serial killer to catch another killer on the loose.', 'https://m.media-amazon.com/images/I/81SVDO6WcrL.jpg', 'https://www.youtube.com/embed/6iB21hsprAQ'),
('The Machinist', '2004', 'A factory worker suffering from insomnia begins to question his sanity as strange events occur at work and in his personal life.', 'https://cdn11.bigcommerce.com/s-yzgoj/images/stencil/1280x1280/products/2872332/5899251/MOVIJ4607__40864.1679556701.jpg?c=2', 'https://www.youtube.com/embed/H0fuHY4U1UA'),
('Oldboy', '2003', 'A man is imprisoned in a small room for 15 years without explanation and seeks revenge when he is inexplicably freed.', 'https://m.media-amazon.com/images/M/MV5BMTI3NTQyMzU5M15BMl5BanBnXkFtZTcwMTM2MjgyMQ@@._V1_.jpg', 'https://www.youtube.com/embed/g-3oHE07-r8'),
('The Secret Window', '2004', 'A writer is stalked by a mysterious man who claims that the writer has stolen his story, leading to a psychological thriller of paranoia.', 'https://m.media-amazon.com/images/M/MV5BZjI0ZDBiM2MtZDdhMy00ZWQzLWIwNjAtZDAyNmMxZWJhMzA4XkEyXkFqcGc@._V1_FMjpg_UX1000_.jpg', 'https://www.youtube.com/embed/IfZiVFZEJes');

-- insert into mystery_movies
INSERT INTO mystery_movies (title, release_year, description, image_url, trailer_url) VALUES
('The Girl with the Dragon Tattoo', '2011', 'A journalist and a hacker team up to investigate the disappearance of a young woman from a wealthy family 40 years ago.', 'https://m.media-amazon.com/images/I/61AlsP6Ow2L._AC_UF894,1000_QL80_.jpg', 'https://www.youtube.com/embed/DqQe3OrsMKI'),
('The Prestige', '2006', 'Two magicians engage in a bitter rivalry to create the ultimate stage illusion, which leads to dark and tragic consequences.', 'https://m.media-amazon.com/images/I/619c+UQZaOL._AC_UF1000,1000_QL80_.jpg', 'https://www.youtube.com/embed/ELq7V8vkekI'),
('Murder on the Orient Express', '2017', 'A famous detective investigates a case of murder on the luxurious train, Orient Express.', 'https://m.media-amazon.com/images/I/81YYwJ9V4lL._AC_UF1000,1000_QL80_.jpg', 'https://www.youtube.com/embed/Mq4m3yAoW8E'),
('The Usual Suspects', '1995', 'A group of criminals is interrogated about a heist gone wrong, but a criminal mastermind may still be out there.', 'https://m.media-amazon.com/images/I/51r3YWneOZL._AC_UF894,1000_QL80_.jpg', 'https://www.youtube.com/embed/oiXdPolca5w'),
('Knives Out', '2019', 'A detective investigates the death of a wealthy family patriarch, where every family member is a suspect.', 'https://m.media-amazon.com/images/I/913TjHQ0xFL._AC_UF1000,1000_QL80_.jpg', 'https://www.youtube.com/embed/qGqiHJTsRkQ'),
('The Secret Window', '2004', 'A writer is stalked by a mysterious man who claims that the writer has stolen his story, leading to a psychological thriller of paranoia.', 'https://m.media-amazon.com/images/M/MV5BZjI0ZDBiM2MtZDdhMy00ZWQzLWIwNjAtZDAyNmMxZWJhMzA4XkEyXkFqcGc@._V1_FMjpg_UX1000_.jpg', 'https://www.youtube.com/embed/IfZiVFZEJes'),
('Shutter Island', '2010', 'A U.S. Marshal investigates the disappearance of a patient from a mental institution on an isolated island.', 'https://m.media-amazon.com/images/I/51MsI8xR-NL._AC_UF894,1000_QL80_.jpg', 'https://www.youtube.com/embed/v8yrZSkKxTA'),
('The Sixth Sense', '1999', 'A young boy communicates with spirits that don\'t know they\'re dead, and a troubled child psychologist tries to help him.', 'https://m.media-amazon.com/images/I/61heMaZlMEL._AC_UF1000,1000_QL80_.jpg', 'https://www.youtube.com/embed/3-ZP95NF_Wk'),
('Gone Girl', '2014', 'A man becomes the prime suspect in the disappearance of his wife, who may have staged her own kidnapping.', 'https://m.media-amazon.com/images/I/413rc43IWaL._AC_UF894,1000_QL80_.jpg', 'https://www.youtube.com/embed/2-_-1nJf8Vg'),
('The Others', '2001', 'A woman with two light-sensitive children becomes convinced that her house is haunted as strange events unfold.', 'https://m.media-amazon.com/images/I/91Xvd0hr6YL._AC_UF1000,1000_QL80_.jpg', 'https://www.youtube.com/embed/C7pKqaPtMiA'),
('The Machinist', '2004', 'A factory worker suffering from insomnia begins to question his sanity as strange events occur at work and in his personal life.', 'https://cdn11.bigcommerce.com/s-yzgoj/images/stencil/1280x1280/products/2872332/5899251/MOVIJ4607__40864.1679556701.jpg?c=2', 'https://www.youtube.com/embed/H0fuHY4U1UA'),
('Prisoners', '2013', 'When two young girls go missing, the desperate parents take matters into their own hands as the investigation stalls.', 'https://m.media-amazon.com/images/I/412OR7IW-HL._AC_UF894,1000_QL80_.jpg', 'https://www.youtube.com/embed/2SupordEUpw'),
('The Girl on the Train', '2016', 'A woman becomes embroiled in a missing person investigation that unveils the truth about her own troubled past.', 'https://m.media-amazon.com/images/I/61uYaFlrZVL._AC_UF894,1000_QL80_.jpg', 'https://www.youtube.com/embed/y5yk-HGqKmM'),
('Donnie Brasco', '1997', 'An undercover cop infiltrates the Mafia, only to find himself becoming emotionally involved with his mobster mentor.', 'https://m.media-amazon.com/images/I/61GiVTbFbvL._AC_UF894,1000_QL80_.jpg', 'https://www.youtube.com/embed/omIiE9KKj2o'),
('The Invisible Man', '2020', 'A woman escapes from her abusive partner, only to suspect he is stalking her in an invisible form.', 'https://m.media-amazon.com/images/M/MV5BYTM3NDJhZWUtZWM1Yy00ODk4LThjNmMtNDg3OGYzMGM2OGYzXkEyXkFqcGc@._V1_FMjpg_UX1000_.jpg', 'https://www.youtube.com/embed/WO_FJdiY9dA'),
('Atonement', '2007', 'A young girl makes a false accusation that changes the lives of two lovers and haunts her for years.', 'https://m.media-amazon.com/images/I/51xaWxnxXCL._AC_UF894,1000_QL80_.jpg', 'https://www.youtube.com/embed/fiv8Gy5CJ0Y'),
('Zodiac', '2007', 'A newspaper cartoonist, a reporter, and a pair of police detectives investigate a mysterious serial killer who taunts authorities with cryptic letters.', 'https://m.media-amazon.com/images/I/51J8YOLxCRL._AC_UF1000,1000_QL80_.jpg', 'https://www.youtube.com/embed/yNncHPl1UXg'),
('The Bone Collector', '1999', 'A quadriplegic detective and his assistant hunt down a serial killer who uses the body parts of his victims as clues.', 'https://m.media-amazon.com/images/I/91T8v+Mk95L._AC_UF894,1000_QL80_.jpg', 'https://www.youtube.com/embed/fI56162Lz0A'),
('L.A. Confidential', '1997', 'A tale of corruption in the 1950s Los Angeles police department that explores crime, love, and betrayal.', 'https://m.media-amazon.com/images/I/51qhtGGaPSL._AC_UF894,1000_QL80_.jpg', 'https://www.youtube.com/embed/6sOXrY5yV4g'),
('Mystic River', '2003', 'Three childhood friends are drawn together by a terrible event that forces them to confront their past.', 'https://m.media-amazon.com/images/I/71OfeqOj+fL._AC_UF1000,1000_QL80_.jpg', 'https://www.youtube.com/embed/KuImxLubkY4'),
('The Pledge', '2001', 'A retired detective is haunted by a case that he believes he has failed to solve, despite all evidence pointing to a different killer.', 'https://m.media-amazon.com/images/I/51EPTFAH0EL._AC_UF1000,1000_QL80_.jpg', 'https://www.youtube.com/embed/ToZNDo7Yy5U');

-- insert into romance_movies
INSERT INTO romance_movies (title, release_year, description, image_url, trailer_url) VALUES
('The Notebook', '2004', 'A young couple falls in love during the early years of World War II, but their relationship faces significant hurdles over time.', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTPgd55ObXtv-Ah4zZHOEaQOkJA5D4Hk6X-mQ&s', 'https://www.youtube.com/embed/FC6biTjEyZw'),
('Titanic', '1997', 'A young couple from different social classes fall in love aboard the ill-fated R.M.S. Titanic.', 'https://m.media-amazon.com/images/I/713cdKBBjqL.jpg', 'https://www.youtube.com/embed/1EMkCJWQIDY'),
('Pride and Prejudice', '2005', 'A headstrong young woman and a wealthy but aloof man fall in love despite their initial misunderstandings and differing social statuses.', 'https://m.media-amazon.com/images/M/MV5BMTA1NDQ3NTcyOTNeQTJeQWpwZ15BbWU3MDA0MzA4MzE@._V1_.jpg', 'https://www.youtube.com/embed/Ur_DIHs92NM'),
('La La Land', '2016', 'A jazz musician and an aspiring actress fall in love, but their career ambitions threaten to tear them apart.', 'https://m.media-amazon.com/images/I/61VCj3ofVIL._AC_UF894,1000_QL80_.jpg', 'https://www.youtube.com/embed/0pdqf4P9MB8'),
('The Fault in Our Stars', '2014', 'Two teenagers with cancer fall deeply in love while facing their mortality and the challenges of living with illness.', 'https://m.media-amazon.com/images/M/MV5BYTA4ODg5YWUtYmZiYy00Y2M4LWE0NjEtODE5MzhkYmJmZGEwXkEyXkFqcGc@._V1_.jpg', 'https://www.youtube.com/embed/9ItBvH5J6ss'),
('A Walk to Remember', '2002', 'A rebellious high school senior falls in love with a quiet and devoutly religious girl, who teaches him about love and life.', 'https://m.media-amazon.com/images/M/MV5BYjkxZWE0YjMtYTk2OS00ZmFjLTk2YjEtY2M3MGY4MzE4MGNkXkEyXkFqcGc@._V1_FMjpg_UX1000_.jpg', 'https://www.youtube.com/embed/Kq02sBe5xko'),
('Eternal Sunshine of the Spotless Mind', '2004', 'A couple undergoes a procedure to erase each other from their memories after a painful breakup, only to discover they are still in love.', 'https://m.media-amazon.com/images/I/61-GjgIXmYL._AC_UF894,1000_QL80_.jpg', 'https://www.youtube.com/embed/yE-f1alkq9I'),
('Notting Hill', '1999', 'A London bookstore owner falls in love with a famous American movie star, but their relationship is tested by the complexities of fame and personal lives.', 'https://m.media-amazon.com/images/I/61t+12Qr+qL._AC_UF894,1000_QL80_.jpg', 'https://www.youtube.com/embed/4RI0QvaGoiI'),
('Dirty Dancing', '1987', 'A young woman falls in love with a dance instructor while spending the summer at a resort with her family.', 'https://m.media-amazon.com/images/I/61PF6Oi+UhL._AC_UF894,1000_QL80_.jpg', 'https://www.youtube.com/embed/eIcmQNy9FsM'),
('Before Sunrise', '1995', 'Two strangers meet on a train in Europe and spend a night exploring Vienna, developing a deep connection over the course of their conversation.', 'https://m.media-amazon.com/images/M/MV5BZDZhZmI1ZTUtYWI3NC00NTMwLTk3NWMtNDc0OGNjM2I0ZjlmXkEyXkFqcGc@._V1_.jpg', 'https://www.youtube.com/embed/6MUcuqbGTxc'),
('10 Things I Hate About You', '1999', 'A high school student must find a way to get a difficult girl to fall in love with him so his younger sister can date the boy she likes.', 'https://m.media-amazon.com/images/I/61eTQ5o0goL._AC_UF894,1000_QL80_.jpg', 'https://www.youtube.com/embed/yEmcEuS6xm4'),
('The Vow', '2012', 'A woman loses her memory after a car accident and must try to rebuild her relationship with her husband, despite not remembering their love story.', 'https://upload.wikimedia.org/wikipedia/en/c/c2/The_Vow_Poster.jpg', 'https://www.youtube.com/embed/PcL24s-S6ns'),
('When Harry Met Sally...', '1989', 'Two friends who have been in each other’s lives for years explore the possibility of love, despite their different views on relationships.', 'https://m.media-amazon.com/images/I/61SuGcS9AvL.jpg', 'https://www.youtube.com/embed/-E10AcydCuk'),
('Love Actually', '2003', 'Several interconnected stories about love and relationships unfold during the Christmas holiday season in London.', 'https://m.media-amazon.com/images/M/MV5BNzM4ZDMyMjktODU0NC00MGRlLTgwOGEtMWJmYjM0M2ViYzYzXkEyXkFqcGc@._V1_.jpg', 'https://www.youtube.com/embed/H9Z3_ifFheQ'),
('Moonlight', '2016', 'A young African-American man grapples with his identity and sexuality while growing up in a rough neighborhood of Miami.', 'https://m.media-amazon.com/images/I/81iZyjuq7pL._AC_UF894,1000_QL80_.jpg', 'https://www.youtube.com/embed/5fYFIj16YC0'),
('Her', '2013', 'A lonely man develops a relationship with an artificial intelligence system, but the complexity of emotions challenges his perceptions of love.', 'https://m.media-amazon.com/images/M/MV5BMjA1Nzk0OTM2OF5BMl5BanBnXkFtZTgwNjU2NjEwMDE@._V1_.jpg', 'https://www.youtube.com/embed/dJTU48_yghs'),
('The Lucky One', '2012', 'A Marine finds a photo of a woman while serving in Iraq and sets out to find her, believing she was his lucky charm during the war.', 'https://m.media-amazon.com/images/I/51tTVRIsRdL._AC_UF894,1000_QL80_.jpg', 'https://www.youtube.com/embed/gJAMYJkA2Uc'),
('The Time Traveler\'s Wife', '2009', 'A man with a genetic disorder that causes him to uncontrollably travel through time tries to live a normal life with his wife, who must cope with his absences.', 'https://m.media-amazon.com/images/I/61MhxIXStuL._AC_UF1000,1000_QL80_.jpg', 'https://www.youtube.com/embed/-lSjFTaZ0PI'),
('The Age of Adaline', '2015', 'A woman who has not aged a day since a freak accident falls in love, but her eternal youth presents challenges to her relationship.', 'https://m.media-amazon.com/images/I/81NNfBI1eVL.jpg', 'https://www.youtube.com/embed/hMfMmDeUMNo'),
('Crazy, Stupid, Love.', '2011', 'A man’s life is turned upside down when his wife asks for a divorce, leading him to seek help from a young bachelor in regaining his self-confidence.', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR8YNB0v1JNmcWgUCW6bnTK_-s8V5d6xx0Mfw&s', 'https://www.youtube.com/embed/8iCwtxJejik');

-- Insert into animation_movies
INSERT INTO animation_movies (title, release_year, description, image_url, trailer_url) VALUES
('Toy Story', '1995', 'A group of toys come to life when humans aren’t around, with Woody the cowboy doll leading them through their adventures.', 'https://m.media-amazon.com/images/I/71iSIVGZQUL._AC_UF1000,1000_QL80_.jpg', 'https://www.youtube.com/embed/ZA0FGZQb1-w'),
('Finding Nemo', '2003', 'A clown fish embarks on a journey to rescue his son, who has been captured by a scuba diver and placed in a fish tank.', 'https://m.media-amazon.com/images/I/51OObBWLwDL._AC_UF894,1000_QL80_.jpg', 'https://www.youtube.com/embed/9oQ628Seb9w'),
('Shrek', '2001', 'An ogre named Shrek sets out on a quest to rescue a princess, only to discover that appearances aren’t everything.', 'https://m.media-amazon.com/images/M/MV5BN2FkMTRkNTUtYTI0NC00ZjI4LWI5MzUtMDFmOGY0NmU2OGY1XkEyXkFqcGc@._V1_FMjpg_UX1000_.jpg', 'https://www.youtube.com/embed/W37DlG1i61s'),
('The Lion King', '1994', 'A young lion named Simba is destined to be king but must overcome great challenges and learn to embrace his responsibilities.', 'https://i.etsystatic.com/18242346/r/il/8c282e/3661277635/il_fullxfull.3661277635_ooeh.jpg', 'https://www.youtube.com/embed/lFzVJEksoDY'),
('Frozen', '2013', 'Two royal sisters must save their kingdom from an eternal winter caused by one sister’s magical ice powers.', 'https://m.media-amazon.com/images/I/71jwCBe30hL.jpg', 'https://www.youtube.com/embed/TbQm5doF_Uc'),
('Up', '2009', 'An elderly man and a young boy scout embark on an adventure to South America in a flying house, pursuing the dream of their late wife and mother.', 'https://lumiere-a.akamaihd.net/v1/images/p_up_19753_e6f911e3.jpeg', 'https://www.youtube.com/embed/ORFWdXl_zJ4'),
('Inside Out', '2015', 'A young girl’s emotions – Joy, Sadness, Anger, Fear, and Disgust – try to guide her through a life-changing move to a new city.', 'https://m.media-amazon.com/images/M/MV5BOTgxMDQwMDk0OF5BMl5BanBnXkFtZTgwNjU5OTg2NDE@._V1_FMjpg_UX1000_.jpg', 'https://www.youtube.com/embed/yRUAzGQ3nSY'),
('Zootopia', '2016', 'A bunny cop and a con artist fox team up to uncover a conspiracy that threatens the peace of the animal city of Zootopia.', 'https://m.media-amazon.com/images/I/71hWkxTBHRL.jpg', 'https://www.youtube.com/embed/zr1m7YDG2ZI'),
('Coco', '2017', 'A young boy embarks on a journey to the Land of the Dead to uncover his family’s history and connect with his ancestors.', 'https://lumiere-a.akamaihd.net/v1/images/p_coco_19736_fd5fa537.jpeg', 'https://www.youtube.com/embed/xlnPHQ3TLX8'),
('Monsters, Inc.', '2001', 'Two monsters working at a scream factory try to stop a crisis that threatens the safety of their world when a little girl gets involved.', 'https://m.media-amazon.com/images/I/71b5JtYC4VL._AC_UF894,1000_QL80_.jpg', 'https://www.youtube.com/embed/CGbgaHoapFM'),
('Toy Story 3', '2010', 'Woody, Buzz, and the rest of Andy’s toys face an uncertain future as Andy prepares to leave for college.', 'https://m.media-amazon.com/images/I/519fFTj6QnL._AC_UF894,1000_QL80_.jpg', 'https://www.youtube.com/embed/2BlMNH1QTeE'),
('WALL-E', '2008', 'In a future where Earth is abandoned, a waste-collecting robot named WALL-E embarks on a journey that changes the fate of humanity.', 'https://lumiere-a.akamaihd.net/v1/images/p_walle_19753_69f7ff00.jpeg', 'https://www.youtube.com/embed/alIq_wG9FNk'),
('The Incredibles', '2004', 'A family of superheroes must hide their powers while trying to live a normal life, only to be forced to fight a new villain threatening the world.', 'https://m.media-amazon.com/images/I/71gjqgxSWsL._AC_UF894,1000_QL80_.jpg', 'https://www.youtube.com/embed/sJCjKQQOqT0'),
('Ratatouille', '2007', 'A rat in Paris dreams of becoming a world-class chef and forms an unlikely partnership with a young cook in a fancy restaurant.', 'https://m.media-amazon.com/images/I/717tFz0gmjL.jpg', 'https://www.youtube.com/embed/PeFGdSrFTUw'),
('Big Hero 6', '2014', 'A young robotics prodigy teams up with a lovable robot and a group of friends to save the city from a dangerous threat.', 'https://m.media-amazon.com/images/I/61Tl-FqsZYL._AC_UF894,1000_QL80_.jpg', 'https://www.youtube.com/embed/OvgyXKDXdZY'),
('Beauty and the Beast', '1991', 'A young woman is held captive in a monstrous castle where she befriends the castle’s enchanted staff and learns to love the Beast.', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSVCgE23WOLnMD0uocNGfhqn4OohUf_MLdijQ&s', 'https://www.youtube.com/embed/iurbZwxKFUE'),
('The Little Mermaid', '1989', 'A mermaid princess makes a dangerous deal with a sea witch to become human and win the heart of a prince.', 'https://m.media-amazon.com/images/I/614gs8GTVmL.jpg', 'https://www.youtube.com/embed/ZGZX5-PAwR8'),
('How to Train Your Dragon', '2010', 'A young Viking befriends a dragon, challenging the Viking tribe’s long-standing tradition of dragon slaying.', 'https://image.tmdb.org/t/p/original/3kXIwnm8qftufEflzu0FwZV10zM.jpg', 'https://www.youtube.com/embed/2AKsAxrhqgM'),
('Kubo and the Two Strings', '2016', 'A young boy with the power to manipulate paper through magic embarks on a quest to defeat his family’s curse.', 'https://m.media-amazon.com/images/M/MV5BODZmNzBkYjUtMjg5MS00NjgwLWFjMTgtYWVkYmFiODVkZjg4XkEyXkFqcGc@._V1_.jpg', 'https://www.youtube.com/embed/ykD2W8U6wH4'),
('Kung Fu Panda', '2008', 'A clumsy, overweight panda is chosen to become the Dragon Warrior and must defeat a villainous snow leopard to save his valley.', 'https://m.media-amazon.com/images/I/51qboNmFw3L._AC_UF894,1000_QL80_.jpg', 'https://www.youtube.com/embed/PXi3Mv6KMzY');

-- Insert into documentary_movies
INSERT INTO documentary_movies (title, release_year, description, image_url, trailer_url) VALUES
('13th', '2016', 'A thought-provoking documentary that explores the intersection of race, justice, and mass incarceration in the United States.', 'https://m.media-amazon.com/images/I/91lHpwk9f9L._AC_SY679_.jpg', 'https://www.youtube.com/embed/'),
('Won’t You Be My Neighbor?', '2018', 'A heartwarming look at the life and career of Fred Rogers, the beloved host of the popular TV show “Mister Rogers’ Neighborhood.”', 'https://m.media-amazon.com/images/I/91Klg+2qGHL._AC_SY679_.jpg', 'https://www.youtube.com/embed/'),
('Making a Murderer', '2015', 'A real-life thriller following Steven Avery’s wrongful conviction and subsequent legal battle to prove his innocence.', 'https://m.media-amazon.com/images/I/91oHtXYNm5L._AC_SY679_.jpg', 'https://www.youtube.com/embed/'),
('The Social Dilemma', '2020', 'This documentary explores the dangerous human impact of social networking, with tech experts sounding the alarm about its effects on society.', 'https://m.media-amazon.com/images/I/91ryqWjT42L._AC_SY679_.jpg', 'https://www.youtube.com/embed/'),
('Free Solo', '2018', 'An exhilarating documentary about rock climber Alex Honnold’s attempt to climb El Capitan without ropes.', 'https://m.media-amazon.com/images/I/91UBp9NpaDL._AC_SY679_.jpg', 'https://www.youtube.com/embed/'),
('The Last Dance', '2020', 'A documentary chronicling Michael Jordan’s career with the Chicago Bulls and his final season with the team during their 1997-1998 championship run.', 'https://m.media-amazon.com/images/I/81klFjiYoyL._AC_SY679_.jpg', 'https://www.youtube.com/embed/'),
('13th', '2016', 'An exploration of the 13th amendment and its impact on race and mass incarceration in the United States.', 'https://m.media-amazon.com/images/I/91lHpwk9f9L._AC_SY679_.jpg', 'https://www.youtube.com/embed/'),
('The Cove', '2009', 'A documentary exposing the controversial dolphin hunting industry in Japan and the environmental impact of these practices.', 'https://m.media-amazon.com/images/I/91km2z6fISL._AC_SY679_.jpg', 'https://www.youtube.com/embed/'),
('Blackfish', '2013', 'A chilling documentary about the treatment of orcas in captivity, focusing on Tilikum, the orca responsible for several deaths at SeaWorld.', 'https://m.media-amazon.com/images/I/81vfbtvDcoL._AC_SY679_.jpg', 'https://www.youtube.com/embed/'),
('Jiro Dreams of Sushi', '2011', 'The story of Jiro Ono, an acclaimed sushi master, and his pursuit of perfection in the art of sushi.', 'https://m.media-amazon.com/images/I/81jIuY4QGKL._AC_SY679_.jpg', 'https://www.youtube.com/embed/'),
('Won’t You Be My Neighbor?', '2018', 'A look at Fred Rogers’ career and his role in shaping American childhood through his iconic TV show.', 'https://m.media-amazon.com/images/I/91l0uYN4DbL._AC_SY679_.jpg', 'https://www.youtube.com/embed/'),
('The Act of Killing', '2012', 'Filmmaker Joshua Oppenheimer explores the effects of the Indonesian genocide through the eyes of its perpetrators.', 'https://m.media-amazon.com/images/I/91TzZg5zxAL._AC_SY679_.jpg', 'https://www.youtube.com/embed/'),
('Life Itself', '2014', 'A documentary about the life of film critic Roger Ebert, his career, his battle with cancer, and his lasting influence on cinema.', 'https://m.media-amazon.com/images/I/81fz2OHXedL._AC_SY679_.jpg', 'https://www.youtube.com/embed/'),
('The Fog of War', '2003', 'A documentary on the life and career of Robert S. McNamara, focusing on his role in the Vietnam War and the lessons learned from it.', 'https://m.media-amazon.com/images/I/91rwnihfn5L._AC_SY679_.jpg', 'https://www.youtube.com/embed/'),
('Won’t You Be My Neighbor?', '2018', 'The life and legacy of Fred Rogers, the beloved host of “Mister Rogers’ Neighborhood,” and his impact on generations of children.', 'https://m.media-amazon.com/images/I/91Klg+2qGHL._AC_SY679_.jpg', 'https://www.youtube.com/embed/'),
('The Hidden Life of Trees', '2019', 'A look at the secret life of trees, how they communicate with each other, and how they are vital to our ecosystem.', 'https://m.media-amazon.com/images/I/91-yH+zpRFL._AC_SY679_.jpg', 'https://www.youtube.com/embed/'),
('Icarus', '2017', 'This documentary explores the story of a Russian doping scandal, and a man who uncovered the truth behind it.', 'https://m.media-amazon.com/images/I/91jLjKmtQfL._AC_SY679_.jpg', 'https://www.youtube.com/embed/'),
('O.J.: Made in America', '2016', 'A documentary chronicling the life and trial of O.J. Simpson, and its cultural and social implications.', 'https://m.media-amazon.com/images/I/91Vp-D11T0L._AC_SY679_.jpg', 'https://www.youtube.com/embed/'),
('Grizzly Man', '2005', 'A documentary about Timothy Treadwell, who spent years living among grizzly bears in Alaska before meeting a tragic end.', 'https://m.media-amazon.com/images/I/91Kf-yWiJlL._AC_SY679_.jpg', 'https://www.youtube.com/embed/'),
('The Imposter', '2012', 'The true story of a Frenchman who posed as a missing Texas teenager, and the consequences that followed.', 'https://m.media-amazon.com/images/I/91g+hZ5A9wL._AC_SY679_.jpg', 'https://www.youtube.com/embed/');

-- Insert into musical_movies
INSERT INTO musical_movies (title, release_year, description, image_url, trailer_url) VALUES
('La La Land', '2016', 'A jazz musician and an aspiring actress fall in love, but their relationship becomes complicated as they pursue their dreams in Los Angeles.', 'https://m.media-amazon.com/images/I/91zI91P8D9L._AC_SY679_.jpg', 'https://www.youtube.com/embed/'),
('The Greatest Showman', '2017', 'Inspired by the story of P.T. Barnum’s creation of the circus and the lives of its star attractions.', 'https://m.media-amazon.com/images/I/81V5g6G1NPL._AC_SY679_.jpg', 'https://www.youtube.com/embed/'),
('Mamma Mia!', '2008', 'A young bride-to-be seeks to find her real father, and in the process, discovers a love of music and the power of friendship.', 'https://m.media-amazon.com/images/I/81Y5t8-xtML._AC_SY679_.jpg', 'https://www.youtube.com/embed/'),
('Chicago', '2002', 'In 1920s Chicago, two women are caught up in a media frenzy after being charged with murder, leading them to become stars in their own right.', 'https://m.media-amazon.com/images/I/91+F9PpkjjL._AC_SY679_.jpg', 'https://www.youtube.com/embed/'),
('Rent', '2005', 'A group of friends in New York City struggle with love, life, and loss, all set to a memorable musical score.', 'https://m.media-amazon.com/images/I/91w9LgqIu5L._AC_SY679_.jpg', 'https://www.youtube.com/embed/'),
('Les Misérables', '2012', 'Set against the backdrop of post-revolutionary France, this epic musical follows the stories of several characters and their journeys for redemption.', 'https://m.media-amazon.com/images/I/91+2hTRu8tL._AC_SY679_.jpg', 'https://www.youtube.com/embed/'),
('The Sound of Music', '1965', 'A young novice nun is sent to be the governess for a widowed naval captain’s seven children, and she brings music into their lives.', 'https://m.media-amazon.com/images/I/91AFo4t1iHL._AC_SY679_.jpg', 'https://www.youtube.com/embed/'),
('West Side Story', '1961', 'A modern retelling of Shakespeare’s Romeo and Juliet, set against the backdrop of New York City’s street gangs and racial tensions.', 'https://m.media-amazon.com/images/I/91UQvqTqf9L._AC_SY679_.jpg', 'https://www.youtube.com/embed/'),
('Hairspray', '2007', 'A plus-sized girl with big dreams becomes a teen idol on a TV dance show in 1960s Baltimore, changing her life and the world around her.', 'https://m.media-amazon.com/images/I/91JuzR0IF-L._AC_SY679_.jpg', 'https://www.youtube.com/embed/'),
('Grease', '1978', 'A musical about the love story between Danny and Sandy at a 1950s high school, filled with unforgettable songs and dances.', 'https://m.media-amazon.com/images/I/81ntgTS9vZL._AC_SY679_.jpg', 'https://www.youtube.com/embed/'),
('The Lion King', '1994', 'A young lion prince flees his kingdom only to learn the true meaning of responsibility and bravery as he grows into adulthood.', 'https://m.media-amazon.com/images/I/91wbF8mVVwL._AC_SY679_.jpg', 'https://www.youtube.com/embed/'),
('Beauty and the Beast', '1991', 'A young woman is held prisoner by a beast in his castle, but a romance develops between them, breaking the curse that binds him.', 'https://m.media-amazon.com/images/I/91yZsyw1VwL._AC_SY679_.jpg', 'https://www.youtube.com/embed/'),
('Fame', '1980', 'A group of students from the New York City High School for the Performing Arts navigate the challenges of school, love, and their dreams of fame.', 'https://m.media-amazon.com/images/I/81Xwl6-zlHL._AC_SY679_.jpg', 'https://www.youtube.com/embed/'),
('Moulin Rouge!', '2001', 'A young writer falls in love with a courtesan in a Parisian nightclub, where love, beauty, and tragedy intertwine.', 'https://m.media-amazon.com/images/I/91ZmMHt-TJL._AC_SY679_.jpg', 'https://www.youtube.com/embed/'),
('Enchanted', '2007', 'A princess from a fairy-tale world is transported to modern-day New York City, where she must navigate the real world with her fairy-tale outlook on life.', 'https://m.media-amazon.com/images/I/91V5g6G1NPL._AC_SY679_.jpg', 'https://www.youtube.com/embed/'),
('Mary Poppins', '1964', 'A magical nanny uses music and whimsical techniques to help a family of children find happiness in their lives.', 'https://m.media-amazon.com/images/I/91kTYHGH0mL._AC_SY679_.jpg', 'https://www.youtube.com/embed/'),
('Sweeney Todd: The Demon Barber of Fleet Street', '2007', 'A vengeful barber teams up with a pie-maker to exact revenge on those who wronged him in this dark musical.', 'https://m.media-amazon.com/images/I/91N5s4s4LaL._AC_SY679_.jpg', 'https://www.youtube.com/embed/'),
('Annie', '1982', 'The story of a plucky orphan who wins the heart of a wealthy businessman while making a dramatic difference in her own life and that of others.', 'https://m.media-amazon.com/images/I/91ctzk0uwAL._AC_SY679_.jpg', 'https://www.youtube.com/embed/'),
('The Wizard of Oz', '1939', 'A young girl is swept away to a magical land, where she makes new friends and learns the importance of home, friendship, and courage.', 'https://m.media-amazon.com/images/I/81sWJg1gV6L._AC_SY679_.jpg', 'https://www.youtube.com/embed/'),
('A Star is Born', '2018', 'A seasoned musician helps a young singer find fame, even as his own career starts to fade, in this musical drama about love, loss, and redemption.', 'https://m.media-amazon.com/images/I/91vQtShZGML._AC_SY679_.jpg', 'https://www.youtube.com/embed/'),
('Rock of Ages', '2012', 'A rock and roll love story set in the 1980s, following the life of a young woman who dreams of becoming a famous singer.', 'https://m.media-amazon.com/images/I/81ECbbnVKsL._AC_SY679_.jpg', 'https://www.youtube.com/embed/');

-- Insert into western_movies
INSERT INTO western_movies (title, release_year, description, image_url, trailer_url) VALUES
('The Good, the Bad and the Ugly', '1966', 'A mysterious bounty hunter, a Mexican outlaw, and a ruthless bandit compete to find a buried treasure in a tense and violent shootout.', 'https://m.media-amazon.com/images/I/91t9G2HGV6L._AC_SY679_.jpg', 'https://www.youtube.com/embed/'),
('Unforgiven', '1992', 'An aging outlaw and a retired sheriff must confront their violent past when they accept a bounty to avenge a prostitute who was attacked.', 'https://m.media-amazon.com/images/I/91l1Ndfc-jL._AC_SY679_.jpg', 'https://www.youtube.com/embed/'),
('True Grit', '2010', 'A young girl hires a tough U.S. Marshal to help her track down her father’s killer in the rugged wilds of the Old West.', 'https://m.media-amazon.com/images/I/81k7ryD0yyL._AC_SY679_.jpg', 'https://www.youtube.com/embed/'),
('The Magnificent Seven', '2016', 'Seven outlaws are hired to protect a town from a ruthless industrialist, leading to a battle of survival and justice.', 'https://m.media-amazon.com/images/I/91IHtSvlYRL._AC_SY679_.jpg', 'https://www.youtube.com/embed/'),
('Once Upon a Time in the West', '1968', 'A mysterious harmonica-playing stranger joins forces with a widow to avenge her family’s murder and confront a ruthless land baron.', 'https://m.media-amazon.com/images/I/91vm9g4Lg0L._AC_SY679_.jpg', 'https://www.youtube.com/embed/'),
('Django Unchained', '2012', 'A freed slave partners with a bounty hunter to rescue his wife from a brutal plantation owner in the Old South.', 'https://m.media-amazon.com/images/I/91bwQfA4D-L._AC_SY679_.jpg', 'https://www.youtube.com/embed/'),
('Tombstone', '1993', 'The legendary lawman Wyatt Earp and his brothers face the infamous Clanton gang in a final showdown at the O.K. Corral in Tombstone.', 'https://m.media-amazon.com/images/I/91M9zRZY0ZL._AC_SY679_.jpg', 'https://www.youtube.com/embed/'),
('Butch Cassidy and the Sundance Kid', '1969', 'Two outlaw partners, Butch Cassidy and the Sundance Kid, flee to Bolivia to escape the law and continue their criminal lifestyle.', 'https://m.media-amazon.com/images/I/91lh6IjGmlL._AC_SY679_.jpg', 'https://www.youtube.com/embed/'),
('The Searchers', '1956', 'A Civil War veteran embarks on a dangerous quest to rescue his niece, who was abducted by Comanches.', 'https://m.media-amazon.com/images/I/81bRkq0RexL._AC_SY679_.jpg', 'https://www.youtube.com/embed/'),
('High Noon', '1952', 'A town marshal is forced to face down a gang of criminals alone, even as the townspeople refuse to help him.', 'https://m.media-amazon.com/images/I/91aIVod6V1L._AC_SY679_.jpg', 'https://www.youtube.com/embed/'),
('A Fistful of Dollars', '1964', 'A mysterious stranger enters a border town controlled by two rival gangs, playing them against each other for personal gain.', 'https://m.media-amazon.com/images/I/91zRu24E0mL._AC_SY679_.jpg', 'https://www.youtube.com/embed/'),
('The Wild Bunch', '1969', 'A gang of aging outlaws plan one final heist as the Old West fades and the new order of the 20th century begins.', 'https://m.media-amazon.com/images/I/91A6iZp0hgL._AC_SY679_.jpg', 'https://www.youtube.com/embed/'),
('Shane', '1953', 'A mysterious drifter helps a family fight off a ruthless rancher, leading to a tragic and heroic conclusion.', 'https://m.media-amazon.com/images/I/91mzl3YdtAL._AC_SY679_.jpg', 'https://www.youtube.com/embed/'),
('The Outlaw Josey Wales', '1976', 'A Confederate soldier becomes an outlaw after his family is murdered by Union soldiers, seeking revenge and redemption in the West.', 'https://m.media-amazon.com/images/I/81glYVkm99L._AC_SY679_.jpg', 'https://www.youtube.com/embed/'),
('Silverado', '1985', 'Four strangers meet and team up to fight against corrupt town officials and a band of outlaws in the Old West.', 'https://m.media-amazon.com/images/I/91-5A1yl9lL._AC_SY679_.jpg', 'https://www.youtube.com/embed/'),
('The Assassination of Jesse James by the Coward Robert Ford', '2007', 'The life and death of the legendary outlaw Jesse James, seen through the eyes of his betrayer, Robert Ford.', 'https://m.media-amazon.com/images/I/91cxwXmVfGL._AC_SY679_.jpg', 'https://www.youtube.com/embed/'),
('Blazing Saddles', '1974', 'A black sheriff in a racist western town takes on corruption and discrimination in a comedic and satirical way.', 'https://m.media-amazon.com/images/I/81tsqPq-bDL._AC_SY679_.jpg', 'https://www.youtube.com/embed/'),
('The Proposition', '2005', 'A lawman gives an outlaw a brutal proposition: kill his older brother or see his younger brother executed for a crime he did not commit.', 'https://m.media-amazon.com/images/I/91tQBGV8pXL._AC_SY679_.jpg', 'https://www.youtube.com/embed/'),
('3:10 to Yuma', '2007', 'A struggling rancher agrees to escort a dangerous outlaw to the train station for his trial, despite threats from his gang.', 'https://m.media-amazon.com/images/I/81F6br-GP3L._AC_SY679_.jpg', 'https://www.youtube.com/embed/'),
('The Ballad of Buster Scruggs', '2018', 'A collection of six short stories that take place in the Old West, exploring themes of life, death, and morality in the frontier.', 'https://m.media-amazon.com/images/I/91vACfvm5nL._AC_SY679_.jpg', 'https://www.youtube.com/embed/'),
('My Darling Clementine', '1946', 'A retelling of the legendary gunfight at the O.K. Corral, focusing on the relationship between Wyatt Earp and his love interest, Clementine.', 'https://m.media-amazon.com/images/I/81gH-J5sm8L._AC_SY679_.jpg', 'https://www.youtube.com/embed/');

-- Insert sample genres
INSERT INTO genres (name, description) VALUES 
('Action', 'Focuses on high-energy sequences, including fights, chases, explosions, and stunts. Often features a clear hero and villain.'),
('Adventure', 'Centers on an exciting journey or quest, typically involving exploration and discovery. Often overlaps with action.'),
('Comedy', 'Aims to provoke laughter through humor, often featuring exaggerated situations and characters. Sub-genres include romantic comedy and dark comedy.'),
('Drama', 'Explores serious themes and character development, often focusing on emotional narratives. It emphasizes realism and character conflicts.'),
('Fantasy', 'Incorporates magical or supernatural elements, often set in imaginary worlds. It can include mythical creatures and fantastical events.'),
('Historical', 'Set in the past, these films may depict historical events or figures, blending fact with fiction.'),
('Horror', 'Intended to scare, shock, or disturb viewers, often featuring supernatural elements or psychological terror.'),
('Science Fiction', 'Explores futuristic concepts, advanced technology, space exploration, time travel, and extraterrestrial life.'),
('Thriller', 'Builds suspense and excitement, often involving crime or psychological tension. Sub-genres include psychological thrillers and crime thrillers.'),
('Mystery', 'Centers around solving a crime or uncovering secrets, often featuring a detective or amateur sleuth.'),
('Romance', 'Focuses on love stories and relationships, often with an emotional and sentimental core.'),
('Animation', 'Uses animated techniques to tell a story, which can include any other genre (e.g., animated comedy, animated drama).'),
('Documentary', 'Non-fiction films that document reality, providing insights into real-life events, people, or cultures.'),
('Musical', 'Features songs and musical numbers as a central part of the storytelling, often expressing characters’ emotions through music.'),
('Western', 'Set in the American West during the late 19th to early 20th centuries, often featuring cowboys, outlaws, and lawmen.');

-- Insert sample movies including image URLs and trailer URLs
INSERT INTO most_popular (title, genre_id, director, release_year, description, image_url, trailer_url) VALUES 
('Inception', 1, 'Christopher Nolan', 2010, 'Dominick "Dom" Cobb (Leonardo DiCaprio), a skilled thief and fugitive, specializes in extracting secrets from deep within the subconscious during the dream state. Tasked with the impossible job of planting an idea rather than stealing one—known as inception—he assembles a team to navigate multiple layers of dreams, facing powerful projections and his own haunting past, all while racing against time.', 'https://4.bp.blogspot.com/-L80GvZteuZQ/T8iT9fY-LHI/AAAAAAAAAKs/SXTF2pEK9Ao/s1600/inception-movie-poster.jpg', 'https://www.youtube.com/embed/YoHD9XEInc0'),
('The Shawshank Redemption', 2, 'Frank Darabont', 1994, 'In the bleak confines of Shawshank State Penitentiary, banker Andy Dufresne (Tim Robbins) finds himself wrongfully convicted of murdering his wife and her lover. Over decades, he forges a deep friendship with fellow inmate Red (Morgan Freeman) while employing his intelligence and resourcefulness to survive and seek redemption, ultimately devising an elaborate escape plan that unveils the corruption of the prison system.', 'https://m.media-amazon.com/images/M/MV5BMTQ1ODM2MjY3OV5BMl5BanBnXkFtZTgwMTU2MjEyMDE@._V1_FMjpg_UX1000_.jpg', 'https://www.youtube.com/embed/6hB3S9bIaco'),
('The Godfather', 2, 'Francis Ford Coppola', 1972, 'As the patriarch of the Corleone crime family, Vito Corleone (Marlon Brando) navigates the treacherous world of organized crime in post-war America. When an assassination attempt forces him to retreat, his youngest son Michael (Al Pacino), initially reluctant to join the family business, is drawn into a cycle of violence and power struggles, ultimately leading to a bloody war for control and the transformation of Michael into a ruthless leader.', 'https://m.media-amazon.com/images/M/MV5BM2MyNjYxNmUtYTAwNi00MTYxLWJmNWYtYzZlODY3ZTk3OTFlXkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_.jpg', 'https://www.youtube.com/embed/UaVTIH8mujA'),
('The Dark Knight', 1, 'Christopher Nolan', 2008, 'In a city besieged by crime, Batman (Christian Bale) teams up with District Attorney Harvey Dent (Aaron Eckhart) and Lieutenant Jim Gordon (Gary Oldman) to dismantle the organized crime syndicates plaguing Gotham. However, their efforts attract the attention of the Joker (Heath Ledger), a chaotic and cunning villain who unleashes a reign of terror, forcing Batman to confront his own ethical boundaries and the fine line between heroism and vigilantism.', 'https://th.bing.com/th/id/OIP.NN9rKH-vZbFgtH4FuoW7OwHaLH?rs=1&pid=ImgDetMain', 'https://www.youtube.com/embed/EXeTwQWrcwY'),
('Pulp Fiction', 1, 'Quentin Tarantino', 1994, 'In a stylistically groundbreaking narrative, "Pulp Fiction" weaves together multiple storylines involving mob hitmen Vincent Vega (John Travolta) and Jules Winnfield (Samuel L. Jackson), a boxer named Butch (Bruce Willis), and the intertwined lives of a gangster''s wife and diner bandits. Through a nonlinear structure, Tarantino explores themes of fate, morality, and redemption, punctuated by sharp dialogue and visceral violence that redefine the crime genre.', 'https://image.tmdb.org/t/p/original/n29q4PmwmrxKBPX2grAvFXyYXYV.jpg', 'https://www.youtube.com/embed/s7EdQ4FqbhY'),
('Forrest Gump', 2, 'Robert Zemeckis', 1994, 'Forrest Gump (Tom Hanks), a man with an IQ lower than average, unintentionally influences pivotal moments in American history, from the Vietnam War to the Watergate scandal. His unwavering love for childhood friend Jenny (Robin Wright) drives him through life''s tumultuous events, showcasing the profound impact of innocence and kindness amidst the complexities of society and the human experience.', 'https://image.tmdb.org/t/p/original/saHP97rTPS5eLmrLQEcANmKrsFl.jpg', 'https://www.youtube.com/embed/XHhAG-YLdk8'),
('Fight Club', 1, 'David Fincher', 1999, 'An unnamed protagonist (Edward Norton), suffering from chronic insomnia and dissatisfaction with his consumer-driven life, finds solace in an underground fight club founded by the enigmatic Tyler Durden (Brad Pitt). As their relationship evolves, the fight club transforms into a radical anti-establishment movement, challenging societal norms and exposing the darker aspects of masculinity and identity, leading to a chaotic descent into nihilism.', 'https://www.themoviedb.org/t/p/original/jSziioSwPVrOy9Yow3XhWIBDjq1.jpg', 'https://www.youtube.com/embed/BdJKm16Co6M'),
('The Matrix', 1, 'Lana Wachowski, Lilly Wachowski', 1999, 'Thomas Anderson (Keanu Reeves), a computer hacker known as Neo, discovers the harrowing truth that reality is an artificial construct controlled by sentient machines. Guided by Morpheus (Laurence Fishburne) and Trinity (Carrie-Anne Moss), Neo embarks on a journey to awaken humanity and combat the oppressive regime, ultimately confronting his destiny as "The One" who can bend the rules of the Matrix itself.', 'https://th.bing.com/th/id/OIP.nq66xqwF5qVWxt11yjmU6gHaLH?rs=1&pid=ImgDetMain', 'https://www.youtube.com/embed/vKQi3bBA1y8'),
('Goodfellas', 1, 'Martin Scorsese', 1990, 'Based on the true story of Henry Hill (Ray Liotta), "Goodfellas" chronicles the rise and fall of a young man who dreams of becoming a mobster. From his teenage years in Brooklyn to his involvement in organized crime, Hill navigates the dangerous world of the Mafia, experiencing the allure of power, wealth, and the inevitable consequences of betrayal and violence, ultimately leading to his decision to testify against his former associates.', 'https://th.bing.com/th/id/OIP.l5EVkKPkaSaJfUhZ6wnzfwHaLH?rs=1&pid=ImgDetMain', 'https://www.youtube.com/embed/2ilzidi_J8Q'),
('The Lord of the Rings: The Return of the King', 2, 'Peter Jackson', 2003, 'As the epic conclusion to the trilogy, "The Return of the King" depicts the final battles against Sauron’s dark forces. Gandalf and Aragorn lead the charge to defend Middle-earth while Frodo (Elijah Wood) and Sam (Sean Astin) strive to destroy the One Ring in the heart of Mount Doom. Themes of friendship, sacrifice, and the struggle between good and evil culminate in a visually stunning and emotionally resonant finale.', 'https://www.themoviedb.org/t/p/original/dNsEaafO4huvqzVrlPuSQWIHOy0.jpg', 'https://www.youtube.com/embed/y2rYRu8UW8M');

INSERT INTO questions_and_answers (user_id, movie_id, title, question_content, answer_content, answered_by) 
VALUES 
(1, 1, 'What is the meaning of the ending of Inception?', 
    'What is the meaning of the ending of Inception?', 
    'The ending is ambiguous; it leaves viewers questioning reality and whether Cobb is still dreaming or not.', 
    1),

(1, 2, 'What themes are present in The Shawshank Redemption?', 
    'What themes are present in The Shawshank Redemption?', 
    'The movie explores hope, freedom, and the resilience of the human spirit, as well as the impact of time on a person\'s life.', 
    1),

(1, 3, 'Why is The Godfather considered a classic?', 
    'Why is The Godfather considered a classic?', 
    'The Godfather is revered for its storytelling, character depth, and exploration of themes such as power, loyalty, and betrayal in a crime family setting.', 
    1),

(1, 4, 'How does The Dark Knight explore the concept of justice?', 
    'How does The Dark Knight explore the concept of justice?', 
    'It raises questions about the nature of justice, the role of vigilantism, and the moral choices between law and order versus chaos and anarchy.', 
    1),

(1, 5, 'What is the significance of the briefcase in Pulp Fiction?', 
    'What is the significance of the briefcase in Pulp Fiction?', 
    'The briefcase serves as a narrative device symbolizing mystery, power, and the unknown. Its contents are never revealed, leading to endless interpretation.', 
    1),

(1, 6, 'What is the key message of Forrest Gump?', 
    'What is the key message of Forrest Gump?', 
    'The movie conveys the importance of perseverance, kindness, and the unpredictable nature of life. Forrest, with his simple outlook, influences key events in history while remaining true to his values.', 
    1),

(1, 7, 'Why does Fight Club challenge societal norms?', 
    'Why does Fight Club challenge societal norms?', 
    'Fight Club critiques consumerism, the loss of individuality, and the toxicity of modern masculinity, encouraging rebellion against the pressures of society.', 
    1),

(1, 8, 'What does the Matrix symbolize?', 
    'What does the Matrix symbolize?', 
    'The Matrix represents the artificial reality that hides the truth from humanity. It is a metaphor for control, freedom, and human potential in a technologically dominated world.', 
    1),

(1, 9, 'Why is Goodfellas considered a masterpiece of the gangster genre?', 
    'Why is Goodfellas considered a masterpiece of the gangster genre?', 
    'Goodfellas is praised for its realistic portrayal of mob life, its groundbreaking use of narration and editing, and its exploration of loyalty, betrayal, and the rise and fall of criminals.', 
    1),

(1, 10, 'What are the themes of The Lord of the Rings: The Return of the King?', 
    'What are the themes of The Lord of the Rings: The Return of the King?', 
    'The movie explores themes of friendship, sacrifice, the corrupting influence of power, and the importance of courage in the face of overwhelming darkness.', 
    1);

INSERT INTO news (title, description, release_year, created_at, movie_title, image_url)
VALUES
-- Movie 1
(
  "Avengers: The Kang Dynasty - Now Avengers: Doomsday, Robert Downey Jr. to Play Doctor Doom", 
  CONCAT(
    "In an unexpected and thrilling turn of events, Marvel Studios has officially announced a title change for the highly anticipated film 'Avengers: The Kang Dynasty'. The film, now officially titled 'Avengers: Doomsday', promises to deliver an epic storyline that will redefine the Marvel Cinematic Universe. What’s even more exciting for fans is the shocking revelation that Robert Downey Jr., the beloved actor known for his iconic portrayal of Tony Stark/Iron Man, will be returning to the MCU, but this time in a completely new role – as the villainous Doctor Doom!\n\n",
    "This bold move marks a dramatic departure from the original plans for the film and introduces a thrilling new twist to the upcoming multiverse saga. Doctor Doom, one of Marvel’s most formidable and complex villains, has long been a fan favorite and now, with Downey Jr. stepping into the role, there are high hopes for a deep and powerful performance. Fans are eagerly speculating about how the character will be integrated into the MCU, and how Tony Stark’s legacy will intersect with Doom’s unyielding ambition and intellect.\n\n",
    "While details of the plot remain under wraps, sources indicate that 'Avengers: Doomsday' will bring together a new wave of superheroes to face off against the dangerous and calculated Victor Von Doom. The character of Doctor Doom is expected to be one of the most complex and menacing antagonists in MCU history, and Robert Downey Jr.'s involvement has only added to the excitement. His return to the MCU, albeit as a villain, is a move that has fans buzzing with anticipation. What’s more, Marvel is known for its ability to take risks and surprise audiences, and with this new direction, 'Avengers: Doomsday' is sure to be one of the most groundbreaking films in the franchise's history.\n\n",
    "As we await more updates, one thing is clear: 'Avengers: Doomsday' will be a game-changer, not only for the MCU but for superhero films as a whole."
  ), 
  2025, 
  CURRENT_TIMESTAMP, 
  "Avengers: Doomsday", 
  "https://i.pinimg.com/originals/3a/fc/4f/3afc4ff0369987bf51489813defa4cfa.jpg"
),
(
  "Dune: Part Two – A Masterpiece of Sci-Fi, Stunning Visuals and Performances", 
  CONCAT(
    "The highly anticipated 'Dune: Part Two' has finally hit theaters, and it’s nothing short of a cinematic triumph. Directed by Denis Villeneuve, the film picks up where the first installment left off, plunging audiences deeper into the desert world of Arrakis. With a perfect blend of action, political intrigue, and stunning visual effects, 'Dune: Part Two' has truly raised the bar for modern sci-fi filmmaking.\n\n",
    "Timothée Chalamet once again shines as Paul Atreides, bringing emotional depth to the young hero as he grapples with his destiny and the harsh realities of war. Zendaya, returning as Chani, also delivers a standout performance, providing a compelling counterbalance to Paul’s journey. The movie further explores the complex dynamics of the Fremen people, with new characters, including the powerful Shaddam IV (played by a brilliant Christopher Walken), and the menacing Feyd-Rautha, portrayed by Austin Butler.\n\n",
    "One of the film’s most notable achievements is its breathtaking visuals. Villeneuve has once again crafted a world that feels vast and lived-in, with sprawling desert landscapes, towering sandworms, and epic battles that immerse the viewer into the heart of Arrakis. Hans Zimmer’s hauntingly beautiful score complements the grand scale of the visuals, amplifying the emotional weight of each scene.\n\n",
    "The pacing of 'Dune: Part Two' is nearly perfect, balancing the intricacies of the political drama with pulse-pounding action sequences. While the film stays true to the complex nature of Frank Herbert’s source material, it remains accessible to new audiences, drawing them into the universe without overwhelming them with its depth."
  ), 
  2025, 
  CURRENT_TIMESTAMP, 
  "Dune: Part Two", 
  "https://deadline.com/wp-content/uploads/2024/02/Dune-Part-Two-Dolby-Poster.jpg?w=800"
),
-- Movie 3
("The Hunger Games: The Ballad of Songbirds and Snakes – A Compelling Prequel That Expands the Universe",
 "The Ballad of Songbirds and Snakes delivers a thought-provoking look at Coriolanus Snow’s rise to power. While the film doesn’t quite reach the heights of the original series, it successfully expands the lore and deepens our understanding of Snow’s character. Rachel Zegler shines as Lucy Gray, while Tom Blyth’s portrayal of Snow gives a chilling glimpse into his path to tyranny. The film opened strong with $300 million globally and is expected to gross between $600 million and $700 million. A strong entry in the *Hunger Games* franchise, but not quite as culturally impactful as its predecessors.",
 2024, CURRENT_TIMESTAMP, "The Hunger Games: The Ballad of Songbirds and Snakes", 'https://m.media-amazon.com/images/I/819tY-gDcWL._AC_UF1000,1000_QL80_.jpg'),

-- Movie 4
("Mission: Impossible – Dead Reckoning Part Two – 2025 Release Date Announced", 
 "The action-packed saga continues with 'Mission: Impossible – Dead Reckoning Part Two', which will be released on June 28, 2025. Tom Cruise will once again reprise his role as Ethan Hunt in what is expected to be the most thrilling and dangerous mission yet. Director Christopher McQuarrie has teased even more heart-stopping stunts and plot twists in this final chapter of the current Mission: Impossible storyline.", 
 2025, CURRENT_TIMESTAMP, "Mission: Impossible – Dead Reckoning Part Two", 'https://m.media-amazon.com/images/M/MV5BOGM1YmE1OTEtMjhjNi00OTEwLTlmN2UtNzkwMDA1ZWU2YWQ2XkEyXkFqcGc@._V1_.jpg'),

-- Movie 5
("The Batman 2 – Filming Underway with Robert Pattinson Returning", 
 "Filming for 'The Batman 2' has officially begun, with Robert Pattinson returning as the Dark Knight. Set for release on October 3, 2025, the sequel will continue exploring the gritty, noir-driven world established by Matt Reeves in the first film. New villains are expected to be introduced, and there is speculation that we may see the debut of iconic characters like The Penguin and Mr. Freeze.", 
 2025, CURRENT_TIMESTAMP, "The Batman 2", 'https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/81659b9c-0dd8-4a4f-88dc-4a0fea78fea0/dftbsuw-46312fda-1f6e-42ef-83c4-f684788da5cb.png/v1/fill/w_1024,h_1536,q_80,strp/the_batman_ii_by_aegonivi_dftbsuw-fullview.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcLzgxNjU5YjljLTBkZDgtNGE0Zi04OGRjLTRhMGZlYTc4ZmVhMFwvZGZ0YnN1dy00NjMxMmZkYS0xZjZlLTQyZWYtODNjNC1mNjg0Nzg4ZGE1Y2IucG5nIiwiaGVpZ2h0IjoiPD0xNTM2Iiwid2lkdGgiOiI8PTEwMjQifV1dLCJhdWQiOlsidXJuOnNlcnZpY2U6aW1hZ2Uud2F0ZXJtYXJrIl0sIndtayI6eyJwYXRoIjoiXC93bVwvODE2NTliOWMtMGRkOC00YTRmLTg4ZGMtNGEwZmVhNzhmZWEwXC9hZWdvbml2aS00LnBuZyIsIm9wYWNpdHkiOjk1LCJwcm9wb3J0aW9ucyI6MC40NSwiZ3Jhdml0eSI6ImNlbnRlciJ9fQ.VJP5YFM1MJoe6mJg_MhH2j3gJ8Qvi1IF7owdsyztBV4'),

-- Movie 6
("Deadpool 3 - A New Era for the Merc with a Mouth: A Box Office Phenomenon and Critical Success!",
 "Deadpool 3 exceeded all expectations, delivering an explosive continuation of the Merc with a Mouth’s journey in the MCU. With an outstanding opening weekend of $205 million in the US and a global gross surpassing $900 million, the film is a box-office juggernaut. Ryan Reynolds and Hugh Jackman’s chemistry is undeniable, and the film's perfect balance of humor, heart-pounding action, and emotional depth has made it a critical success. The film is expected to hit the $1 billion mark, solidifying its place as one of the highest-grossing R-rated films of all time.",
 2024, CURRENT_TIMESTAMP, "Deadpool 3", 'https://upload.wikimedia.org/wikipedia/en/4/4c/Deadpool_%26_Wolverine_poster.jpg'),

-- Movie 7
("The Flash 2 – Speeding Into Theaters in 2025", 
 "The sequel to the 2023 hit 'The Flash' has been confirmed and is scheduled for release on July 25, 2025. The film will explore more time travel shenanigans, as Barry Allen faces new threats across different timelines. There are rumors that the movie will feature more multiversal cameos, potentially including some well-known DC characters. Fans are excited to see how the story will develop after the events of the first film.", 
 2025, CURRENT_TIMESTAMP, "The Flash 2", 'https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/29ae2b15-502a-4e10-a75a-612c1848e69b/dg1f6v1-ac5da2f8-433c-429c-8c82-cd197eac19a6.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcLzI5YWUyYjE1LTUwMmEtNGUxMC1hNzVhLTYxMmMxODQ4ZTY5YlwvZGcxZjZ2MS1hYzVkYTJmOC00MzNjLTQyOWMtOGM4Mi1jZDE5N2VhYzE5YTYuanBnIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.Ga5zvlOPCXrm-KrxSCAJu84Mnl1DOdnVxCvRhsku2l4'),

-- Movie 8
("Fantastic Four Reboot - Official Casting Announced", 
 "Marvel Studios has officially announced the cast for the upcoming 'Fantastic Four' reboot, set to release in 2025. The movie will introduce a new version of Marvel's first family, featuring a fresh take on the iconic characters. Fans are eager to see how these characters are integrated into the larger MCU, and speculation is growing about which villain will challenge the team in this highly anticipated project.", 
 2025, CURRENT_TIMESTAMP, "Fantastic Four", 'https://preview.redd.it/the-fantastic-four-2025-fan-art-mcu-v0-76k3a06f3uld1.jpeg?width=1080&crop=smart&auto=webp&s=c8abb86a48215761232c0ac385626dbbfdfc009d'),

-- Movie 9
("Joker 2: Folie à Deux – A Disappointing Sequel Fails to Deliver",
 "'Joker 2: Folie à Deux' fails to live up to the high bar set by its predecessor. While Joaquin Phoenix reprises his role as Arthur Fleck, the film falters with forced musical numbers, erratic pacing, and confusing narrative choices. Lady Gaga’s portrayal of Harley Quinn feels out of place, and the film ultimately loses the raw psychological tension that made the original so compelling. Although it grossed $400 million globally, it struggles to match the impact of its predecessor and has failed to resonate with critics.",
 2024, CURRENT_TIMESTAMP, "Joker 2: Folie à Deux", 'https://www.hola.com/us/horizon/original_aspect_ratio/a96ba4185055-joker-2-poster.jpg');


-- Show tables
SHOW TABLES;
-- Test inserts (optional)
INSERT INTO users (username, password, email) VALUES ('testUser', 'hashed_password', 'test@example.com');
SELECT * FROM genres;
SELECT * FROM movies;
SELECT * FROM news;
SELECT * FROM users;
SELECT * FROM action_movies;
SELECT * FROM questions_and_answers;
SELECT * FROM most_popular;
SELECT * FROM adventure_movies;
SELECT * FROM comedy_movies;
SELECT * FROM drama_movies;
SELECT * FROM fantasy_movies;
SELECT * FROM historical_movies;
SELECT * FROM horror_movies;
SELECT * FROM fiction_movies;
SELECT * FROM thriller_movies;
SELECT * FROM mystery_movies;
SELECT * FROM romance_movies;
SELECT * FROM animation_movies;
SELECT * FROM documentary_movies;
SELECT * FROM musical_movies;
SELECT * FROM western_movies;
SELECT * FROM replies;
SELECT * FROM answers;
DESCRIBE news;
SELECT * FROM users WHERE username = 'Pedrito';
SELECT * FROM questions_and_answers WHERE question_id = 35;
DESCRIBE questions_and_answers;
ALTER TABLE questions_and_answers ADD COLUMN question_id INT;





-- Drop table answer_replies;
-- Drop tables;
-- Drop table replies;
-- DROP TABLE users;
-- DROP TABLE questions;
-- DROP TABLE answers;
-- DROP TABLE movies;
-- DROP TABLE news;
-- DROP TABLE genres;
-- Drop table questions_and_answers;
-- DROP table action_movies;
-- DROP TABLE most_popular;
-- DROP TABLE comedy_movies;
-- DROP TABLE drama_movies;
-- DROP TABLE fantasy_movies;
-- DROP TABLE historical_movies;
-- DROP TABLE horror_movies;
-- DROP TABLE fiction_movies;
-- DROP TABLE thriller_movies;
-- DROP TABLE mystery_movies;
-- DROP TABLE romance_movies;
-- DROP TABLE animation_movies;
-- DROP TABLE documentary_movies;
-- DROP TABLE musical_movies;
-- DROP TABLE western_movies;
-- CURRENT_TIMESTAMP  is a special SQL function that returns the current date and time, based on the system's clock at the moment the query is executed