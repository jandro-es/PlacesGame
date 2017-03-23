//
//  GameViewModel.swift
//  PlacesGame
//
//  Created by Alejandro Barros Cuetos on 23/03/2017.
//  Copyright © 2017 Filtercode Ltd. All rights reserved.
//

import UIKit

final class GameViewModel {
  
  fileprivate let locationService: LocationService
  
  init(_ locationService: LocationService) {
    self.locationService = locationService
  }
  
  func fetchClosest(completionHandler: (_ error: GameError?) -> Void) {
    guard let location = locationService.lastKnownLocation else {
      completionHandler(GameError.noLocation)
      return
    }
  }
}

