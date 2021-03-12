import axios from 'axios'

export async function fetchCurrentSites() {
  try {
    const response = await axios.get('/sites', {
      headers: {
        'Accept': 'application/json'
      }
    })
    return response.data
  } catch(error) {
    console.log(error)
  }
}

export async function createSite(params) {
  const csrf = document.querySelectorAll('meta[name="csrf-token"]')[0].getAttribute('content');
  axios.defaults.headers.common['X-CSRF-Token'] = csrf;
  axios.defaults.headers.common['Accept'] = 'application/json';

  try {
    const response = await axios.post('/sites', params)
    if (response.status === 200) { return }
  } catch(error) {
    console.log(error)
  }
}