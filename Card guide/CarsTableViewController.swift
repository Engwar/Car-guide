//
//  CarsTableViewController.swift
//  Card guide
//
//  Created by Igor Shelginskiy on 10/7/19.
//  Copyright © 2019 Igor Shelginskiy. All rights reserved.
//

import UIKit

class CarsTableViewController: UITableViewController {
    
    var cars = [Cars(manufacturer: "Skoda",
                     model: "Rapid",
                     year: "2015",
                     body: "sedan",
                     description: "car mileage - 80 000 mile, excellent    condition"),
                Cars(manufacturer: "General Motors",
                     model: "936 Cadillac V-16",
                     year: "1938", body: "converible coupe",
                     description: "It's a rare car, only for collection"),
                Cars(manufacturer: "Ford",
                     model: "Mustang",
                     year: "1966",
                     body: "fastback",
                     description: "In good condition, on drive, tuning: gear, computer access")]

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.leftBarButtonItem = editButtonItem

    }

    // MARK: - Table view data source

//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cars.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "carsCell", for: indexPath)
        let car = cars[indexPath.row]
        cell.textLabel?.text = "\(car.manufacturer) \(car.model)"
        cell.detailTextLabel?.text = "\(car.body) \(car.year) y.m."
        cell.showsReorderControl = true
        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            cars.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }

    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
//        let removeCar = cars.remove(at: fromIndexPath.row)
//        cars.insert(removeCar, at: to.row)
//        tableView.reloadData()
    }

    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }

    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "editCar" {
            let indexPath = tableView.indexPathForSelectedRow!
            let car = cars[indexPath.row]
            let naviController = segue.destination as! UINavigationController
            let addEditCarTVC = naviController.topViewController as! AddEditCarsTableViewController
            addEditCarTVC.car = car
            addEditCarTVC.navigationItem.title = "Editing car info"
        }
    }
    
    @IBAction func unwind(segue: UIStoryboardSegue) {
        
    }

}
