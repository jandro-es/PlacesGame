//
//  UIColor+Filtercode.swift
//  PlacesGame
//
//  Created by Alejandro Barros Cuetos on 23/03/2017.
//  Copyright © 2017 Filtercode Ltd. All rights reserved.
//

import UIKit

extension UIColor {
  
  static var filtercodeYellow: UIColor {
    if #available(iOS 10.0, *) {
      return UIColor(displayP3Red: 0.95, green: 0.82, blue: 0.53, alpha: 1.00)
    } else {
      return UIColor(red: 0.95, green: 0.82, blue: 0.53, alpha: 1.00)
    }
  }
  
  static var filtercodeRed: UIColor {
    if #available(iOS 10.0, *) {
      return UIColor(displayP3Red: 0.84, green: 0.36, blue: 0.30, alpha: 1.00)
    } else {
      return UIColor(red: 0.84, green: 0.36, blue: 0.30, alpha: 1.00)
    }
  }
  
  static var filtercodeBlue: UIColor {
    if #available(iOS 10.0, *) {
      return UIColor(displayP3Red: 0.28, green: 0.64, blue: 0.75, alpha: 1.00)
    } else {
      return UIColor(red: 0.28, green: 0.64, blue: 0.75, alpha: 1.00)
    }
  }
}
