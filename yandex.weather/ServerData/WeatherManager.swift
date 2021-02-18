import Foundation
import Alamofire
import SVProgressHUD

//MARK: - Server request
class WeatherManager {
    private let header: HTTPHeaders = ["X-Yandex-API-Key": "8613d3d7-0bdc-4ce6-9919-fe25430411e6"]
    
    func request(lat: Double, lon: Double, completionHandler: @escaping (Weather?) -> Void) {
    let urlString = "https://api.weather.yandex.ru/v2/forecast?lat=\(lat)&lon=\(lon)&lang=ru_RU"
        SVProgressHUD.show()
        guard let url = URL(string: urlString) else { return }
        
        AF.request(url,
            method: .get,
            parameters: nil,
            encoding: URLEncoding.default,
            headers: self.header).response { (responseData) in
                guard let data = responseData.data else {
                    return }
                do {
                    let weatherData = try JSONDecoder().decode(WeatherData.self, from: data)
                    guard let weather = Weather(weatherData: weatherData) else { return }
                    SVProgressHUD.dismiss()
                    completionHandler(weather)
                } catch let error {
                    print(error.localizedDescription)
                }
            }
    }
}
