//
//  AppDelegate.swift
//  Weather
//
//  Created by Rakesh on 9/6/24.
//

import UIKit
import SwiftUI

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let window = UIWindow(frame: UIScreen.main.bounds)
        let weatherService = WeatherService()
        let viewModel = WeatherViewModel(weatherService: weatherService)
        let contentView = WeatherView(viewModel: viewModel)

        window.rootViewController = UIHostingController(rootView: contentView)
        self.window = window
        window.makeKeyAndVisible()

        return true
    }
}


