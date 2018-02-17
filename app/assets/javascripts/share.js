const Sharing = {
  all (API_KEY) {
    return fetch(
      `http://localhost:3000/api/v1/shares`,
      {
        method: 'GET',
        headers: {
          'Content-Type': 'application/json',
          'Authorization': API_KEY
        }
      }
    )
    .then(res => {
      if (res.status === 200) {
        return res.json();
      } else {
        return {error: 'Unauthorized'};
      }
    });
  }
};
