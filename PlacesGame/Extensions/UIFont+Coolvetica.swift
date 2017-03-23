//
//  UIFont+Coolvetica.swift
//  PlacesGame
//
//  Created by Alejandro Barros Cuetos on 23/03/2017.
//  Copyright © 2017 Filtercode Ltd. All rights reserved.
//

import UIKit

extension UIFont {
  
  static func coolveticaRegular(of size: FontSize, adjusted: Bool = true) -> UIFont {
    return UIFont(name: "CoolveticaRg-Regular", size: size.rawValue + (adjusted ? variationSize : 0))!
  }
}
