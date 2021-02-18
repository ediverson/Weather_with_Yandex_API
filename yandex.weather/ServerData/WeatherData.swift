import Foundation

// MARK: - Welcome
struct WeatherData: Codable {
    let info: Info
    let fact: Fact
    let forecasts: [Forecast]
}

// MARK: - Info
struct Info: Codable {
    let url: String
}


// MARK: - Fact
struct Fact: Codable {
    let temp: Int
    let feelsLike: Double
    let icon: String
    let condition: String
    let windSpeed: Double
    let pressureMm: Int

    enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike = "feels_like"
        case icon
        case condition
        case windSpeed = "wind_speed"
        case pressureMm = "pressure_mm"
    }
}

// MARK: - Forecast
struct Forecast: Codable {
    let parts: Parts
}

// MARK: - Parts
struct Parts: Codable {
    let day: Day
}

struct Day: Codable {
    let tempMax: Int?
    let tempMin: Int?
    
    enum CodingKeys: String, CodingKey{
        case tempMax = "temp_max"
        case tempMin = "temp_min"
    }
}

