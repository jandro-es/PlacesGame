//
//  NavigationBar.swift
//  PlacesGame
//
//  Created by Alejandro Barros Cuetos on 23/03/2017.
//  Copyright © 2017 Filtercode Ltd. All rights reserved.
//

import UIKit

final class NavigationBar: UINavigationBar {
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    commonInit()
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
    commonInit()
  }
  
  private func commonInit() {
    barTintColor = UIColor.placesDark
    tintColor = .white
    titleTextAttributes = ([NSFontAttributeName: UIFont.coolveticaRegular(of: UIFont.FontSize.navigationTitle), NSForegroundColorAttributeName: UIColor.placesWhite])
    setBackgroundImage(UIImage(), for: .default)
  }
}
