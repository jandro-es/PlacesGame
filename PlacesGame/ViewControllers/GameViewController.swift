//
//  GameViewController.swift
//  PlacesGame
//
//  Created by Alejandro Barros Cuetos on 23/03/2017.
//  Copyright © 2017 Filtercode Ltd. All rights reserved.
//

import UIKit

final class GameViewController: UIViewController, Injectable {
  
  static let identifier = "GameViewController"
  
  /// Injected Properties
  
  var locationService: LocationService!
  
  /// Private properties
  
  fileprivate lazy var modelView: GameViewModel = {
    return GameViewModel(self.locationService)
  }()
  
  fileprivate var places = [Place]() {
    didSet {
      placesCollection.reloadData()
    }
  }
  
  fileprivate var selectedPlace = [String]()
  fileprivate var matches = [String]()
  
  /// Outlets
  @IBOutlet weak var placesCollection: UICollectionView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupView()
    modelView.fetchClosest { (places, error) in
      if let error = error {
        debugPrint(error.localizedDescription)
      } else {
        self.places = places!
      }
    }
  }
  
  // MARK: - Private methods
  
  fileprivate func setupView() {
    placesCollection.delegate = self
    placesCollection.dataSource = self
    placesCollection.collectionViewLayout = DeckLayout()
  }
  
  @objc fileprivate func clearSelections() {
    selectedPlace = [String]()
    placesCollection.reloadData()
  }
  
  @objc fileprivate func clearMatches() {
    matches.append(selectedPlace.first!)
    selectedPlace = [String]()
    placesCollection.reloadData()
    checkEndCondition()
  }
  
  fileprivate func checkEndCondition() {
    guard matches.count == GameViewModel.numberOfPlaces else {
      return
    }
    
  }
}

extension GameViewController: UICollectionViewDelegate {
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    let place = places[indexPath.row]
    if selectedPlace.contains(place.id) {
      selectedPlace.append(place.id)
      collectionView.reloadItems(at: [indexPath])
      perform(#selector(clearMatches), with: nil, afterDelay: 1.0)
    } else {
      selectedPlace.append(place.id)
      collectionView.reloadItems(at: [indexPath])
      if selectedPlace.count > 1 {
        perform(#selector(clearSelections), with: nil, afterDelay: 1.0)
      }
    }
  }
}

extension GameViewController: UICollectionViewDataSource {
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return places.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let place = places[indexPath.row]
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PlaceCollectionViewCell.identifier, for: indexPath) as! PlaceCollectionViewCell
    cell.placeId = place.id
    if matches.contains(place.id) {
      cell.placeImage.alpha = 0.0
      cell.hideLayer.alpha = 0.0
    } else {
      modelView.fetchImage(for: place.id) { (image, error) in
        if error == nil {
          cell.placeImage.image = image
          cell.placeImage.alpha = 1.0
        }
      }
      if selectedPlace.contains(place.id) {
        cell.hideLayer.alpha = 0.0
      }
    }
    return cell
  }
}
