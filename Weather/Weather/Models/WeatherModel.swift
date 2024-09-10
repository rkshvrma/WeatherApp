//
//  WeatherModel.swift
//  Weather
//
//  Created by Rakesh on 9/6/24.
//

import Foundation

struct Weather: Codable {
    let main: Main
    let weather: [WeatherCondition]
}

struct Main: Codable {
    let temp: Double
    let humidity: Int
}

struct WeatherCondition: Codable {
    let description: String
    let icon: String
}


