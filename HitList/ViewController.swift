//
//  ViewController.swift
//  HitList
//
//  Created by Alper on 02/03/16.
//  Copyright © 2016 allperr. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController ,UITableViewDataSource {
    //MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: - Modal
    // it used to be var names = [String]()
    var people = [NSManagedObject]()
    
    
    //MARK: - addName Action
    @IBAction func addName(sender: AnyObject) {
        
        let alert = UIAlertController(title: "New Name", message: "", preferredStyle: .Alert)
        
        let saveAction = UIAlertAction(title: "Save", style: .Default) { (action : UIAlertAction) -> Void in
            
            let textField = alert.textFields?.first
            self.saveName(textField!.text!)
            
            self.tableView.reloadData()
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel) { (action: UIAlertAction) -> Void in
        }
        
        //Add textfield to an alert
        alert.addTextFieldWithConfigurationHandler { (textfield : UITextField) -> Void in
            textfield.placeholder = "Add a new name"
        }
        
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        
        presentViewController(alert, animated: true, completion: nil)
        
        
    }
    
    //MARK: - View Controller Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    
        title = "\"The List\""
    }

    //MARK: - UITableViewDataSource
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return people.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as UITableViewCell
        
        let person = people[indexPath.row]
        
        cell.textLabel?.text = person.valueForKey("name") as? String
        
        return cell
    }
    //MARK: - saveName Function
    
    func saveName (name : String) {
        
    //1 - Access ManagedObjectContext which lives in AppDelegate, to access it you must get reference of AppDelegate first
    let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
    
    let managedContext = appDelegate.managedObjectContext
        
    //2 - Create a new managedObject and insert it into a managed object context . 
    let entity  = NSEntityDescription.entityForName("Person", inManagedObjectContext: managedContext)
    
    let person = NSManagedObject(entity: entity!, insertIntoManagedObjectContext: managedContext)
    
    //3 - With an NSManagedObject , set the name attribute using key-value coding
    person.setValue(name, forKey: "name")
    
    //4 - Commit the changes to person and save to disk by calling save on the managed object context
    
    do {
        try managedContext.save()
        people.append(person)//to show person when tableView reloads
    }catch let error as NSError{
        print("Could not save \(error),\(error.userInfo)")
    }
        
    
        
    }
    
    
    
}

