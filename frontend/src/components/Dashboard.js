import React, { useEffect, useState } from 'react';
import axios from 'axios';
import { useNavigate } from 'react-router-dom';
import '../Dashboard.css';

const Dashboard = ({ onLogout }) => {
    const [data, setData] = useState({
        users: [],
        genres: [],
        movies: [],
        actionMovies: [],
        adventureMovies: [],
        comedyMovies: [],  
        dramaMovies: [],   
        fantasyMovies: [],  
        historicalMovies: [],
        horrorMovies: [],  
        fictionMovies: [],
        thrillerMovies: [],
        mysteryMovies: [], 
        romanceMovies: [], 
        animationMovies: [],
        documentaryMovies: [],
        musicalMovies: [],  
        westernMovies: [],  
        questions: [],      
        answers: [],         
        news: []             
    });
    const userId = localStorage.getItem('userId');
    const [newReply, setNewReply] = useState({ content: '', questionId: null });
    const [newQuestion, setNewQuestion] = useState({ title: '', content: '' });
    const [selected, setSelected] = useState('');
    const [username, setUsername] = useState('');
    const [modalOpen, setModalOpen] = useState(false);
    const [trailerUrl, setTrailerUrl] = useState('');
    const navigate = useNavigate();

    useEffect(() => {
        const storedUsername = localStorage.getItem('username');
        if (storedUsername) {
            setUsername(storedUsername);
        } else {
            navigate('/login');
        }
    }, [navigate]);

    const handleSelection = async (type) => {
        setSelected(type); // Set the selected type (category)
        try {
            if (type === 'movies') {
                const moviesRes = await axios.get('http://localhost:5000/api/movies');
                setData(prevData => ({ ...prevData, movies: moviesRes.data }));
            } else if (type === 'genres') {
                const genresRes = await axios.get('http://localhost:5000/api/genres');
                setData(prevData => ({ ...prevData, genres: genresRes.data }));
            } else if (type === 'questions') {
                const questionsRes = await axios.get('http://localhost:5000/api/questions_and_answers');
                setData(prevData => ({ ...prevData, questions: questionsRes.data }));
            } else if (type === 'action') {
                const actionMoviesRes = await axios.get('http://localhost:5000/api/movies/action');
                setData(prevData => ({ ...prevData, actionMovies: actionMoviesRes.data }));
                setSelected('action');
            } else if (type === 'adventure') {
                const adventureMoviesRes = await axios.get('http://localhost:5000/api/movies/adventure');
                setData(prevData => ({ ...prevData, adventureMovies: adventureMoviesRes.data }));
                setSelected('adventure');
            } else if (type === 'comedy') {
                const comedyMoviesRes = await axios.get('http://localhost:5000/api/movies/comedy');
                setData(prevData => ({ ...prevData, comedyMovies: comedyMoviesRes.data }));
                setSelected('comedy');
            } else if (type === 'drama') {
                const dramaMoviesRes = await axios.get('http://localhost:5000/api/movies/drama');
                setData(prevData => ({ ...prevData, dramaMovies: dramaMoviesRes.data }));
                setSelected('drama');
            } else if (type === 'fantasy') {
                const fantasyMoviesRes = await axios.get('http://localhost:5000/api/movies/fantasy');
                setData(prevData => ({ ...prevData, fantasyMovies: fantasyMoviesRes.data }));
                setSelected('fantasy');
            } else if (type === 'historical') {
                const historicalMoviesRes = await axios.get('http://localhost:5000/api/movies/historical');
                setData(prevData => ({ ...prevData, historicalMovies: historicalMoviesRes.data }));
                setSelected('historical');
            } else if (type === 'horror') {
                const horrorMoviesRes = await axios.get('http://localhost:5000/api/movies/horror');
                setData(prevData => ({ ...prevData, horrorMovies: horrorMoviesRes.data }));
                setSelected('horror');
            } else if (type === 'fiction') {
                const fictionMoviesRes = await axios.get('http://localhost:5000/api/movies/fiction');
                setData(prevData => ({ ...prevData, fictionMovies: fictionMoviesRes.data }));
                setSelected('fiction');
            } else if (type === 'thriller') {
                const thrillerMoviesRes = await axios.get('http://localhost:5000/api/movies/thriller');
                setData(prevData => ({ ...prevData, thrillerMovies: thrillerMoviesRes.data }));
                setSelected('thriller');
            } else if (type === 'mystery') {
                const mysteryMoviesRes = await axios.get('http://localhost:5000/api/movies/mystery');
                setData(prevData => ({ ...prevData, mysteryMovies: mysteryMoviesRes.data }));
                setSelected('mystery');
            } else if (type === 'romance') {
                const romanceMoviesRes = await axios.get('http://localhost:5000/api/movies/romance');
                setData(prevData => ({ ...prevData, romanceMovies: romanceMoviesRes.data }));
                setSelected('romance');
            } else if (type === 'animation') {
                const animationMoviesRes = await axios.get('http://localhost:5000/api/movies/animation');
                setData(prevData => ({ ...prevData, animationMovies: animationMoviesRes.data }));
                setSelected('animation');
            } else if (type === 'documentary') {
                const documentaryMoviesRes = await axios.get('http://localhost:5000/api/movies/documentary');
                setData(prevData => ({ ...prevData, documentaryMovies: documentaryMoviesRes.data }));
                setSelected('documentary');
            } else if (type === 'musical') {
                const musicalMoviesRes = await axios.get('http://localhost:5000/api/movies/musical');
                setData(prevData => ({ ...prevData, musicalMovies: musicalMoviesRes.data }));
                setSelected('musical');
            } else if (type === 'western') {
                const westernMoviesRes = await axios.get('http://localhost:5000/api/movies/western');
                setData(prevData => ({ ...prevData, westernMovies: westernMoviesRes.data }));
                setSelected('western');
            } else if (type === 'news') {
                const newsRes = await axios.get('http://localhost:5000/api/news');
                setData(prevData => ({ ...prevData, news: newsRes.data }));
            } else {
                setData(prevData => ({ ...prevData, movies: [], genres: [], questions: [] }));
            }
        } catch (error) {
            console.error(`Error fetching ${type}:`, error);
        }


        
    };
    

    const handleLogout = () => {
        localStorage.removeItem('token');
        localStorage.removeItem('username');
        onLogout();
        navigate('/login');
    };

    const openTrailer = (url) => {
        setTrailerUrl(url);
        setModalOpen(true);
    };

    const closeTrailer = () => {
        setModalOpen(false);  // Close the modal
        setTrailerUrl("");    // Optionally reset the trailer URL
    };

    const renderMovies = () => {
        if (data.movies.length === 0) return <p>No movies available.</p>;
        return data.movies.map((movie) => (
            <div key={movie.id} className="movie-card">
                <img
                    src={movie.image_url}
                    alt={movie.title}
                    onClick={() => openTrailer(movie.trailer_url)} 
                    className="movie-image"
                />
                <div className="movie-description">
                    <h4>{movie.title}</h4>
                    <p>Release Year: {movie.release_year}</p>
                    <p>{movie.description}</p>
                </div>
            </div>
        ));
    };

    const renderActionMovies = () => {
        if (data.actionMovies.length === 0) return <p>No action movies available.</p>;
        return data.actionMovies.map((movie) => (
            <div key={movie.id} className="movie-card">
                <img
                    src={movie.image_url}
                    alt={movie.title}
                    onClick={() => openTrailer(movie.trailer_url)} 
                    className="movie-image"
                />
                <div className="movie-description">
                    <h4>{movie.title}</h4>
                    <p>Release Year: {movie.release_year}</p>
                    <p>{movie.description}</p>
                </div>
            </div>
        ));
    };

    const renderAdventureMovies = () => {
        if (data.adventureMovies.length === 0) return <p>No adventure movies available.</p>;
        return data.adventureMovies.map((movie) => (
            <div key={movie.id} className="movie-card">
                <img
                    src={movie.image_url}
                    alt={movie.title}
                    onClick={() => openTrailer(movie.trailer_url)} 
                    className="movie-image"
                />
                <div className="movie-description">
                    <h4>{movie.title}</h4>
                    <p>Release Year: {movie.release_year}</p>
                    <p>{movie.description}</p>
                </div>
            </div>
        ));
    };
    const renderComedyMovies = () => {
        if (data.comedyMovies.length === 0) return <p>No comedy movies available.</p>;
        return data.comedyMovies.map((movie) => (
            <div key={movie.id} className="movie-card">
                <img
                    src={movie.image_url}
                    alt={movie.title}
                    onClick={() => openTrailer(movie.trailer_url)} 
                    className="movie-image"
                />
                <div className="movie-description">
                    <h4>{movie.title}</h4>
                    <p>Release Year: {movie.release_year}</p>
                    <p>{movie.description}</p>
                </div>
            </div>
        ));
    };
    
    const renderDramaMovies = () => {
        if (data.dramaMovies.length === 0) return <p>No drama movies available.</p>;
        return data.dramaMovies.map((movie) => (
            <div key={movie.id} className="movie-card">
                <img
                    src={movie.image_url}
                    alt={movie.title}
                    onClick={() => openTrailer(movie.trailer_url)} 
                    className="movie-image"
                />
                <div className="movie-description">
                    <h4>{movie.title}</h4>
                    <p>Release Year: {movie.release_year}</p>
                    <p>{movie.description}</p>
                </div>
            </div>
        ));
    };
    
    const renderFantasyMovies = () => {
        if (data.fantasyMovies.length === 0) return <p>No fantasy movies available.</p>;
        return data.fantasyMovies.map((movie) => (
            <div key={movie.id} className="movie-card">
                <img
                    src={movie.image_url}
                    alt={movie.title}
                    onClick={() => openTrailer(movie.trailer_url)} 
                    className="movie-image"
                />
                <div className="movie-description">
                    <h4>{movie.title}</h4>
                    <p>Release Year: {movie.release_year}</p>
                    <p>{movie.description}</p>
                </div>
            </div>
        ));
    };
    
    const renderHistoricalMovies = () => {
        if (data.historicalMovies.length === 0) return <p>No historical movies available.</p>;
        return data.historicalMovies.map((movie) => (
            <div key={movie.id} className="movie-card">
                <img
                    src={movie.image_url}
                    alt={movie.title}
                    onClick={() => openTrailer(movie.trailer_url)} 
                    className="movie-image"
                />
                <div className="movie-description">
                    <h4>{movie.title}</h4>
                    <p>Release Year: {movie.release_year}</p>
                    <p>{movie.description}</p>
                </div>
            </div>
        ));
    };
    
    const renderHorrorMovies = () => {
        if (data.horrorMovies.length === 0) return <p>No horror movies available.</p>;
        return data.horrorMovies.map((movie) => (
            <div key={movie.id} className="movie-card">
                <img
                    src={movie.image_url}
                    alt={movie.title}
                    onClick={() => openTrailer(movie.trailer_url)} 
                    className="movie-image"
                />
                <div className="movie-description">
                    <h4>{movie.title}</h4>
                    <p>Release Year: {movie.release_year}</p>
                    <p>{movie.description}</p>
                </div>
            </div>
        ));
    };
    
    const renderScienceFictionMovies = () => {
        console.log("Rendering Science Fiction Movies");
        if (data.fictionMovies.length === 0) {
            return <p>No Science Fiction movies available.</p>;
        }
    
        return data.fictionMovies.map((movie) => (
            <div key={movie.id} className="movie-card">
                <img
                    src={movie.image_url}
                    alt={movie.title}
                    onClick={() => openTrailer(movie.trailer_url)}
                    className="movie-image"
                />
                <div className="movie-description">
                    <h4>{movie.title}</h4>
                    <p>Release Year: {movie.release_year}</p>
                    <p>{movie.description}</p>
                </div>
            </div>
        ));
    };
    
    const renderThrillerMovies = () => {
        if (data.thrillerMovies.length === 0) return <p>No thriller movies available.</p>;
        return data.thrillerMovies.map((movie) => (
            <div key={movie.id} className="movie-card">
                <img
                    src={movie.image_url}
                    alt={movie.title}
                    onClick={() => openTrailer(movie.trailer_url)} 
                    className="movie-image"
                />
                <div className="movie-description">
                    <h4>{movie.title}</h4>
                    <p>Release Year: {movie.release_year}</p>
                    <p>{movie.description}</p>
                </div>
            </div>
        ));
    };
    
    const renderMysteryMovies = () => {
        if (data.mysteryMovies.length === 0) return <p>No mystery movies available.</p>;
        return data.mysteryMovies.map((movie) => (
            <div key={movie.id} className="movie-card">
                <img
                    src={movie.image_url}
                    alt={movie.title}
                    onClick={() => openTrailer(movie.trailer_url)} 
                    className="movie-image"
                />
                <div className="movie-description">
                    <h4>{movie.title}</h4>
                    <p>Release Year: {movie.release_year}</p>
                    <p>{movie.description}</p>
                </div>
            </div>
        ));
    };
    
    const renderRomanceMovies = () => {
        if (data.romanceMovies.length === 0) return <p>No romance movies available.</p>;
        return data.romanceMovies.map((movie) => (
            <div key={movie.id} className="movie-card">
                <img
                    src={movie.image_url}
                    alt={movie.title}
                    onClick={() => openTrailer(movie.trailer_url)} 
                    className="movie-image"
                />
                <div className="movie-description">
                    <h4>{movie.title}</h4>
                    <p>Release Year: {movie.release_year}</p>
                    <p>{movie.description}</p>
                </div>
            </div>
        ));
    };
    
    const renderAnimationMovies = () => {
        if (data.animationMovies.length === 0) return <p>No animation movies available.</p>;
        return data.animationMovies.map((movie) => (
            <div key={movie.id} className="movie-card">
                <img
                    src={movie.image_url}
                    alt={movie.title}
                    onClick={() => openTrailer(movie.trailer_url)} 
                    className="movie-image"
                />
                <div className="movie-description">
                    <h4>{movie.title}</h4>
                    <p>Release Year: {movie.release_year}</p>
                    <p>{movie.description}</p>
                </div>
            </div>
        ));
    };
    
    const renderDocumentaryMovies = () => {
        if (data.documentaryMovies.length === 0) return <p>No documentary movies available.</p>;
        return data.documentaryMovies.map((movie) => (
            <div key={movie.id} className="movie-card">
                <img
                    src={movie.image_url}
                    alt={movie.title}
                    onClick={() => openTrailer(movie.trailer_url)} 
                    className="movie-image"
                />
                <div className="movie-description">
                    <h4>{movie.title}</h4>
                    <p>Release Year: {movie.release_year}</p>
                    <p>{movie.description}</p>
                </div>
            </div>
        ));
    };
    
    const renderMusicalMovies = () => {
        if (data.musicalMovies.length === 0) return <p>No musical movies available.</p>;
        return data.musicalMovies.map((movie) => (
            <div key={movie.id} className="movie-card">
                <img
                    src={movie.image_url}
                    alt={movie.title}
                    onClick={() => openTrailer(movie.trailer_url)} 
                    className="movie-image"
                />
                <div className="movie-description">
                    <h4>{movie.title}</h4>
                    <p>Release Year: {movie.release_year}</p>
                    <p>{movie.description}</p>
                </div>
            </div>
        ));
    };
    
    const renderWesternMovies = () => {
        if (data.westernMovies.length === 0) return <p>No western movies available.</p>;
        return data.westernMovies.map((movie) => (
            <div key={movie.id} className="movie-card">
                <img
                    src={movie.image_url}
                    alt={movie.title}
                    onClick={() => openTrailer(movie.trailer_url)} 
                    className="movie-image"
                />
                <div className="movie-description">
                    <h4>{movie.title}</h4>
                    <p>Release Year: {movie.release_year}</p>
                    <p>{movie.description}</p>
                </div>
            </div>
        ));
    };
    const renderGenres = () => {
        if (data.genres.length === 0) return <p>No genres available.</p>;
    
        return data.genres.map((genre) => {
            
            let genreName = genre.name.toLowerCase(); 
            

            if (genre.name === 'Science Fiction') {
                genreName = 'fiction';
            }
    
            return (
                <div
                    key={genre.id}
                    className="genre-card"
                    onClick={() => handleSelection(genreName)}
                >
                    <h4>{genre.name}</h4>
                    <p>{genre.description}</p>
                </div>
            );
        });
    };
    
    const fetchQuestions = async () => {
        try {
            const response = await fetch('http://localhost:5000/api/questions_and_answers');
            if (!response.ok) throw new Error('Error fetching questions');
            const questionsWithAnswers = await response.json();
            setData({ questions: questionsWithAnswers });
        } catch (error) {
            console.error('Error fetching questions:', error);
        }
    };

    const addQuestion = async (title, content, movieId, answeredBy) => {
        try {
            const response = await fetch('http://localhost:5000/api/questions', {
                method: 'POST',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify({
                    title: title,
                    question_content: content,
                    movie_id: movieId,
                    answered_by: answeredBy
                })
            });
            if (!response.ok) throw new Error('Error adding question');
            alert('Question added successfully');
            fetchQuestions(); 
        } catch (error) {
            console.error('Error:', error);
            alert('Failed to add question');
        }
    };

    const addReply = async (questionId, content, answeredBy) => {
        try {
            const response = await fetch(`http://localhost:5000/api/questions/${questionId}/replies`, {
                method: 'POST',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify({
                    answer_content: content,
                    answered_by: answeredBy
                })
            });
            if (!response.ok) throw new Error('Error adding reply');
            alert('Reply added successfully');

            // Fetch the updated question with replies after the reply is added
            const updatedQuestion = await response.json();
            setData((prevData) => {
                const updatedQuestions = prevData.questions.map((q) =>
                    q.question_id === updatedQuestion[0].question_id
                        ? { ...q, answers: updatedQuestion[0].answers }
                        : q
                );
                return { ...prevData, questions: updatedQuestions };
            });

            // Reset the reply input
            setNewReply({ content: '', questionId: null });
        } catch (error) {
            console.error('Error adding reply:', error);
            alert('Failed to add reply');
        }
    };

    const handleAddQuestion = async (e) => {
        e.preventDefault();
        if (!userId) {
            alert('You need to be logged in to add a question');
            return;
        }
        await addQuestion(newQuestion.title, newQuestion.content, null, userId); // Pass userId and movieId (null for now)
        setNewQuestion({ title: '', content: '' }); // Reset the question form
    };

    const handleAddReply = async (e, questionId) => {
        e.preventDefault(); // Prevent page reload
        
        const replyContent = newReply.content;
        const answeredBy = localStorage.getItem('userId'); // Get userId from localStorage
        if (!answeredBy) {
            alert('You need to be logged in to reply');
            return;
        }
    
        try {
            await addReply(questionId, replyContent, answeredBy);
            // Reset reply input
            setNewReply({ content: '', questionId: null });
    
            // Re-fetch questions to get the updated list
            handleSelection('questions');
        } catch (error) {
            console.error('Error adding reply:', error);
            alert('Failed to add reply');
        }
    };
    const handleDeleteQuestion = async (questionId) => {
        const token = localStorage.getItem('token'); // Get token from localStorage
    
        if (!token) {
            alert('You must be logged in to delete a question!');
            return;
        }
    
        try {
            const response = await fetch(`http://localhost:5000/api/questions/${questionId}`, {
                method: 'DELETE',
                headers: {
                    'Content-Type': 'application/json',
                    'Authorization': `Bearer ${token}`  
                }
            });
    
            if (response.ok) {
                alert('Question deleted successfully');
                // Optionally refresh or update UI
            } else {
                const errorMessage = await response.text();
                alert(`Error: ${errorMessage}`);
            }
        } catch (error) {
            console.error('Error:', error);
            alert('An error occurred while deleting the question.');
        }
    };

    const renderQA = () => {
        if (data.questions.length === 0) return <p>No questions available.</p>;
    
        return (
            <>
                <div className="add-question-container">
                    <h3>Add a New Question</h3>
                    <form onSubmit={handleAddQuestion}>
                        <input
                            type="text"
                            value={newQuestion.title}
                            onChange={(e) => setNewQuestion({ ...newQuestion, title: e.target.value })}
                            placeholder="Question Title"
                            required
                        />
                        <textarea
                            value={newQuestion.content}
                            onChange={(e) => setNewQuestion({ ...newQuestion, content: e.target.value })}
                            placeholder="Question Content"
                            required
                        />
                        <button type="submit">Add Question</button>
                    </form>
                </div>
    
                {data.questions.map((question) => (
                    <div key={question.question_id} className="qa-card">
                        <div className="question-section">
                            <h4>{question.question_title}</h4>
                            <p>{question.question_content}</p>
                            {question.movie_title && <p>Movie: {question.movie_title}</p>}
                        </div>
    
                        <div className="answers-section">
                            <form onSubmit={(e) => handleAddReply(e, question.question_id)}>
                                <input
                                    type="text"
                                    value={newReply.content}
                                    onChange={(e) => setNewReply({ content: e.target.value, questionId: question.question_id })}
                                    placeholder="Your reply"
                                    required
                                />
                                <button type="submit">Reply</button>
                            </form>
    
                            <h5>Answers:</h5>
                            {Array.isArray(question.answers) && question.answers.length === 0 
                                ? <p>No answers yet.</p> 
                                : question.answers.map((answer, index) => (
                                    <div key={index}>
                                        <p>{answer.answer_content}</p>
                                        <p><strong>Answered by:</strong> {answer.answered_by}</p>
                                    </div>
                                ))
                            }
                        </div>
    
                        <div className="delete-question">
                            <button onClick={() => handleDeleteQuestion(question.question_id)}>Delete</button>
                        </div>
                    </div>
                ))}
            </>
        );
    };
    
    
    const renderNews = () => {
        if (data.news.length === 0) return <p>No news available.</p>;
        return data.news.map((newsItem) => (
            <div key={newsItem.id} className="news-card">
                {newsItem.image_url && (
                    <img
                        src={newsItem.image_url}
                        alt={newsItem.title}
                        className="news-image"
                    />
                )}
                <div className="news-description">
                    <h4>{newsItem.title}</h4>
                    <p>{newsItem.description}</p>
                    <p>Release Year: {newsItem.release_year}</p>
                </div>
            </div>
        ));
    };

    return (
        <div className="dashboard-container">
            <div className="sidebar">
                <h2>Welcome, {username}</h2>
                <div className="options">
                    <button onClick={() => handleSelection('genres')}>Genres</button>
                    <button onClick={() => handleSelection('movies')}>Most Popular</button>
                    <button onClick={() => handleSelection('news')}>News</button>
                    <button onClick={() => handleSelection('questions')}>Q&A</button>
                    <button className="logout-button" onClick={handleLogout}>Logout</button>
                </div>
            </div>
            <div className="main-content">
                <div className="data-display">
                    {selected === 'movies' && renderMovies()} 
                    {selected === 'genres' && <ul>{renderGenres()}</ul>} 
                    {selected === 'action' && renderActionMovies()} 
                    {selected === 'adventure' && renderAdventureMovies()}
                    {selected === 'comedy' && renderComedyMovies()}
                    {selected === 'drama' && renderDramaMovies()} 
                    {selected === 'fantasy' && renderFantasyMovies()} 
                    {selected === 'historical' && renderHistoricalMovies()} 
                    {selected === 'horror' && renderHorrorMovies()} 
                    {selected === 'fiction' && renderScienceFictionMovies()}
                    {selected === 'thriller' && renderThrillerMovies()} 
                    {selected === 'mystery' && renderMysteryMovies()} 
                    {selected === 'romance' && renderRomanceMovies()} 
                    {selected === 'animation' && renderAnimationMovies()} 
                    {selected === 'documentary' && renderDocumentaryMovies()}
                    {selected === 'musical' && renderMusicalMovies()} 
                    {selected === 'western' && renderWesternMovies()} 
                    {selected === 'questions' && renderQA()}
                    {selected === 'news' && renderNews()}
                </div>
            </div>
            {modalOpen && (
                <div className="modal">
                    <div className="modal-content">
                        <iframe src={trailerUrl} title="Trailer" frameBorder="0" allowFullScreen />
                        <button className="close-button" onClick={closeTrailer}>Close</button>
                    </div>
                </div>
            )}
        </div>
    );
    
};

export default Dashboard;