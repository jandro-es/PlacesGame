//
//  DeckLayout.swift
//  PlacesGame
//
//  Created by Alejandro Barros Cuetos on 23/03/2017.
//  Copyright © 2017 Filtercode Ltd. All rights reserved.
//

import UIKit

final class DeckLayout: UICollectionViewFlowLayout {
  
  let numberColumns = 2
  
  override init() {
    super.init()
    commonInit()
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    commonInit()
  }
  
  private func commonInit() {
    minimumLineSpacing = 0.0
    minimumInteritemSpacing = 0.0
    scrollDirection = .vertical
  }
  
  override var itemSize: CGSize {
    set {
      self.itemSize = newValue
    }
    get {
      let itemWidth = (self.collectionView!.frame.width - CGFloat(numberColumns - 1)) / CGFloat(numberColumns)
      return CGSize(width: itemWidth, height: itemWidth)
    }
  }
}
