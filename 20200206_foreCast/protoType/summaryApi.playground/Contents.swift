import UIKit

struct WeatherSummary: Codable {
    struct Weather: Codable {
        struct Minutely: Codable {
            struct Sky: Codable {
                let code: String
                let name: String
            }
            struct Temperature:Codable {
                let tc:String
                let tmax:String
                let tmin:String
            }
            let sky: Sky
            let temperatrue: Temperature
        }
        
        let minutely: [Minutely]
    }
    struct Result:Codable {
        let code: Int
        let message: String
    }
    let weather: Weather
    let result: Result
}

let apiUrl = "https://apis.openapi.sk.com/weather/current/minutely?version=2 &lat=37.498206 &lon=127.02761&appKey=l7xxf26fc00b8f6b43b1ad131bfe83c26fef"

let url = URL(string: apiUrl)

let session = URLSession.shared
let task = session.dataTask(with: url) { (data, response, error) in
    if let error = error {
        print(error)
        return
    }
    guard let httpResponse = response as? HTTPURLResponse else {
        print("Invalid response")
        return
        
    }
    guard(200...299).contains(httpResponse.statusCode) else {
        print(httpResponse.statusCode)
        return
    }
    
    guard let data = data else {
        fatalError("Invalid Data")
    }
    
    do {
        let decoder = JSONDecoder()
        let summary = try decoder.decode(WeatherSummary.self, from: data)
        summary.result.code
        summary.result.message
        
        
        summary.weather.minutely.first?.sky.code
        summary.weather.minutely.first?.sky.name
        summary.weather.minutely.first?.temperatrue.tmax
        summary.weather.minutely.first?.temperatrue.tmin
        summary.weather.minutely.first?.temperatrue.tc
    } catch {
        print(error)
    }
    
    
}

task.resume()
