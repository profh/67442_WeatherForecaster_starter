//
//  DataManager.swift
//  WeatherForecaster
//
//  Created by Larry Heimann on 11/6/15.
//  Copyright (c) 2015 Larry Heimann. All rights reserved.
//

import Foundation

// Go to http://openweathermap.org/api to get your own API key and replace in string
// Will eventually move this to Forecast model and not default to Pittsburgh, but keep for initial exercise
let ForecastURL = "http://api.openweathermap.org/data/2.5/forecast/city?id=5206379&APPID=YOUR_API_KEY_HERE"

class DataManager {
  
  class func getForecastDataFromFileWithSuccess(success: ((data: NSData) -> Void)) {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), {
      let filePath = NSBundle.mainBundle().pathForResource("forecast",ofType:"json")
      
      var readError:NSError?
      if let data = NSData(contentsOfFile:filePath!,
        options: NSDataReadingOptions.DataReadingUncached,
        error:&readError) {
          success(data: data)
      }
    })
  }
  
  class func loadDataFromURL(url: NSURL, completion:(data: NSData?, error: NSError?) -> Void) {
    var session = NSURLSession.sharedSession()
    
    // Use NSURLSession to get data from an NSURL
    let loadDataTask = session.dataTaskWithURL(url, completionHandler: { (data: NSData!, response: NSURLResponse!, error: NSError!) -> Void in
      if let responseError = error {
        completion(data: nil, error: responseError)
      } else if let httpResponse = response as? NSHTTPURLResponse {
        if httpResponse.statusCode != 200 {
          var statusError = NSError(domain:"cmuis.net", code:httpResponse.statusCode, userInfo:[NSLocalizedDescriptionKey : "HTTP status code has unexpected value."])
          completion(data: nil, error: statusError)
        } else {
          completion(data: data, error: nil)
        }
      }
    })
    
    loadDataTask.resume()
  }
  
  class func getForecastDataFromAPIWithSuccess(success: ((weatherData: NSData!) -> Void)) {
    loadDataFromURL(NSURL(string: ForecastURL)!, completion:{(data, error) -> Void in
      if let urlData = data {
        success(weatherData: urlData)
      }
    })
  }
  
}