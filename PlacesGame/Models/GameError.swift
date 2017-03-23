//
//  GameError.swift
//  PlacesGame
//
//  Created by Alejandro Barros Cuetos on 23/03/2017.
//  Copyright © 2017 Filtercode Ltd. All rights reserved.
//

import Foundation

/// Different error states for the game
///
/// - noLocation: No current location is available
enum GameError: Error {
  case noLocation
}
