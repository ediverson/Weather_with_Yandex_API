import Foundation
import CoreLocation
// link
let serverManaget = WeatherManager()

//MARK: - Get city
func getCityWeather(citiesArray: [String], completion: @escaping (Int, Weather?) -> Void) {
    
    for (index, item) in citiesArray.enumerated() {
        
        getCoordinate(city: item) { (coordinate, error) in
            guard let coordinate = coordinate, error == nil else { return }
            
            serverManaget.request(lat: coordinate.latitude, lon: coordinate.longitude) { (weather) in
                completion(index, weather)
            }
        }
    }
}

//MARK: - Get lat & lon
func getCoordinate(city: String, completion: @escaping (_ coordinate: CLLocationCoordinate2D?, _ error: Error?) -> () ) {
    CLGeocoder().geocodeAddressString(city) { (placemark, error) in
        completion(placemark?.first?.location?.coordinate, error)
    }
}
