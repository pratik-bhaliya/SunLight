//
//  DailyWeatherTableViewCell.swift
//  SunLight
//
//  Created by Pratik Bhaliya on 2/9/19.
//  Copyright © 2019 Pratik Bhaliya. All rights reserved.
//

import UIKit
import AlamofireImage

class DailyWeatherTableViewCell: UITableViewCell {

    @IBOutlet weak var dayName: UILabel!
    @IBOutlet weak var temprature: UILabel!
    @IBOutlet weak var weatherImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func updateViews(with forecast: ForecastViewmodel){
        self.dayName.text = forecast.dayOfWeek
        self.temprature.text = "\(forecast.tempLow) - \(forecast.tempHigh) C"
        self.weatherImage.image = forecast.weatherImage
    }

}
