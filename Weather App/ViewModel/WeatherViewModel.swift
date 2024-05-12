
import Foundation
import Observation
import CoreLocation


class WeatherViewModel {
    var weatherModel: WeatherModel = WeatherModel.defaultWeather()
    
    
    func getCurrentWeather(latitude: CLLocationDegrees, longitude: CLLocationDegrees) {
        getWeather(urlString: "https://api.openweathermap.org/data/2.5/weather?lat=\(latitude)&lon=\(longitude)&appid=51d7a6c7a55e2d2bce9a8e810996c4a3")
    }
 
    func getWeather(urlString: String) {
        guard let url = URL(string: urlString) else { return }
        
        var request = URLRequest(url: url)
        
        let task = url
    }
}

