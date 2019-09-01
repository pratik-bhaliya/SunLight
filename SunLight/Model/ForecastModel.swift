//
//  ForecastModel.swift
//  SunLight
//
//  Created by Pratik Bhaliya on 1/9/19.
//  Copyright © 2019 Pratik Bhaliya. All rights reserved.
//

import Foundation

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
    let icon,summary: String
    let tempHigh,tempLow: Double
}

extension ForecastViewmodel{
    init(with dailyData: Datum) {
        self.icon = dailyData.icon
        self.summary = dailyData.summary
        self.tempLow = dailyData.temperatureLow
        self.tempHigh = dailyData.temperatureLow
    }
}
