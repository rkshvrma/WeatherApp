//
//  WeatherViewModel.swift
//  Weather
//
//  Created by Rakesh on 9/6/24.
//

import Combine
import Foundation

class WeatherViewModel: ObservableObject {
    @Published var weather: Weather?
    @Published var errorMessage: String?
    
    private let weatherService: WeatherServiceProtocol
    private var cancellables = Set<AnyCancellable>()

    init(weatherService: WeatherServiceProtocol) {
        self.weatherService = weatherService
    }

    func fetchWeather(for city: String) {
        weatherService.fetchWeather(forCity: city, countryCode: nil, stateCode: nil)
            .sink { completion in
                switch completion {
                case .failure(let error):
                    print("Error fetching weather: \(error.localizedDescription)")
                    self.errorMessage = error.localizedDescription
                case .finished:
                    break
                }
            } receiveValue: { weather in
                self.weather = weather
            }
            .store(in: &cancellables)
    }
}
