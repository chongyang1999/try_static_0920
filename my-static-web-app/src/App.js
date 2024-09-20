import React, { useEffect, useState } from 'react';
import { fetchMessage } from './api';

function App() {
    const [message, setMessage] = useState('');
    const [error, setError] = useState(null);

    useEffect(() => {
        fetchMessage()
            .then(data => setMessage(data.message))
            .catch(error => setError(error.message));
    }, []);

    return (
        <div className="App">
            <header className="App-header">
                {error ? <p>Error: {error}</p> : <p>{message}</p>}
            </header>
        </div>
    );
}

export default App;