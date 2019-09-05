//
//  WeatherDetailViewController.swift
//  SunLight
//
//  Created by Pratik Bhaliya on 3/9/19.
//  Copyright © 2019 Pratik Bhaliya. All rights reserved.
//

import UIKit

class WeatherDetailViewController: UIViewController {

    // MARK: - Properties & Outlets
    @IBOutlet var weatherDetailView: WeatherDetailView?
    var viewModel: ForecastViewmodel? {
        didSet {
            updateViews()
        }
    }
    
    // MARK: - View Life clycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    // MARK: - Functions
    func updateViews(){
        if let vm = viewModel {
            DispatchQueue.main.async {
                self.weatherDetailView?.currentWeatherImage.image = vm.weatherImage
                self.weatherDetailView?.minAndMaxTemp.text = "\(vm.tempLow) - \(vm.tempHigh)°"
                self.weatherDetailView?.dateAndYear.text = vm.dayWithYear
            }
            print(vm.dayWithYear)
        }
    }
    
    @IBAction func backAction(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}
