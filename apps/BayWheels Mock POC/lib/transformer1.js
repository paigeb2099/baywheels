return {{ formatDataAsArray(getBikes.data) }}.map((row) => {
  return {
    longitude: row.longitude,
    latitude: row.latitude,
  }
})