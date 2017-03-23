//
//  AppDelegate.swift
//  PlacesGame
//
//  Created by Alejandro Barros Cuetos on 23/03/2017.
//  Copyright © 2017 Filtercode Ltd. All rights reserved.
//

import UIKit
import Fabric
import Crashlytics
import Firebase
import GooglePlaces

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?
  fileprivate var locationService: LocationService!

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    startExternalServices()
    startInternalServices()
    
    return true
  }
  
  private func startExternalServices() {
    // Firebase
    FIRApp.configure()
    // Fabric
    Fabric.with([Crashlytics.self])
    // Google Places
    GMSPlacesClient.provideAPIKey(Config.placesKey)
  }
  
  private func startInternalServices() {
    locationService = LocationService()
  }
}
