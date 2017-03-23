//
//  Injectable.swift
//  PlacesGame
//
//  Created by Alejandro Barros Cuetos on 23/03/2017.
//  Copyright © 2017 Filtercode Ltd. All rights reserved.
//

import Foundation

protocol Injectable: class {
  
  var locationService: LocationService! { get set }
  var gameService: GameService! { get set }
}
