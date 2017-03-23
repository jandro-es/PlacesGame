//
//  PlacesSearch.swift
//  PlacesGame
//
//  Created by Alejandro Barros Cuetos on 23/03/2017.
//  Copyright © 2017 Filtercode Ltd. All rights reserved.
//

import Foundation
import CoreLocation
import GooglePlaces

final class PlacesSearch {
  
  enum PlacesTypes: String {
    case restaurant
    case bar
  }
  
  fileprivate let apiKey: String
  fileprivate let searchUrl = "https://maps.googleapis.com/maps/api/place/nearbysearch/json?"
  
  init(apiKey: String) {
    self.apiKey = apiKey
  }
  
  func searchNearby(for location: CLLocationCoordinate2D, in distance: Int, type: PlacesTypes, completionHandler: @escaping (_ places: [Place]?, _ error: GameError?) -> Void) {
    let urlString = "\(searchUrl)location=\(location.latitude),\(location.longitude)&radius=\(distance)&key=\(apiKey)&type=\(type.rawValue)"
    let url = URL(string: urlString)
    let session = URLSession(configuration: URLSessionConfiguration.default)
    session.dataTask(with: url!) { (data, response, error) in
      if let error = error {
        completionHandler(nil, GameError.generic(error: error as NSError))
      } else {
        if let resp = response as? HTTPURLResponse, resp.statusCode != 200 {
          completionHandler(nil, GameError.status(code: resp.statusCode))
        } else {
          OperationQueue.main.addOperation {
            completionHandler(Place.parseJson(data!), nil)
          }
        }
      }
    }.resume()
  }
}
