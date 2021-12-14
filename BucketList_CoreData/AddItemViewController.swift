//
//  AddItemViewController.swift
//  BucketList_CoreData
//
//  Created by Maha saad on 09/05/1443 AH.
//

import UIKit

class AddItemViewController: UITableViewController {
    
    var item: String?
    
    var indexpath: NSIndexPath?
    
    weak var delegate: AddItemTableViewControllerDelegate?

    @IBOutlet weak var itemTextField: UITextField!
    
    @IBAction func cancelBarButtonPressed(_ sender: UIBarButtonItem) {
        
        delegate?.addItemTableViewControllerDelegate(self, didPressCancelButton: sender)
    }
    @IBAction func doneBarButtonPressed(_ sender: UIBarButtonItem) {
        
        delegate?.addItemTableViewControllerDelegate(self, didFinishAddingItem: itemTextField.text! , at: indexpath)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        itemTextField.text = item

        
    }


    
}
