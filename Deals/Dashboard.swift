//
//  Dashboard.swift
//  Deals
//
//  Created by Apple on 14/08/2020.
//  Copyright © 2020 Apple. All rights reserved.
//

import UIKit


class Dashboard: UIViewController
{
    

    @IBOutlet weak var FeaturedCollectionView: UICollectionView!
    let BurgerName = ["Giga bite","Giga bite","giga bite"]
      let Price = ["10","20","30"]
      let dealImage = [
          UIImage(named: "download1"),
          UIImage(named: "download2"),
          UIImage(named: "download3"),
      ]
    
    
    
    
}


extension Dashboard: UICollectionViewDelegate,UICollectionViewDataSource
{
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return BurgerName.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FeaturedDealCell", for: indexPath) as! FeaturedDealViewCell
        cell.DealName.text = BurgerName[indexPath.row]
        cell.DealPrice.text = Price[indexPath.row]
        cell.DealImage.image = dealImage[indexPath.row]
        return cell
    }
}
