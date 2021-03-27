import axios from 'axios'

export async function fetchCurrentProducts() {
  try {
    const response = await axios.get('/products', {
      headers: {
        'Accept': 'application/json'
      }
    })
    return response.data
  } catch(error) {
    console.log(error)
  }
}