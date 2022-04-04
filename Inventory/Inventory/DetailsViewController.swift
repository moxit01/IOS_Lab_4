//
//  DetailsViewController.swift
//  Inventory
//
//  Created by Cambrian on 2022-03-23.
//

import UIKit

class DetailsViewController: UIViewController {
    
    
    var itemList: ItemList!
    var items = [Item]()
    var rowIndex: Int!

    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var SKUField: UITextField!
    @IBOutlet weak var descField: UITextField!
    @IBOutlet weak var dateField: UIDatePicker!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if rowIndex != nil {
            itemList.decodesave()
            nameField.text = itemList.items[rowIndex].name
            SKUField.text = itemList.items[rowIndex].SKU
            descField.text = itemList.items[rowIndex].description
            dateField.date = itemList.items[rowIndex].dateAdded
            
        }
    }
    
    
    
    @IBAction func save(_ sender: Any) {
       
        if !nameField.text!.isEmpty && !SKUField.text!.isEmpty && !descField.text!.isEmpty {
        let update = Item(name: nameField.text!, SKU: SKUField.text!, description: descField.text!, dateAdded: dateField.date)
        itemList.addItem(item: update)
        self.navigationController?.popViewController(animated: true)
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
