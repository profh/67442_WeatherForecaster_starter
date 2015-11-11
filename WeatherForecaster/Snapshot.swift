//
//  Snapshot.swift
//  WeatherForecaster
//
//  Created by Larry Heimann on 11/7/15.
//  Copyright (c) 2015 Larry Heimann. All rights reserved.
//

import Foundation

class Snapshot {
  var temp: Float
  var period: String
  var icon: NSURL
  
  init(temp: Float, period: String, iconType: String) {
    self.temp = temp
    self.period = period
    self.icon = NSURL(fileURLWithPath: "http://openweathermap.org/img/w/\(iconType).png")!
  }
  
  func tempAsFahrenheit() -> Float {
    var fahrenheit = 9/5 * (self.temp - 273) + 32
    return fahrenheit
  }
  
  func timeDisplay() -> String {
    var time: String = ""
    // split up period and return the time as a string to be displayed
    // be sure to convert to proper timezone
    return time
  }
  
  func dateDisplay() -> String {
    var date: String = ""
    // split up period and return the date as a string to be displayed
    // be sure to adjust for the timezone if near midnight...
    return date
  }
  
}