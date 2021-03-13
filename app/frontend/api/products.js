import axios from 'axios'

export async function fetchProducts(id) {
  try {
    const response = await axios.get(`/sites/${id}/products`, {
      headers: {
        'Accept': 'application/json'
      }
    })
    return response.data
  } catch(error) {
    console.log(error)
  }
}