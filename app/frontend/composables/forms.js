export function checkValidity(inputs) {
  return inputs.every((input) => {
    input.value !== '' 
  })
}