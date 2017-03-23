//
//  Coordinator.swift
//  PlacesGame
//
//  Created by Alejandro Barros Cuetos on 23/03/2017.
//  Copyright © 2017 Filtercode Ltd. All rights reserved.
//

import Foundation
import UIKit

class CoordinatorParameterBag {
  
  var locationService: LocationService!
  var window: UIWindow!
  
  init(_ locationService: LocationService, _ window: UIWindow) {
    self.locationService = locationService
    self.window = window
  }
}

protocol Coordinator {
  
  var locationService: LocationService! { get set }
  var window: UIWindow? { get set }
  
  init(parameters: CoordinatorParameterBag)
  
  func start()
  
  /// If the Coordinator can handle the open url request it should return `true`
  func open(_ url: URL, sourceApplication: String?, annotation: Any) -> Bool
}

extension Coordinator {
  
  func open(_ url: URL, sourceApplication: String?, annotation: Any) -> Bool {
    return false
  }
}

extension Coordinator {
  
  func switchWindowRootViewController(_ rootViewController: UIViewController) {
    guard let window = window, let _ = window.rootViewController else {
      self.window?.rootViewController = rootViewController
      return
    }
    UIView.transition(with: window, duration: 0.5, options: .transitionCrossDissolve, animations: {
      let oldState = UIView.areAnimationsEnabled
      UIView.setAnimationsEnabled(false)
      self.window?.rootViewController = rootViewController
      UIView.setAnimationsEnabled(oldState)
    }, completion: nil)
  }
}
