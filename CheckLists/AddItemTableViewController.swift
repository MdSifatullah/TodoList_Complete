//
//  AddItemTableViewController.swift
//  CheckLists
//
//  Created by Md Sifat on 1/16/20.
//  Copyright © 2020 Md Sifat. All rights reserved.
//

import UIKit

class AddItemTableViewController: UITableViewController, UITextFieldDelegate {
    
    var checkListViewController = ChecklistsViewController()
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var doneBtn: UIBarButtonItem!
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.largeTitleDisplayMode = .never
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        textField.becomeFirstResponder()
    }
    
    @IBAction func DoneBtn(_ sender: Any) {
        
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func CancelBtn() {
        navigationController?.popViewController(animated: true)
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
