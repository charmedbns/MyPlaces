//
//  MainViewController.swift
//  MyPlaces
//
//  Created by Лёпа on 01.05.2020.
//  Copyright © 2020 Lepa. All rights reserved.
//

import UIKit

class MainViewController: UITableViewController {
    
    let places = Place.getPlaces()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return places.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! CustomViewCell
        cell.nameLabel.text = places[indexPath.row].name
        cell.locationLabel.text = places[indexPath.row].location
        cell.typeLabel.text = places[indexPath.row].type
        let imageNamed = places[indexPath.row].image
        cell.imageOfPlace?.image = UIImage(named: imageNamed)
        cell.imageOfPlace?.layer.cornerRadius = cell.imageOfPlace.frame.height / 2
        cell.imageOfPlace?.clipsToBounds = true
        return cell
    }
    
    @IBAction func cancelAction(_ segue: UIStoryboardSegue){}
}
