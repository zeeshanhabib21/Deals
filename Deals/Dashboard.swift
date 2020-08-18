//
//  Dashboard.swift
//  Deals
//
//  Created by Apple on 14/08/2020.
//  Copyright © 2020 Apple. All rights reserved.
//

import UIKit


class Dashboard: UIViewController,UITabBarDelegate
{
    
    
    @IBOutlet weak var FeaturedCollectionView: UICollectionView!
    let BurgerName = ["Burger","All in One","Zinger"]
      let Price = ["10","20","30"]
      let dealImage = [
          UIImage(named: "download1"),
          UIImage(named: "download2"),
          UIImage(named: "download3"),
      ]
    //Mark: - TabBarFunction

 func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
      if item.tag == 1 {
         let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
                 let secondVc = storyboard.instantiateViewController(withIdentifier: "DealCategories") as! DealCategories
            secondVc.modalPresentationStyle = .fullScreen
             present(secondVc, animated: true, completion: nil)
      }
      if item.tag == 2 {
          //Do something
      }
  }
    
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
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath)
        self.performSegue(withIdentifier: "dealDetailed", sender: indexPath)
    }
    
  
}

