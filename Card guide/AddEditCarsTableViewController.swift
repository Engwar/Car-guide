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
    
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        guard segue.identifier == "saveSegue" else { return }
        let producer = manufacturer.text ?? ""
        let kind = model.text ?? ""
        let ym = year.text ?? ""
        let frame = body.text ?? ""
        let overview = descript.text ?? ""
        
        car = Cars(manufacturer: producer, model: kind, year: ym, body: frame, description: overview)
    }
    
    @IBAction func textEditingChanged(_ sender: Any) {
        updateSaveButton()
    }
}
