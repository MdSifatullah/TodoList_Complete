//
//  ViewController.swift
//  CheckLists
//
//  Created by Md Sifat on 1/16/20.
//  Copyright © 2020 Md Sifat. All rights reserved.
//

import UIKit
var items = [ChecklistItem]()

class ChecklistsViewController: UITableViewController, AddItemViewControllerDelegate {
    func addItemViewControllerDidCancel(_ controller: AddItemTableViewController) {
        navigationController?.popViewController(animated: true)
    }
    
    func addItemViewController(_ conroller: AddItemTableViewController, didFinishAdd item: ChecklistItem) {
        
        let newIndex = items.count
        items.append(item)
        
        let indexPath = IndexPath(row: newIndex, section: 0)
        let indexPaths = [indexPath]
        tableView.insertRows(at: indexPaths, with: .automatic)
        navigationController?.popViewController(animated: true)
    }

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let item0 = ChecklistItem()
        item0.text = "Wake Up At Five O' Clock"
        items.append(item0)
        let item1 = ChecklistItem()
        item1.text = "Brush Teeth"
        item1.check = true
        items.append(item1)
        let item2 = ChecklistItem()
        item2.text = "Complete Prayer"
        item2.check = false
        items.append(item2)
        let item3 = ChecklistItem()
        item3.text = "Take Breakfast"
        item3.check = true
        items.append(item3)
        let item4 = ChecklistItem()
        item4.text = "Go to Office"
        item4.check = true
        items.append(item4)
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddItem"{
            let controller = segue.destination as! AddItemTableViewController
            controller.delegate = self
        }else if segue.identifier == "EditItem"{
            let controller = segue.destination as! AddItemTableViewController
            controller.delegate = self
            
            if let indexPath = tableView.indexPath(for: sender as! UITableViewCell){
                controller.editItem = items[indexPath.row]}
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        if let cell = tableView.cellForRow(at: indexPath){
            let item = items[indexPath.row]
            
            item.check = !item.check
            configureCheckmark(for: cell, at: indexPath)
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChecklistItem", for: indexPath)
        let item = items[indexPath.row]
        
        let label = cell.viewWithTag(1) as! UILabel
        
        label.text = item.text
        configureCheckmark(for: cell, at: indexPath)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath){
        
        items.remove(at: indexPath.row)
        let indexPaths = [indexPath]
        tableView.deleteRows(at: indexPaths, with: .automatic )
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func configureCheckmark(for cell: UITableViewCell, at indexPath: IndexPath){
        
        let item = items[indexPath.row]
        let label = cell.viewWithTag(5) as! UILabel
        if item.check {
            label.text = "√"
        }else{
            label.text = ""
        }
    }
    
    func addItemViewController(_ conroller: AddItemTableViewController, didFinishEditing item: ChecklistItem) {
        
        if let index = items.index(of: item){
            let indexPath = IndexPath(row: index, section: 0)
            if let cell = tableView.cellForRow(at: indexPath){
               // configureText(for: cell, with: item)
            }
        }
        navigationController?.popViewController(animated: true)
    }
}

