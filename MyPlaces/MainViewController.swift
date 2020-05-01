//
//  MainViewController.swift
//  MyPlaces
//
//  Created by Лёпа on 01.05.2020.
//  Copyright © 2020 Lepa. All rights reserved.
//

import UIKit

class MainViewController: UITableViewController {
    
    let restaurantNames = ["Restor One",
                           "Restor Two",
                           "Restor Three",
                           "Restor Four",
                           "Restor Five"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurantNames.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        cell.textLabel?.text = restaurantNames[indexPath.row]
        let imageNamed = restaurantNames[indexPath.row]
        cell.imageView?.image = UIImage(named: imageNamed)
        return cell
    }
}

