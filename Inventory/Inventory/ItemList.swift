//
//  ItemList.swift
//  Inventory
//
//  Created by Cambrian on 2022-03-23.
//

import Foundation



class ItemList{
    var items = [Item]()
    
    func addItem(item: Item){
        // complete code
        
       decodesave()
       items.append(item)
       encodesave()
         
    }
    
    func deleteItem(row: Int){
        // complete code
       decodesave()
      items.remove(at: row)
      encodesave()

        
    }
    
  func moveItem(from: Int, to: Int){
        // complete code
        let itemFromMove = items[from]
        let itemToMove = items[to]
        items[from] = itemToMove
        items[to] = itemFromMove
        encodesave()
        
    }
    
    
    func encodesave(){
       do {
           let encoder = JSONEncoder()
           let encodeData = try encoder.encode(items)
           UserDefaults.standard.set(encodeData, forKey: "item")
       } catch {
           print("error")
       }
   }
   
    func decodesave(){
       do{
           if let encodedata = UserDefaults.standard.object(forKey: "item") as? Data{
               do {
                   let decoder = JSONDecoder()
                   items = try decoder.decode([Item].self, from: encodedata)
               } catch {
                   print("Unable to Decode Note (\(error))")
               }
           }
       }
   }
    

    
}
