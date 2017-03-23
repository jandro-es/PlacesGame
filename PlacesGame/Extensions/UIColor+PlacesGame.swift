//
//  UIColor+PlacesGame.swift
//  PlacesGame
//
//  Created by Alejandro Barros Cuetos on 23/03/2017.
//  Copyright © 2017 Filtercode Ltd. All rights reserved.
//

import UIKit

extension UIColor {
  
  static var placesWhite: UIColor {
    if #available(iOS 10.0, *) {
      return UIColor(displayP3Red: 1.00, green: 1.00, blue: 1.00, alpha: 1.00)
    } else {
      return UIColor(red: 1.00, green: 1.00, blue: 1.00, alpha: 1.00)
    }
  }
  
  static var placesBlack: UIColor {
    if #available(iOS 10.0, *) {
      return UIColor(displayP3Red: 0.09, green: 0.09, blue: 0.09, alpha: 1.00)
    } else {
      return UIColor(red: 0.09, green: 0.09, blue: 0.09, alpha: 1.00)
    }
  }
  
  static var placesDark: UIColor {
    if #available(iOS 10.0, *) {
      return UIColor(displayP3Red: 0.20, green: 0.21, blue: 0.26, alpha: 1.00)
    } else {
      return UIColor(red: 0.20, green: 0.21, blue: 0.26, alpha: 1.00)
    }
  }
  
  static var placesNotice: UIColor {
    if #available(iOS 10.0, *) {
      return UIColor(displayP3Red: 0.91, green: 0.16, blue: 0.31, alpha: 1.00)
    } else {
      return UIColor(red: 0.91, green: 0.16, blue: 0.31, alpha: 1.00)
    }
  }
}
