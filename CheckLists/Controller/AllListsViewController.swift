//
//  AllListsTableViewController.swift
//  CheckLists
//
//  Created by Md Sifat on 2/4/20.
//  Copyright © 2020 Md Sifat. All rights reserved.
//

import UIKit

class AllListsViewController: UITableViewController {
    
    var checkList = [Checklist]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let item1 = Checklist()
        item1.checklistName = "Birthdays"
        checkList.append(item1)
        let item2 = Checklist()
        item2.checklistName = "Groceries"
        checkList.append(item2)
        let item3 = Checklist()
        item3.checklistName = "Cool Apps"
        checkList.append(item3)
        let item4 = Checklist()
        item4.checklistName = "To Do"
        checkList.append(item4)


    }


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 4
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "checklistCell", for: indexPath)
       cell.textLabel?.text = "\(indexPath.row)"
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showChecklist", sender: nil)
    }



}
