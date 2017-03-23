//
//  PlaceCollectionViewCell.swift
//  PlacesGame
//
//  Created by Alejandro Barros Cuetos on 23/03/2017.
//  Copyright © 2017 Filtercode Ltd. All rights reserved.
//

import UIKit

final class PlaceCollectionViewCell: UICollectionViewCell {
  
  static let identifier = "PlaceCollectionViewCell"
  
  /// Outlets
  
  @IBOutlet weak var placeImage: UIImageView!
  @IBOutlet weak var hideLayer: UIView!
  
  /// Properties
  
  var placeId: String?
  
  override func prepareForReuse() {
    super.prepareForReuse()
    placeImage.image = nil
    hideLayer.alpha = 1.0
  }
}
