//
//  ViewController.swift
//  MVCSwift
//
//  Created by Rajeev Sharma on 2015-03-13.
//  Copyright (c) 2015 Rajeev. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {


    @IBOutlet weak var tableView: UITableView!
    var people = Array<Person>()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        people.append(Person(name: "Alice", job: "Manager", image: UIImage(named: "1.png")))
        people.append(Person(name: "Bob", job: "UX Designer", image:UIImage(named: "1.png")))
        people.append(Person(name: "Charlie", job: "Software Developer", image: UIImage(named: "1.png")))
        people.append(Person(name: "Dan", job: "IT Ops", image: UIImage(named: "1.png")))
        people.append(Person(name: "Florian", job: "Senior Developer", image: nil))
        people.append(Person(name: "Henry", job: "Sales Associate", image: UIImage(named: "1.png")))
        people.append(Person(name: "Victor", job: "Head of Sales", image: nil))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func addPerson(sender: AnyObject) {
    
        people.append(Person(name: "New Employee", job: nil, image: nil))
    
        self.tableView .beginUpdates()
        let row = people.count - 1
        var indexPath = NSIndexPath(forRow: row, inSection: 0)
        self.tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Left)
        self.tableView.endUpdates()
        
    }
    
    
    @IBAction func deletePerson(sender: AnyObject) {
    
        self.tableView .setEditing(!self.tableView.editing, animated: true)
    
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let person = people[indexPath.row]
        var optCell = tableView.dequeueReusableCellWithIdentifier("PersonCell") as UITableViewCell?
        
        if (optCell == nil) {
            optCell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "PersonCell")
        }
        
        let cell = optCell!
        cell.textLabel?.text = person.name
        cell.detailTextLabel?.text = person.jobTitle
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return people.count
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        self.tableView.beginUpdates()
        people.removeAtIndex(indexPath.row)
        self.tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Fade)
        self.tableView.endUpdates()
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        var viewController = UIViewController()
        
        let person = people[indexPath.row]
        
        viewController.title = person.name
        viewController.view.backgroundColor = UIColor.grayColor()
        
        // Add person card to the view controller's view programmatically
        var personCard = PersonCard(frame: CGRect(x: 20, y: 0, width: self.view.frame.width, height: self.view.frame.height))
        personCard.backgroundColor = UIColor.grayColor()
        
        // Set Person card attributes
        personCard.name.text = person.name
        personCard.jobLabel.text = person.jobTitle
        personCard.imageView.image = person.imageView.image
        
        viewController.view.addSubview(personCard)

        self.navigationController?.pushViewController(viewController, animated: true)
        
    }
}

