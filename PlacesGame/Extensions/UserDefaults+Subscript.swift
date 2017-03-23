//
//  UserDefaults+Subscript.swift
//  PlacesGame
//
//  Created by Alejandro Barros Cuetos on 23/03/2017.
//  Copyright © 2017 Filtercode Ltd. All rights reserved.
//

import Foundation

struct UserDefaultsKey<Value>: RawRepresentable {
  
  typealias RawValue = String
  let rawValue: RawValue
  
  init (_ key: String) {
    rawValue = key
  }
  
  init (rawValue: RawValue) {
    self.rawValue = rawValue
  }
}

extension UserDefaults {
  
  subscript(key: UserDefaultsKey<Bool>) -> Bool {
    set { set(newValue, forKey: key.rawValue) }
    get { return bool(forKey: key.rawValue) }
  }
  
  subscript(key: UserDefaultsKey<Float>) -> Float {
    set { set(newValue, forKey: key.rawValue) }
    get { return float(forKey: key.rawValue) }
  }
  
  subscript(key: UserDefaultsKey<Double>) -> Double {
    set { set(newValue, forKey: key.rawValue) }
    get { return double(forKey: key.rawValue) }
  }
  
  subscript(key: UserDefaultsKey<Int>) -> Int {
    set { set(newValue, forKey: key.rawValue) }
    get { return integer(forKey: key.rawValue) }
  }
  
  subscript(key: UserDefaultsKey<String>) -> String? {
    set { set(newValue, forKey: key.rawValue) }
    get { return string(forKey: key.rawValue) }
  }
  
  subscript(key: UserDefaultsKey<[[String:Int]]>) -> [[String:Int]]? {
    set { set(newValue, forKey: key.rawValue) }
    get { return object(forKey: key.rawValue) as? [[String:Int]] }
  }
}
