import React, { useState, useEffect } from 'react';
import axios from 'axios';

function MovieDetail({ movie }) {
  const [details, setDetails] = useState(null);

  useEffect(() => {
    if (movie && movie.id) {
      axios.get(`http://af7405712e70b4410b0382a8c5d02d95-1598426126.us-east-1.elb.amazonaws.com/movies/${movie.id}`)
        .then((response) => {
          setDetails(response.data);
        })
        .catch((err) => console.error(err));
    }
  }, [movie]);

  return (
    <div>
      <h2>{details?.title || movie?.title}</h2>
      <p>{details?.description || 'No description available.'}</p>
    </div>
  );
}

export default MovieDetail;