const API_KEY = '8a5f3002b35c1962612527561da6bc7d0a9fe5adce14aba8a4250dd5b7d51f54'
const Charting = {
  get (params) {
    return fetch(
      `http://localhost:3000/api/v1/charts?start_date=${params}`,
      {
        method: 'GET',
        headers: {
          'Content-Type': 'application/json',
          'Authorization': API_KEY
        },
        body: JSON.stringify(params)
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
