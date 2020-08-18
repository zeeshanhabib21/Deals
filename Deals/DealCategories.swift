//
//  DealCategories.swift
//  Deals
//
//  Created by Apple on 15/08/2020.
//  Copyright © 2020 Apple. All rights reserved.
//

import Foundation
import UIKit

struct DealCellData {
    var CatDealName: String!
    var CatAddress: String!
    var CatDistance: String!
}

class DealCategories: UIViewController {
    @IBOutlet weak var tableView:UITableView!
    
    var DealItems = [ "Jhon Deli","Chief","Mr Code"]
  let dealImage = [
      UIImage(named: "download1"),
      UIImage(named: "download2"),
      UIImage(named: "download3"),
  ]
    
    override func viewDidLoad() {
        tableView.separatorStyle = .none
    }
    
    
}

extension DealCategories: UITableViewDataSource,UITableViewDelegate
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DealItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DealsCell", for: indexPath) as! CategoryCell
        cell.CatImage.image = dealImage[indexPath.row]
        return cell
    }
    
    
}
