//
//  LocationService.swift
//  PlacesGame
//
//  Created by Alejandro Barros Cuetos on 23/03/2017.
//  Copyright © 2017 Filtercode Ltd. All rights reserved.
//

import Foundation
import CoreLocation

final class LocationService: NSObject {
  
  private let locationManager: CLLocationManager = {
    let locationManager = CLLocationManager()
    locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
    return locationManager
  }()
  
  /// The last known location of the user, or nil if it cannot be determined.
  var lastKnownLocation: CLLocation?
  
  override init() {
    super.init()
    locationManager.delegate = self
  }
  
  /// Start the location service.
  func start() {
    locationManager.requestWhenInUseAuthorization()
    locationManager.startUpdatingLocation()
  }
  
  /// Stop the location service.
  func stop() {
    locationManager.stopUpdatingLocation()
  }
}

/// LocationService extension for location manager.
extension LocationService: CLLocationManagerDelegate {
  
  public func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    guard locations.isEmpty == false else {
      return
    }
    // Locations are in chronological order so we take the most recent location.
    lastKnownLocation = locations.last
    debugPrint(lastKnownLocation!)
  }
  
  func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
    debugPrint(error)
  }
}
