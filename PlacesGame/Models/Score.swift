//
//  Score.swift
//  PlacesGame
//
//  Created by Alejandro Barros Cuetos on 23/03/2017.
//  Copyright © 2017 Filtercode Ltd. All rights reserved.
//

import Foundation

final class Score: NSObject, NSCoding {
  
  var name: String
  var score: Int
  
  init(name: String, score: Int) {
    self.name = name
    self.score = score
  }
  
  required init(coder aDecoder: NSCoder) {
    if let name = aDecoder.decodeObject(forKey: "name") as? String {
      self.name = name
    } else {
      self.name = ""
    }
    self.score = aDecoder.decodeInteger(forKey: "score")
  }
  
  func encode(with aCoder: NSCoder) {
    aCoder.encode(name, forKey: "name")
    aCoder.encode(score, forKey: "score")
  }
}
