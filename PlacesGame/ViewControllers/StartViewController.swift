//
//  StartViewController.swift
//  PlacesGame
//
//  Created by Alejandro Barros Cuetos on 23/03/2017.
//  Copyright © 2017 Filtercode Ltd. All rights reserved.
//

import UIKit
import PermissionScope

final class StartViewController: UIViewController, Injectable {
  
  static let identifier = "StartViewController"
  
  /// Injected Properties
  var locationService: LocationService!
  
  /// Per instance properties
  var pScope: PermissionScope!
  
  /// Outlets
  
  /// ViewController
  override func viewDidLoad() {
    super.viewDidLoad()
  }
}
