//
//  WeatherTableViewController.swift
//  SunLight
//
//  Created by Pratik Bhaliya on 31/8/19.
//  Copyright © 2019 Pratik Bhaliya. All rights reserved.
//

import UIKit
import Moya
import CoreLocation

class WeatherTableViewController: UITableViewController {

    // MARK: - Properties & Outlets
    var viewModel:[ForecastViewmodel] = [] {
        didSet{
            tableView.reloadData()
        }
    }
    let networkProvider = MoyaProvider<NetworkService>()
    let locationManager = LocationService()
    
    // MARK: - View Life-Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        getLocationValue()
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return viewModel.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WeatherCell", for: indexPath) as! DailyWeatherTableViewCell

        let vm = viewModel[indexPath.row]
        cell.updateViews(with: vm)
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let vm = viewModel[indexPath.row]
         let viewController = storyboard?.instantiateViewController(withIdentifier: "WeatherDetailViewController") as! WeatherDetailViewController
        viewController.viewModel = vm
        navigationController?.pushViewController(viewController, animated: true)
    }

    func getLocationValue() {
        locationManager.coordinates = { [weak self] result in
            switch result {
            case .success(let location):
                self?.getTimeLocation(location: location)
            case .error(let error):
                print(error)
            }
        }
        
        switch locationManager.status {
        case .denied,.notDetermined,.restricted:
            locationManager.getLocationAuthorization()
        default:
            locationManager.getLocation()
        }
    }
    
    func dateFormatter(_ date: Date, and formate:String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = formate
        return formatter.string(from: date)
    }
    
    func getTimeLocation(location: CLLocation) {
        let time = dateFormatter(location.timestamp, and: "yyyy-MM-dd'T'HH:mm:ssZ")
        networkProvider.request(.timeMachine("d8b40396951045f865c3ae65c32e097a", location.coordinate.latitude, location.coordinate.longitude, time)) { (result) in
            switch result {
            case .success(let response):
                let jsorn = try? JSONSerialization.jsonObject(with: response.data, options: [])
                print("This is parse result: \(jsorn ?? "")")
            case .failure(let error):
                print("Unable to parse \(error)")
            }
        }
    }
}
