import axios from 'axios'

export function fetchCurrentSites() {
  return axios.get('/sites', {
    headers: {
      'Accept': 'application/json'
    }
  })
  .then((response) => {
    return response.data
  })
  .catch((error)=> {
    console.log(error)
  })
}
