//
//  GameViewModel.swift
//  PlacesGame
//
//  Created by Alejandro Barros Cuetos on 23/03/2017.
//  Copyright © 2017 Filtercode Ltd. All rights reserved.
//

import UIKit
import GooglePlaces

final class GameViewModel {
  
  fileprivate let locationService: LocationService
  fileprivate let placesSearch: PlacesSearch
  
  static let numberOfPlaces = 4
  
  init(_ locationService: LocationService) {
    self.locationService = locationService
    self.placesSearch = PlacesSearch(apiKey: Config.placesKey)
  }
  
  func fetchClosest(completionHandler: @escaping (_ places: [Place]?, _ error: GameError?) -> Void) {
    guard let location = locationService.lastKnownLocation else {
      completionHandler(nil, GameError.noLocation)
      return
    }
    
    placesSearch.searchNearby(for: location.coordinate, in: 1000, type: .restaurant) { (places, error) in
      if let error = error {
        completionHandler(nil, GameError.generic(error: error as NSError))
      } else {
        var gamePlaces = Array(places!.sorted(by: { $0.rating >= $1.rating })[0..<GameViewModel.numberOfPlaces])
        gamePlaces += gamePlaces
        completionHandler(gamePlaces.shuffled(), nil)
      }
    }
  }
  
  func fetchImage(for placeId: String, completionHandler: @escaping (UIImage?, Error?) -> Void) {
    GMSPlacesClient.shared().lookUpPhotos(forPlaceID: placeId) { (imagesList, error) in
      if let error = error {
        completionHandler(nil, error)
      } else {
        if let results = imagesList?.results, !results.isEmpty {
          GMSPlacesClient.shared().loadPlacePhoto(results.first!, callback: { (image, error) in
            if let error = error {
              completionHandler(nil, error)
            } else {
              completionHandler(image, nil)
            }
          })
        } else {
          completionHandler(UIImage(named: "noimage"), nil)
        }
      }
    }
  }
}
