function getBrowserLocation() {
  return new Promise(resolve => {
    const coordinates = { latitude: 0, longitude: 0 }
    if(!("geolocation" in navigator)) resolve(coordinates)

    navigator.geolocation.getCurrentPosition(
      position => {
        coordinates.latitude = position.coords.latitude
        coordinates.longitude = position.coords.longitude

        resolve(coordinates)
      },
      error => resolve(coordinates)
    )
  })
}

export { getBrowserLocation }
