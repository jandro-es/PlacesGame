//
//  Config.swift
//  PlacesGame
//
//  Created by Alejandro Barros Cuetos on 23/03/2017.
//  Copyright © 2017 Filtercode Ltd. All rights reserved.
//

import Foundation

/// Class to handle all configuration values
final class Config {
  
  fileprivate static let placesApiKey = "PLACESAPI_KEY"
  
  static var placesKey: String {
    if let key = Bundle.main.infoDictionary?[placesApiKey] as? String {
      return key
    }
    fatalError("The app needs the key <<\(placesApiKey)>> to start")
  }
}
