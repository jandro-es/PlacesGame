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
  var gameService: GameService!
  
  /// Private properties
  
  fileprivate lazy var modelView: GameViewModel = {
    return GameViewModel(self.locationService, self.gameService)
  }()
  
  fileprivate var places = [Place]() {
    didSet {
      placesCollection.reloadData()
    }
  }
  
  fileprivate var selectedPlace = [String]()
  fileprivate var matches = [String]()
  fileprivate var hits = 0 {
    didSet {
      self.hitsLabel.text = "\(hits)"
    }
  }
  
  /// Outlets
  @IBOutlet weak var placesCollection: UICollectionView!
  @IBOutlet weak var hitsLabel: UILabel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupView()
    loadPlaces()
  }
  
  // MARK: - Actions
  
  @IBAction func restartAction(_ sender: UIButton) {
    reloadGame()
  }
  
  @IBAction func cancelAction(_ sender: UIButton) {
    exitToStart()
  }
  
  // MARK: - Private methods
  
  fileprivate func setupView() {
    placesCollection.delegate = self
    placesCollection.dataSource = self
    placesCollection.collectionViewLayout = DeckLayout()
  }
  
  fileprivate func loadPlaces() {
    modelView.fetchClosest { (places, error) in
      if let error = error {
        debugPrint(error.localizedDescription)
      } else {
        self.places = places!
      }
    }
  }
  
  @objc fileprivate func clearSelections() {
    selectedPlace = [String]()
    placesCollection.reloadData()
    placesCollection.isUserInteractionEnabled = true
  }
  
  @objc fileprivate func clearMatches() {
    matches.append(selectedPlace.first!)
    selectedPlace = [String]()
    placesCollection.reloadData()
    placesCollection.isUserInteractionEnabled = true
    checkEndCondition()
  }
  
  fileprivate func reloadGame() {
    matches = [String]()
    selectedPlace = [String]()
    hits = 0
    loadPlaces()
  }
  
  fileprivate func exitToStart() {
    let _ = navigationController?.popViewController(animated: true)
  }
  
  fileprivate func presentOptions() {
    let contr = UIAlertController(title: "Match finished", message: "Congratulations, you've finished the match", preferredStyle: .alert)
    contr.addAction(UIAlertAction(title: "Play again", style: .default, handler: { (_) in
      self.reloadGame()
    }))
    contr.addAction(UIAlertAction(title: "Exit", style: .default, handler: { (_) in
      self.exitToStart()
    }))
    present(contr, animated: true, completion: nil)
  }
  
  fileprivate func presentEnterName() {
    let contr = UIAlertController(title: "Match finished", message: "Congratulations, you've finished the match with a top ten score", preferredStyle: .alert)
    contr.addTextField()
    let submitAction = UIAlertAction(title: "Submit", style: .default) { [unowned contr] _ in
      let nameField = contr.textFields![0]
      guard let name = nameField.text else {
        return
      }
      self.modelView.addTopTen(with: name, score: self.hits)
      self.presentOptions()
    }
    contr.addAction(submitAction)
    present(contr, animated: true, completion: nil)
  }
  
  fileprivate func checkEndCondition() {
    guard matches.count == GameViewModel.numberOfPlaces else {
      return
    }
    if modelView.isTopTen(score: hits) {
      presentEnterName()
    } else {
      presentOptions()
    }
  }
}

extension GameViewController: UICollectionViewDelegate {
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    let place = places[indexPath.row]
    if selectedPlace.contains(place.id) {
      selectedPlace.append(place.id)
      collectionView.reloadItems(at: [indexPath])
      collectionView.isUserInteractionEnabled = false
      perform(#selector(clearMatches), with: nil, afterDelay: 1.0)
    } else {
      selectedPlace.append(place.id)
      collectionView.reloadItems(at: [indexPath])
      if selectedPlace.count > 1 {
        hits += 1
        collectionView.isUserInteractionEnabled = false
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
