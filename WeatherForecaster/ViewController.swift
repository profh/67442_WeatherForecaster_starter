//
//  ViewController.swift
//  WeatherForecaster
//
//  Created by Larry Heimann on 11/6/15.
//  Copyright (c) 2015 Larry Heimann. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Read from the forecast.json file and parse w/o SwiftyJSON
    //  DataManager.getForecastDataFromFileWithSuccess {
        //
        // parse w/o SwiftyJSON and get the city's name to run line below:
        //
        // println("Optional Binding: \(name)")
     // }
    
    
    // Use SwiftyJSON to read from api and println() out the following
    // values for the first snapshot returned
    // DataManager.getForecastDataFromAPIWithSuccess {
        //
        // println("City: \(cityName)")
        // println("Temp: \(temp)")
        // println("Period: \(period)")
        // println("IconImg: \(iconImg)")
    // }
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

}

