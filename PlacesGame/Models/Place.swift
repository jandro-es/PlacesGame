//
//  Place.swift
//  PlacesGame
//
//  Created by Alejandro Barros Cuetos on 23/03/2017.
//  Copyright © 2017 Filtercode Ltd. All rights reserved.
//

import Foundation

struct Place: JsonObject {
  
  let id: String
  let name: String
  let rating: Double
  
  fileprivate struct DataKeys {
    static let id = "place_id"
    static let name = "name"
    static let rating = "rating"
    static let rootNode = "results"
  }
  
  init?(json: Json?) {
    guard let json = json,
      let id = json[DataKeys.id] as? String,
      let name = json[DataKeys.name] as? String,
      let rating = json[DataKeys.rating] as? Double
      else {
        return nil
    }
    self.id = id
    self.name = name
    self.rating = rating
  }
}

extension Place: CustomStringConvertible, CustomDebugStringConvertible {
  var description: String {
    return "Place:\nid: \(id)\nname: \(name)\nrating: \(rating)\n\n"
  }
  
  var debugDescription: String {
    return "Place:\nid: \(id)\nname: \(name)\nrating: \(rating)\n\n"
  }
}

extension Place {
  
  /// Maps Data to a collection of Places
  static func parseJson(_ data: Data) -> [Place]? {
    guard let result = try? JSONSerialization.jsonObject(with: data, options: []) as? Json else {
      return nil
    }
    guard let jsonCollection = result![Place.DataKeys.rootNode] as? JsonCollection else {
      return nil
    }
    var places = [Place]()
    for json in jsonCollection {
      if let place = Place(json: json) {
        places.append(place)
      }
    }
    return places
  }
}

func == (lhs: Place, rhs: Place) -> Bool {
  return lhs.id == rhs.id
}
