//
//  AddItemTableViewController.swift
//  CheckLists
//
//  Created by Md Sifat on 1/16/20.
//  Copyright © 2020 Md Sifat. All rights reserved.
//

import UIKit

protocol AddItemViewControllerDelegate: class {
    func addItemViewControllerDidCancel(_ controller: AddItemTableViewController)
    func addItemViewController(_ conroller: AddItemTableViewController, didFinishAdd item: ChecklistItem)
    func addItemViewController(_ conroller: AddItemTableViewController, didFinishEditing item: ChecklistItem)
}

class AddItemTableViewController: UITableViewController, UITextFieldDelegate {
    
    
    //var checkListViewController = ChecklistsViewController()
    var editItem : ChecklistItem?
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var doneBtn: UIBarButtonItem!
    weak var delegate : AddItemViewControllerDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.largeTitleDisplayMode = .never
        
        if let item = editItem{
            title = "Edit Item"
            textField.text = item.text
            doneBtn.isEnabled = true
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        textField.becomeFirstResponder()
    }
    
    @IBAction func DoneBtn(_ sender: Any) {
        
        if let item = editItem{
            item.text = textField.text!
            delegate?.addItemViewController(self, didFinishEditing: item)
        }else{
            let item = ChecklistItem()
            item.text = textField.text!
            
            delegate?.addItemViewController(self, didFinishAdd: item)
        }
        
    }
    
    @IBAction func CancelBtn() {
        delegate?.addItemViewControllerDidCancel(self)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return nil
    }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        doneBtn.isEnabled = false
        return true
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let text = textField.text!
        let stringRange = Range(range, in: text)!
        let newText = text.replacingCharacters(in: stringRange, with: string)
        if newText.isEmpty {
            doneBtn.isEnabled = false
            
        }else{
            doneBtn.isEnabled = true
        }
        return true
    }
    
}
