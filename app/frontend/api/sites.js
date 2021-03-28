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

export async function fetchSiteAndProducts(id) {
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
