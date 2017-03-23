//
//  UIKIt+IB.swift
//  PlacesGame
//
//  Created by Alejandro Barros Cuetos on 23/03/2017.
//  Copyright © 2017 Filtercode Ltd. All rights reserved.
//

import UIKit

extension UIView {
  
  @IBInspectable public var borderColor: UIColor? {
    get {
      guard let color = layer.borderColor else {
        return nil
      }
      
      return UIColor(cgColor: color)
    }
    set {
      layer.borderColor = newValue?.cgColor
    }
  }
  
  @IBInspectable public var borderWidth: CGFloat {
    get {
      return layer.borderWidth
    }
    set {
      layer.borderWidth = newValue
    }
  }
  
  @IBInspectable public var cornerRadius: CGFloat {
    get {
      return layer.cornerRadius
    }
    set {
      layer.cornerRadius = newValue
    }
  }
  
  @IBInspectable public var shadowRadius: CGFloat {
    get {
      return layer.shadowRadius
    }
    set {
      layer.shadowRadius = newValue
    }
  }
  
  @IBInspectable public var shadowColor: UIColor? {
    get {
      guard let color = layer.shadowColor else {
        return nil
      }
      return UIColor(cgColor: color)
    }
    set {
      layer.shadowColor = newValue?.cgColor
    }
  }
  
  @IBInspectable public var shadowOpacity: CGFloat {
    get {
      return CGFloat(layer.shadowOpacity)
    }
    set {
      layer.shadowOpacity = Float(newValue)
    }
  }
  
  @IBInspectable public var shadowOffset: CGSize {
    get {
      return layer.shadowOffset
    }
    set {
      layer.shadowOffset = newValue
    }
  }
}
