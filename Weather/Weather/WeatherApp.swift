//
//  WeatherApp.swift
//  Weather
//
//  Created by Rakesh on 9/6/24.
//

import SwiftUI

struct WeatherApp: App {
    var body: some Scene {
        WindowGroup {
            let weatherService = WeatherService()
            let viewModel = WeatherViewModel(weatherService: weatherService)
            WeatherView(viewModel: viewModel)
        }
    }
}

