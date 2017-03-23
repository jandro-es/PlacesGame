//
//  MainCoordinator.swift
//  PlacesGame
//
//  Created by Alejandro Barros Cuetos on 23/03/2017.
//  Copyright © 2017 Filtercode Ltd. All rights reserved.
//

import UIKit
import PermissionScope

final class MainCoordinator: Coordinator {
  
  internal var locationService: LocationService!
  internal var window: UIWindow?
  var navigationController: NavigationController!
  
  init(parameters: CoordinatorParameterBag) {
    self.locationService = parameters.locationService
    self.window = parameters.window
  }
  
  func start() {
    let startViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: StartViewController.identifier) as! StartViewController
    startViewController.locationService = locationService
    startViewController.pScope = setupPermissions()
    navigationController = NavigationController(rootViewController: startViewController)
    navigationController.navigationBar.isHidden = true
    switchWindowRootViewController(navigationController)
  }
  
  fileprivate func setupPermissions() -> PermissionScope {
    let pScope = PermissionScope()
    pScope.addPermission(LocationWhileInUsePermission(), message: "For finding the closest restaurants.\nEverything is kept in your device.")
    pScope.bodyLabel.text = "We need some permissions to provide the full experience."
    pScope.headerLabel.textColor = UIColor.placesBlack
    pScope.headerLabel.font = UIFont.latoHeavy(of: UIFont.FontSize.title, adjusted: false)
    pScope.headerLabel.text = "Permissions needed!"
    pScope.buttonFont = UIFont.latoMedium(of: UIFont.FontSize.buttonSize, adjusted: false)
    pScope.closeButtonTextColor = UIColor.filtercodeRed
    pScope.bodyLabel.textColor = UIColor.placesBlack
    pScope.bodyLabel.font = UIFont.latoBold(of: UIFont.FontSize.bigText, adjusted: false)
    pScope.permissionButtonTextColor = UIColor.filtercodeBlue
    pScope.permissionButtonBorderColor = UIColor.filtercodeBlue
    pScope.labelFont = UIFont.latoThin(of: UIFont.FontSize.mediumText, adjusted: false)
    pScope.authorizedButtonColor = UIColor.filtercodeBlue
    pScope.closeButton.setImage(UIImage(named: "closeIcon")!, for: [])
    pScope.closeButton.setTitle("", for: [])
    pScope.closeOffset = CGSize(width: 17, height: -2)
    return pScope
  }
}
