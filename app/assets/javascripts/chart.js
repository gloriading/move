let base_url;
if(location.href.indexOf('local') > -1){
  base_url = "http://localhost:3000";
}else{
  base_url = "https://healthymove.herokuapp.com";
}


const Charting = {
  get (dates, API_KEY) {
    return fetch(
      `${base_url}/api/v1/charts?start_date=${dates}`,
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
