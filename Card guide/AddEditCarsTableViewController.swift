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
    @IBOutlet weak var descript: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }



    func updateUI() {
        manufacturer.text = car.manufacturer
        model.text = car.model
        year.text = car.year
        body.text = car.body
        descript.text = car.description
    }
    
  
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }


    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
