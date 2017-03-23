//
//  GameViewController.swift
//  PlacesGame
//
//  Created by Alejandro Barros Cuetos on 23/03/2017.
//  Copyright © 2017 Filtercode Ltd. All rights reserved.
//

import UIKit

class GameViewController: UIViewController, Injectable {

  static let identifier = "GameViewController"
  
  /// Injected Properties
  
  var locationService: LocationService!
  
  /// Private properties
  
  fileprivate lazy var modelView: GameViewModel = {
    return GameViewModel(self.locationService)
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupView()
  }
  
  // MARK: - Private methods
  
  fileprivate func setupView() {
    
  }
}
