//
//  DetailsViewController.swift
//  Inventory
//
//  Created by Cambrian on 2022-03-23.
//

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var SKUField: UITextField!
    @IBOutlet weak var descField: UITextField!
    @IBOutlet weak var dateField: UIDatePicker!
    
    var selectedIndex: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        if let ind = selectedIndex
        {
            let item = ItemList.items[ind]
            nameField.text = item.name
            SKUField.text = item.SKU
            descField.text = item.description
            dateField.setDate(item.dateAdded!, animated: false)
        }
        

        
    }
    
    
    
    @IBAction func save(_ sender: Any) {
        guard let name = nameField.text, let sku = SKUField.text, let desc = descField.text else
        {
            return
        }

        
        let item = Item(name: name, SKU: sku, description: desc, dateAdded: dateField.date)
        ItemList.addItem(item: item)
        self.navigationController?.popViewController(animated: true)
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
