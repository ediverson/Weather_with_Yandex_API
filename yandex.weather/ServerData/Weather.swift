import Foundation

struct Weather {
//MARK: - Weather information
    var name: String = "Город"
    var temp: Int = 99
    var feelsLike: Double = 99.9
    var icon: String = ""
    var url: String = ""
    var condition: String = ""
    var pressure: Int = 9999
    var windSpeed: Double = 99.9
    var tempMax: Int = 99
    var tempMin: Int = 99
    
//MARK: - Init
    init?(weatherData: WeatherData) {
        temp = weatherData.fact.temp
        feelsLike = weatherData.fact.feelsLike
        icon = weatherData.fact.icon
        url = weatherData.info.url
        condition = weatherData.fact.condition
        pressure = weatherData.fact.pressureMm
        windSpeed = weatherData.fact.windSpeed
        tempMax = weatherData.forecasts.first!.parts.day.tempMax!
        tempMin = weatherData.forecasts.first!.parts.day.tempMin!
    }
// empty init
    init() {}
    
//MARK: - Translation of weather conditions
    var conditionString: String {
        switch condition {
        case "clear":                   return "Ясно"
        case "partly-cloudy":           return "Малооблачно"
        case "cloudy":                  return "Облачно с прояснениями"
        case "overcast":                return "Пасмурно"
        case "drizzle":                 return "Морось"
        case "light-rain":              return "Небольшой дождь"
        case "rain":                    return "Дождь"
        case "moderate-rain":           return "Умеренно сильный дождь"
        case "heavy-rain":              return "Сильный дождь"
        case "continuous-heavy-rain":   return "Длительный сильный дождь"
        case "showers":                 return "Ливень"
        case "wet-snow":                return "Дождь со снегом"
        case "light-snow":              return "Небольшой снег"
        case "snow":                    return "Снег"
        case "snow-showers":            return "Снегопад"
        case "hail":                    return "Град"
        case "thunderstorm":            return "Гроза"
        case "thunderstorm-with-rain":  return "Дождь с грозой"
        case "thunderstorm-with-hail":  return "Гроза с градом"
            
        default: return "Загрузка"
        }
    }
}
