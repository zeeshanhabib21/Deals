//
//  ViewController.swift
//  Deals
//
//  Created by Apple on 12/08/2020.
//  Copyright © 2020 Apple. All rights reserved.
//

import UIKit
import SideMenu

class ViewController: UIViewController {
    let BurgerName = ["Giga bite","Giga bite","giga bite"]
    let Price = ["10","20","30"]
    let dealImage = [
        UIImage(named: "download1"),
        UIImage(named: "download2"),
        UIImage(named: "download3"),
    ]
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    //Mark: - SideMenu
    private let sideMenu = UISideMenuNavigationController(rootViewController: MenuController(with: ["Home","About","ContactUs"]))

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        sideMenu.leftSide = true
        SideMenuManager.default.menuLeftNavigationController = sideMenu
        SideMenuManager.default.menuAddPanGestureToPresent(toView: view)
        SideMenuManager.default.menuFadeStatusBar = false
    }
    
    @IBAction func didTapMenu()
    {
        present(sideMenu,animated: true)
    }


}


extension ViewController: UICollectionViewDelegate,UICollectionViewDataSource
{
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return BurgerName.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "dealCell", for: indexPath) as! CollectionViewCell
        cell.Name.text = BurgerName[indexPath.row]
        cell.Price.text = Price[indexPath.row]
        cell.collectionImages.image = dealImage[indexPath.row]
        cell.layer.cornerRadius = 10
        return cell
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
           let picDimension = self.view.frame.size.width / 1
           return CGSize(width: picDimension, height: picDimension)
        
       }
}


class MenuController: UITableViewController {
    
    private let menuItems: [String]
    
    //Mark: - intializer
    
    init(with menuItems: [String])
    {
        self.menuItems = menuItems
        super.init(nibName:nil,bundle:nil)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
       
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuItems.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = menuItems[indexPath.row]
        print(cell)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}



