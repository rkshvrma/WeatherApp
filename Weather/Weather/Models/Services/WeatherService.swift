//
//  WeatherService.swift
//  Weather
//
//  Created by Rakesh on 9/6/24.
//

import Foundation
import Combine

protocol WeatherServiceProtocol {
    func fetchWeather(forCity city: String, countryCode: String?, stateCode: String?) -> AnyPublisher<Weather, Error>
}

class WeatherService: WeatherServiceProtocol {
    private let apiKey = "be71bd0057750b2932fc8e1b9dd1315c"
    
    func fetchWeather(forCity city: String, countryCode: String? = nil, stateCode: String? = nil) -> AnyPublisher<Weather, Error> {
        
        var urlString = "https://api.openweathermap.org/data/2.5/weather?q=\(city)"
        
        if let stateCode = stateCode, let countryCode = countryCode {
            urlString += ",\(stateCode),\(countryCode)"
        } else if let countryCode = countryCode {
            urlString += ",\(countryCode)"
        }
        
        urlString += "&appid=\(apiKey)&units=metric"
        
        guard let url = URL(string: urlString) else {
            return Fail(error: URLError(.badURL))
                .eraseToAnyPublisher()
        }
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: Weather.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}
