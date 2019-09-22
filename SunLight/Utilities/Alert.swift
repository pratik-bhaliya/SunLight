//
//  Alert.swift
//  SunLight
//
//  Created by Pratik Bhaliya on 23/9/19.
//  Copyright © 2019 Pratik Bhaliya. All rights reserved.
//

import UIKit

enum Alert {
    
    static func showBasic(title:String, message:String, vc:UIViewController, andEnable button: UIButton?){
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default) { _ in
            if let button = button { button.isEnabled = true }
        }
        alertController.addAction(action)
        DispatchQueue.main.async { vc.present(alertController, animated: true)}
    }
    
    // MARK :- General
    static func showIncompleteForm(on vc:UIViewController, andEnable button:UIButton) {
        Alert.showBasic(title: "Incomplete Form", message: "Please fill out all fields", vc: vc, andEnable: button)
    }
    
    static func showLowBattery(on vc:UIViewController){
        Alert.showBasic(title: "Low Battery", message: "Please charge your phone", vc: vc, andEnable: nil)
    }
}
