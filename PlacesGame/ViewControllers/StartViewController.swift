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
    pScope.show({ [weak self](_, results) in
      if results[0].status == .authorized {
        debugPrint("Location authorized")
        self?.locationService.start()
      }
      debugPrint("got results \(results[0].status)")
      }, cancelled: { (results) -> Void in
        debugPrint("Permissions dialog was cancelled")
    })
  }
  
  // Actions
  @IBAction func playAction(_ sender: UIButton) {
    let gameViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: GameViewController.identifier) as! GameViewController
    gameViewController.locationService = locationService
    navigationController?.pushViewController(gameViewController, animated: true)
  }
  
  @IBAction func scoresAction(_ sender: UIButton) {
    let leaderboardViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: LeaderboardViewController.identifier) as! LeaderboardViewController
    navigationController?.pushViewController(leaderboardViewController, animated: true)
  }
}
