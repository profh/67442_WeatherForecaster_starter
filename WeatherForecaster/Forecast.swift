//
//  Forecast.swift
//  WeatherForecaster
//
//  Created by Larry Heimann on 11/7/15.
//  Copyright (c) 2015 Larry Heimann. All rights reserved.
//

import Foundation

class Forecast {
  
  var snapshots:[Snapshot]?
  var city: String?
  var cityID: Int?
  
  
  init(cityID: Int = 5206379) {
    self.cityID = cityID
    self.city = ""
    self.snapshots = []
    // Go to http://openweathermap.org/api to get your own API key and replace in string
    var ForecastURL = "http://api.openweathermap.org/data/2.5/forecast/city?id=\(self.cityID)&APPID=YOUR_API_KEY_HERE"
  }
  
  // Need additional methods to get the first six snapshots in a forecast, etc.

  
}
