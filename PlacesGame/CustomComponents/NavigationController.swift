//
//  NavigationController.swift
//  PlacesGame
//
//  Created by Alejandro Barros Cuetos on 23/03/2017.
//  Copyright © 2017 Filtercode Ltd. All rights reserved.
//

import UIKit

final class NavigationController: UINavigationController {
  
  override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
  }
  
  override init(rootViewController: UIViewController) {
    super.init(navigationBarClass: NavigationBar.self, toolbarClass: UIToolbar.self)
    viewControllers = [rootViewController]
  }
  
  init() {
    super.init(navigationBarClass: NavigationBar.self, toolbarClass: UIToolbar.self)
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(navigationBarClass: NavigationBar.self, toolbarClass: UIToolbar.self)
  }
  
  override var prefersStatusBarHidden: Bool {
    return false
  }
  
  override var preferredStatusBarStyle: UIStatusBarStyle {
    return .lightContent
  }
  
  override var preferredStatusBarUpdateAnimation: UIStatusBarAnimation {
    return .fade
  }
}
