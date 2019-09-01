//
//  ForecastModel.swift
//  SunLight
//
//  Created by Pratik Bhaliya on 1/9/19.
//  Copyright © 2019 Pratik Bhaliya. All rights reserved.
//

import UIKit

struct Forecast: Codable {
    let daily: Daily
}

struct Daily: Codable {
    let summary, icon: String
    let data: [Datum]
}

struct Datum: Codable {
    let icon,summary: String
    let time: Int
    let temperatureHigh,temperatureLow,humidity,windSpeed: Double
}

struct ForecastViewmodel {
    let dayOfWeek,summary: String
    let weatherImage: UIImage?
    let tempHigh,tempLow: Int
    
    
    static func dateFormatter(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE"
        return formatter.string(from: date)
    }
    
    static func convertFahrenheit(high: Int) ->Int {
        let highCelsius = (high - 32) * 5/9
        return highCelsius
    }
    
    static func convertLowFahrenheit(low: Int) -> Int {
        return (low - 32) * 5/9
    }
}

extension ForecastViewmodel{
    init(with dailyData: Datum) {
        let date = Date(timeIntervalSince1970: TimeInterval(dailyData.time))
        self.weatherImage = UIImage(named:dailyData.icon)
        self.dayOfWeek = ForecastViewmodel.dateFormatter(date)
        self.summary = dailyData.summary
        self.tempLow = ForecastViewmodel.convertLowFahrenheit(low: Int(dailyData.temperatureLow))
        self.tempHigh = ForecastViewmodel.convertFahrenheit(high: Int(dailyData.temperatureLow))
    }
}
