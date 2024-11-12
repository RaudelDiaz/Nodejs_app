const jwt = require('jsonwebtoken');
const express = require('express');
const cors = require('cors');
const bcrypt = require('bcryptjs');
const db = require('./db');

const app = express();
app.use(cors());
app.use(express.json());

const PORT = process.env.PORT || 5000;

// User signup
app.post('/api/signup', (req, res) => {
    const { username, password, email } = req.body;

    // Password validation: at least 5 characters and contains at least one special character
    const passwordLengthValid = password.length >= 5;
    const specialCharacterValid = /[!@#$%^&*(),.?":{}|<>]/.test(password); 

    if (!passwordLengthValid || !specialCharacterValid) {
        // If password doesn't meet the criteria, send a detailed message
        return res.status(400).send('Password must be at least 5 characters long and include at least one special character.');
    }

    // Check if the email is already in use
    db.query('SELECT * FROM users WHERE email = ?', [email], (err, results) => {
        if (err) {
            return res.status(500).send('Error checking email availability.');
        }

        if (results.length > 0) {
   
            return res.status(400).send('Email is already in use. Please use a different email address.');
        }

       
        const hashedPassword = bcrypt.hashSync(password, 8);

        db.query('INSERT INTO users (username, password, email) VALUES (?, ?, ?)', [username, hashedPassword, email], (err, result) => {
            if (err) {
                return res.status(500).send('Error registering user. Please try again.');
            }
            res.status(201).send('User registered successfully!');
        });
    });
});

// User login
app.post('/api/login', (req, res) => {
    const { username, password } = req.body;

    db.query('SELECT * FROM users WHERE username = ?', [username], (err, results) => {
        if (err) return res.status(500).send('Error on the server.');

        if (results.length === 0) return res.status(404).send('User Not Found.');

        const user = results[0];
        const passwordIsValid = bcrypt.compareSync(password, user.password);

        if (!passwordIsValid) {
            return res.status(401).send('Invalid password.');
        }

        const token = jwt.sign({ id: user.id }, 'your_secret_key', { expiresIn: 86400 });

        return res.status(200).json({
            auth: true,
            token: token,
            userId: user.id,
        });
    });
});
app.get('/api/movies/fiction', (req, res) => {
    const query = 'SELECT * FROM fiction_movies'; 
    db.query(query, (err, results) => {
        if (err) {
            return res.status(500).send('Error fetching fiction movies');
        }
        res.json(results); 

    });
});
// Fetch all users
app.get('/api/users', (req, res) => {
    db.query('SELECT * FROM users', (err, results) => {
        if (err) return res.status(500).send('Error fetching users');
        res.status(200).json(results);
    });
});

// Fetch all genres
app.get('/api/genres', (req, res) => {
    db.query('SELECT * FROM genres', (err, results) => {
        if (err) return res.status(500).send('Error fetching genres');
        res.status(200).json(results);
    });
});

// Fetch all popular movies (most_popular)
app.get('/api/movies', (req, res) => {
    db.query('SELECT * FROM most_popular', (err, results) => {
        if (err) return res.status(500).send('Error fetching popular movies');
        res.status(200).json(results);
    });
});

// Fetch action movies
app.get('/api/movies/action', (req, res) => {
    const query = 'SELECT * FROM action_movies'; 
    db.query(query, (err, results) => {
        if (err) {
            return res.status(500).send('Error fetching action movies');
        }
        res.json(results);
    });
});

// Fetch all news
app.get('/api/news', (req, res) => {
    db.query('SELECT * FROM news', (err, results) => {
        if (err) {
            console.error('Error fetching news:', err);
            return res.status(500).send('Error fetching news');
        }
        res.status(200).json(results);
    });
});

// Fetch movies by genre
app.get('/api/movies/:genre', (req, res) => {
    let genre = req.params.genre.toLowerCase();

    // Map "Science Fiction" to "fiction"
    if (genre === 'science fiction') {
        genre = 'fiction';
    }

    const validGenres = ['action', 'adventure', 'comedy', 'drama', 'fantasy', 'historical', 'horror', 'fiction', 'thriller', 'mystery', 'romance', 'animation', 'documentary', 'musical', 'western'];

    if (!validGenres.includes(genre)) {
        return res.status(400).send('Invalid genre');
    }

    const query = `SELECT * FROM ${genre}_movies`;
    
    db.query(query, (err, results) => {
        if (err) {
            return res.status(500).send(`Error fetching ${genre} movies`);
        }
        res.json(results);
    });
});

// Fetch questions and their answers
app.get('/api/questions_and_answers', (req, res) => {
    const query = `
    SELECT 
        qa.id AS question_id,
        qa.title AS question_title,
        qa.question_content,
        m.title AS movie_title,
        a.answer_content,
        u.username AS answered_by
    FROM 
        questions_and_answers qa
    LEFT JOIN 
        answers a ON qa.id = a.question_id
    LEFT JOIN 
        users u ON a.answered_by = u.id
    LEFT JOIN 
        most_popular m ON qa.movie_id = m.id
    ORDER BY qa.id;
    `;

    db.query(query, (err, results) => {
        if (err) {
            console.error('Error executing query:', err);
            return res.status(500).send('Error fetching questions and answers');
        }

        const questionsWithAnswers = [];

        results.forEach(row => {
            let question = questionsWithAnswers.find(q => q.question_id === row.question_id);
            if (!question) {
                question = {
                    question_id: row.question_id,
                    question_title: row.question_title,
                    question_content: row.question_content,
                    movie_title: row.movie_title,
                    answers: []
                };
                questionsWithAnswers.push(question);
            }

            if (row.answer_content) {
                question.answers.push({
                    answer_content: row.answer_content,
                    answered_by: row.answered_by || 'Unknown',
                });
            }
        });

        console.log('Fetched Questions with Answers:', questionsWithAnswers);
        res.status(200).json(questionsWithAnswers);
    });
});

// Add a new question
app.post('/api/questions', (req, res) => {
    const { title, question_content, movie_id, answered_by } = req.body;
    const userId = parseInt(answered_by, 10);
    if (isNaN(userId)) {
        return res.status(400).send('Invalid user ID');
    }

    const query = 'INSERT INTO questions_and_answers (title, question_content, movie_id, answered_by) VALUES (?, ?, ?, ?)';
    db.query(query, [title, question_content, movie_id, userId], (err, result) => {
        if (err) {
            console.error('Error adding question:', err);
            return res.status(500).send('Error adding question');
        }
        res.status(201).send('Question added successfully');
    });
});

// Add a reply to a question
app.post('/api/questions/:id/replies', (req, res) => {
    const questionId = req.params.id;
    const { answer_content, answered_by } = req.body;

    const query = 'INSERT INTO answers (question_id, answer_content, answered_by) VALUES (?, ?, ?)';
    db.query(query, [questionId, answer_content, answered_by], (err, result) => {
        if (err) {
            console.error('Error adding reply:', err);
            return res.status(500).json({ message: 'Error adding reply' });
        }

        const updatedQuery = `
            SELECT qa.id AS question_id, qa.title AS question_title, qa.question_content,
                m.title AS movie_title, a.answer_content, u.username AS answered_by
            FROM questions_and_answers qa
            LEFT JOIN users u ON qa.answered_by = u.id
            LEFT JOIN most_popular m ON qa.movie_id = m.id
            LEFT JOIN answers a ON qa.id = a.question_id
            WHERE qa.id = ?`;

        db.query(updatedQuery, [questionId], (err, results) => {
            if (err) {
                console.error('Error fetching updated question:', err);
                return res.status(500).json({ message: 'Error fetching updated question' });
            }

            const updatedQuestion = results.map(row => {
                return {
                    question_id: row.question_id,
                    question_title: row.question_title,
                    question_content: row.question_content,
                    movie_title: row.movie_title,
                    answers: results.filter(result => result.question_id === row.question_id)
                        .map(answer => ({
                            answer_content: answer.answer_content,
                            answered_by: answer.answered_by || 'Unknown'
                        }))
                };
            });

            res.status(200).json(updatedQuestion);
        });
    });
});
const verifyToken = (req, res, next) => {
    const token = req.header('Authorization')?.split(' ')[1]; 
    if (!token) {
        return res.status(401).send('Access denied. No token provided.');
    }

    try {
        const decoded = jwt.verify(token, 'your_secret_key');
        req.user = decoded; 
        next();  
    } catch (error) {
        res.status(400).send('Invalid token.');
    }
};

// Delete a question
app.delete('/api/questions/:id', verifyToken, (req, res) => {
    const questionId = req.params.id;  

   
    db.query('SELECT * FROM questions_and_answers WHERE id = ?', [questionId], (err, results) => {
        if (err) return res.status(500).send('Error fetching question');
        if (results.length === 0) return res.status(404).send('Question not found');

        // Proceed with deletion of the question
        db.query('DELETE FROM questions_and_answers WHERE id = ?', [questionId], (err, result) => {
            if (err) return res.status(500).send('Error deleting question');
            res.status(200).send('Question deleted successfully');
        });
    });
});

app.listen(PORT, () => {
    console.log(`Server is running on port ${PORT}`);
});









