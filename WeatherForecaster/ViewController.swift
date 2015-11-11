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
    DataManager.getForecastDataFromFileWithSuccess { (data) -> Void in
      println("Data from forecast.json file:")
      var parseError: NSError?
      let parsedObject: AnyObject? = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.AllowFragments, error:&parseError)
      
      if let forecastStream = parsedObject as? NSDictionary {
        println("forecast opened")
        if let city = forecastStream["city"] as? NSDictionary {
          println("city found")
          if let name = city["name"] as? String {
            println("Optional Binding: \(name)")
          } else {
            println("failed on name")
          }
        }
      }
    }
        
    // Read json from the API and parse w/ SwiftyJSON
    DataManager.getForecastDataFromAPIWithSuccess { (weatherData) -> Void in
      println("\n")
      println("Data from OpenWeatherMap API:")
      let json = JSON(data: weatherData)
      let cityName = json["city"]["name"]
      var lists = json["list"][0]
      var iconImg = String(stringInterpolationSegment: json["list"][0]["weather"][0]["icon"])
      var temp = json["list"][0]["main"]["temp"].floatValue
      var period = String(stringInterpolationSegment: json["list"][0]["dt_txt"])
      
      println("City: \(cityName)")
      println("Temp: \(temp)")
      println("Period: \(period)")
      println("IconImg: \(iconImg)")
    }
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

}

