//
//  LeaderboardViewController.swift
//  PlacesGame
//
//  Created by Alejandro Barros Cuetos on 23/03/2017.
//  Copyright © 2017 Filtercode Ltd. All rights reserved.
//

import UIKit

final class LeaderboardViewController: UIViewController {
  
  static let identifier = "LeaderboardViewController"
  
  // Injected Properties
  var gameService: GameService!
  
  /// Outlets
  @IBOutlet weak var toptenTableView: UITableView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupView()
  }
  
  fileprivate func setupView() {
    toptenTableView.dataSource = self
    toptenTableView.tableFooterView = UIView()
  }
  
  // Actions
  
  @IBAction func close(_ sender: UIButton) {
    let _ = navigationController?.popViewController(animated: true)
  }
}

extension LeaderboardViewController: UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return gameService.scores().count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let score = gameService.scores()[indexPath.row]
    let cell = tableView.dequeueReusableCell(withIdentifier: LeaderboardTableViewCell.identifier, for: indexPath) as! LeaderboardTableViewCell
    let attrString = NSMutableAttributedString(string: "\(score.name) ", attributes: [NSFontAttributeName: UIFont.latoHeavy(of: UIFont.FontSize.title), NSForegroundColorAttributeName: UIColor.placesWhite])
    attrString.append(NSAttributedString(string: "#\(score.score)", attributes: [NSFontAttributeName: UIFont.latoBold(of: UIFont.FontSize.title), NSForegroundColorAttributeName: UIColor.filtercodeYellow]))
    cell.playerLine.attributedText = attrString
    return cell
  }
}
