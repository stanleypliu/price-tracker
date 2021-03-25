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

export async function fetchSite(id) {
  try {
    const response = await axios.get(`/sites/${id}`, {
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
    if (response.data.redirect_link !== undefined && response.data.message !== undefined) { 
      window.location = response.data.redirect_link
      M.toast({ html: response.data.message })
    }
  } catch(error) {
    console.log(error)
  }
}