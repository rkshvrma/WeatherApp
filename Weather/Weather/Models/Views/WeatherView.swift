//
//  WeatherView.swift
//  Weather
//
//  Created by Rakesh on 9/6/24.
//

import SwiftUI

struct WeatherView: View {
    @ObservedObject var viewModel: WeatherViewModel

    var body: some View {
        VStack {
            if let weather = viewModel.weather {
                Text("Temperature: \(weather.main.temp)°C")
                Text("Humidity: \(weather.main.humidity)%")
                Text(weather.weather.first?.description.capitalized ?? "")
                
                AsyncImage(url: URL(string: "https://openweathermap.org/img/w/\(weather.weather.first?.icon ?? "01d").png")) { image in
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                } placeholder: {
                    ProgressView()
                }
            } else if let errorMessage = viewModel.errorMessage {
                Text("Error: \(errorMessage)")
                    .foregroundColor(.red)
            } else {
                ProgressView()
            }
        }
        .onAppear {
            viewModel.fetchWeather(for: "London")
            print("Temperature")
        }
        .padding()
    }
}
