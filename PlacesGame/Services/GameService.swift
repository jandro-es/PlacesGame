//
//  GameService.swift
//  PlacesGame
//
//  Created by Alejandro Barros Cuetos on 23/03/2017.
//  Copyright © 2017 Filtercode Ltd. All rights reserved.
//

import Foundation

final class GameService {
 
  fileprivate var topTen = [Score]()
  
  func addTopTen(_ score: Score) {
    topTen.append(score)
    topTen = Array(topTen.sorted(by: { $0.score < $1.score })[0..<min(10, topTen.count)])
  }
  
  func isTopTen(_ value: Int) -> Bool {
    guard !topTen.isEmpty else {
      return true
    }
    return value < topTen.last!.score
  }
  
  func scores() -> [Score] {
    return topTen
  }
}
