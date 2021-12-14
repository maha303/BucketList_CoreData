//
//  ViewController.swift
//  BucketList_CoreData
//
//  Created by Maha saad on 09/05/1443 AH.
//

import UIKit
import CoreData

class BucketListViewController: UITableViewController ,AddItemTableViewControllerDelegate {
    
   
     
     var items = [BucketListItem]()
     
     let managedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchAllItems()
    
    }
     
     override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         
         return items.count
         
     }
     override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
         let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath)

         cell.textLabel?.text = items[indexPath.row].text!
        
         return cell
     }
     
     
     override func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
         performSegue(withIdentifier: "Edit", sender: indexPath)
     }
    
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
         let ite = items[indexPath.row]
         managedObjectContext.delete(ite)
         do{
             try managedObjectContext.save()
             
         }catch{
             print("\(error)")
         }
         items.remove(at: indexPath.row)
         tableView.reloadData()
     }
    
   
       override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
           
       
           if sender is UIBarButtonItem {
                  let navigationController = segue.destination as! UINavigationController
                  let controller = navigationController.topViewController as! AddItemViewController
               controller.delegate = self
                  
                  
              }else if sender is IndexPath
           
           {
                  
                  let navigationController = segue.destination as! UINavigationController
                  let controller = navigationController.topViewController as! AddItemViewController
               controller.delegate = self
                  let indexpath = sender as! NSIndexPath
                  let item = items[indexpath.row]
                  controller.item = item.text!
                  controller.indexpath = indexpath
                  
              }
         }

     
   
    
    func fetchAllItems(){
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "BucketListItem")
        do{
            let result = try managedObjectContext.fetch(request)
             items = result as! [BucketListItem]
        }catch{
            print("\(error)")
        }
    }
    
    func addItemTableViewControllerDelegate(_ controller: AddItemViewController, didFinishAddingItem item: String , at indexPath : NSIndexPath?) {
        if let ip = indexPath {
            
          let ite = items[ip.row]
            ite.text = item
        }else {
            let it = NSEntityDescription.insertNewObject(forEntityName: "BucketListItem", into: managedObjectContext) as! BucketListItem
            it.text = item
            items.append(it)
        }
        
        do{
            try managedObjectContext.save()
            
        }catch{
            print("\(error)")
        }
        
        dismiss(animated: true, completion: nil)
               tableView.reloadData()
    }
    
    func addItemTableViewControllerDelegate(_ controller: AddItemViewController, didPressCancelButton button: UIBarButtonItem) {
        
        dismiss(animated: true, completion: nil)
        
    }


}

