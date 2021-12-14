//
//  AddItemTableViewControllerDelegate.swift
//  BucketList_CoreData
//
//  Created by Maha saad on 09/05/1443 AH.
//

import UIKit
protocol AddItemTableViewControllerDelegate : AnyObject {
    
    func addItemTableViewControllerDelegate (_ controller : AddItemViewController , didFinishAddingItem item: String , at indexPath:NSIndexPath?)
    func addItemTableViewControllerDelegate (_ controller : AddItemViewController , didPressCancelButton button: UIBarButtonItem)
    
    
}
