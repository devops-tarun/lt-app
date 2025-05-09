import React, { useEffect, useState } from 'react';

function App() {
  const [message, setMessage] = useState('');

  useEffect(() => {
    fetch('/api')
      .then(res => res.json())
      .then(data => setMessage(data.message));
  }, []);

  return (
    <div style={{ padding: "2rem", textAlign: "center" }}>
      <h1>MERN App</h1>
      <p>{message || "Loading..."}</p>
    </div>
  );
}

export default App;
