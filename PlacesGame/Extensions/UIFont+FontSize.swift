//
//  UIFont+FontSize.swift
//  PlacesGame
//
//  Created by Alejandro Barros Cuetos on 23/03/2017.
//  Copyright © 2017 Filtercode Ltd. All rights reserved.
//

import UIKit

extension UIFont {
  
  enum FontSize: CGFloat {
    case title = 20.0
    case mediumText = 14.0
    case bigText = 16.0
    case buttonSize = 15.0
    case navigationTitle = 24.0
  }
  
  static var variationSize: CGFloat {
    switch UIApplication.shared.preferredContentSizeCategory {
    case UIContentSizeCategory.extraSmall:
      return -6
    case UIContentSizeCategory.small:
      return -4
    case UIContentSizeCategory.medium:
      return -2
    case UIContentSizeCategory.large:
      return 0
    case UIContentSizeCategory.extraLarge:
      return 2
    case UIContentSizeCategory.extraExtraLarge:
      return 4
    case UIContentSizeCategory.extraExtraExtraLarge:
      return 6
    default:
      return 0
    }
  }
}
