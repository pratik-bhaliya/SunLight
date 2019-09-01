//
//  AppDelegate.swift
//  SunLight
//
//  Created by Pratik Bhaliya on 29/8/19.
//  Copyright © 2019 Pratik Bhaliya. All rights reserved.
//

import UIKit
import Moya
import CoreLocation

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    let api = "d8b40396951045f865c3ae65c32e097a"

    var window: UIWindow?
    let locationService = LocationService()
    let networkProvider = MoyaProvider<NetworkService>()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        locationService.coordinates = { [weak self] result in
            switch result {
            case .success(let location):
                self?.getDailyForecast(with: location)
            case .error(let error):
                print("Unable to get your location: \(error)")
            }
        }
        
        switch locationService.status {
        case .denied,.notDetermined,.restricted:
            locationService.getLocationAuthorization()
        default:
            locationService.getLocation()
        }
        
        return true
    }
    
    func getDailyForecast(with location:CLLocation){
        networkProvider.request(.forecast(location.coordinate.latitude, location.coordinate.longitude, api)) { (result) in
            switch result {
            case .success(let response):
                do {
                    let json = try JSONDecoder().decode(Forecast.self, from: response.data)
                    let viewmodle = json.daily.data.compactMap(ForecastViewmodel.init)
                    let forecastViewController = AppDelegate.viewControllerInNav(of: WeatherTableViewController.self, in: self.window)
                    forecastViewController?.viewModel = viewmodle
                }catch {
                    print("unable to parse request: \(error)")
                }
            case .failure(let error):
                print("Unabkle to parse your requeste \(error)")
            }
        }
    }
    
    static func viewControllerInNav<T>(of Type: T.Type, in window: UIWindow?) -> T? {
        return window?.rootViewController.flatMap { $0 as? UINavigationController }? .viewControllers.first(where: {$0 is T}) as? T
    }
}

