//
//  WeatherTableViewController.swift
//  SunLight
//
//  Created by Pratik Bhaliya on 31/8/19.
//  Copyright © 2019 Pratik Bhaliya. All rights reserved.
//

import UIKit

class WeatherTableViewController: UITableViewController {

    var viewModel:[ForecastViewmodel] = [] {
        didSet{
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
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

}
