//
//  CarsTableViewController.swift
//  Card guide
//
//  Created by Igor Shelginskiy on 10/7/19.
//  Copyright © 2019 Igor Shelginskiy. All rights reserved.
//

import UIKit

class CarsTableViewController: UITableViewController {
    
    var cars: [Cars] = [
//Cars(manufacturer: "Skoda",
//                     model: "Rapid",
//                     year: "2015",
//                     body: "sedan",
//                     description: "car mileage - 80 000 mile, excellent condition"),
//                Cars(manufacturer: "General Motors",
//                     model: "936 Cadillac V-16",
//                     year: "1938", body: "converible coupe",
//                     description: "It's a rare car, only for collection"),
//                Cars(manufacturer: "Ford",
//                     model: "Mustang",
//                     year: "1966",
//                     body: "fastback",
//                     description: "In good condition, on drive, tuning: gear, computer access")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.leftBarButtonItem = editButtonItem
        cars = loadFile() ?? []
    }
    
    func saveFile() {
        let documentDir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let archURL = documentDir.appendingPathComponent("data").appendingPathExtension("plist")
        let propListEnc = PropertyListEncoder()
        let encodedCars = try? propListEnc.encode(cars)
        try? encodedCars?.write(to: archURL, options: .noFileProtection)
    }
    
    func loadFile() -> [Cars]? {
        let documentDir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let archURL = documentDir.appendingPathComponent("data").appendingPathExtension("plist")
        guard let data = try? Data(contentsOf: archURL) else { return nil }
        let propListDec = PropertyListDecoder()
        guard let cars = try? propListDec.decode([Cars].self, from: data) else { return nil }
        return cars
    }

    // MARK: - Table view data source

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

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            cars.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
      }
        saveFile()
    }

    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
         let removeCar = cars.remove(at: fromIndexPath.row)
        cars.insert(removeCar, at: to.row)
        tableView.reloadData()
        saveFile()
    }

    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
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
        guard segue.identifier == "saveSegue" else { return }
        let vc = segue.source as! AddEditCarsTableViewController
        let car = vc.car
        if let indexPath = tableView.indexPathForSelectedRow {
            cars[indexPath.row] = car
            tableView.reloadRows(at: [indexPath], with: .automatic)
        } else {
            let indexPath = IndexPath(row: cars.count, section: 0)
            cars.append(car)
            tableView.insertRows(at: [indexPath], with: .automatic)
        }
        saveFile()
    }
}
