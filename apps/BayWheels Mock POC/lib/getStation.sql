select * from bike_station_data where latitude = {{ mapboxMap1.selectedPoint.latitude }} and longitude = {{ mapboxMap1.selectedPoint.longitude }}