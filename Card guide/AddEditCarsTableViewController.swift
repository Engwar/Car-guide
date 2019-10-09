//
//  AddEditCarsTableViewController.swift
//  Card guide
//
//  Created by Igor Shelginskiy on 10/8/19.
//  Copyright © 2019 Igor Shelginskiy. All rights reserved.
//

import UIKit

class AddEditCarsTableViewController: UITableViewController {
    
    var car = Cars(manufacturer: "", model: "", year: "", body: "", description: "")

    @IBOutlet weak var manufacturer: UITextField!
    @IBOutlet weak var model: UITextField!
    @IBOutlet weak var year: UITextField!
    @IBOutlet weak var body: UITextField!
    @IBOutlet weak var descript: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        updateSaveButton()
    }

    func updateUI() {
        manufacturer.text = car.manufacturer
        model.text = car.model
        year.text = car.year
        body.text = car.body
        descript.text = car.description
    }    
  
    func updateSaveButton() {
        let producer = manufacturer.text ?? ""
        let kind = model.text ?? ""
        navigationItem.rightBarButtonItem?.isEnabled = !producer.isEmpty && !kind.isEmpty
    }
    
    func saveCar() {
        car.manufacturer = manufacturer.text ?? ""
        car.model = model.text ?? ""
        car.year = year.text ?? ""
        car.body = body.text ?? ""
        car.description = descript.text ?? ""
    }

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        saveCar()
    }
    
    @IBAction func textEditingChanged(_ sender: Any) {
        updateSaveButton()
    }
}
