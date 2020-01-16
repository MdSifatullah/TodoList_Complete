//
//  AddItemTableViewController.swift
//  CheckLists
//
//  Created by Md Sifat on 1/16/20.
//  Copyright © 2020 Md Sifat. All rights reserved.
//

import UIKit

class AddItemTableViewController: UITableViewController {

    @IBOutlet weak var textField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.largeTitleDisplayMode = .never
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        textField.becomeFirstResponder()
    }
    
    @IBAction func DoneBtn(_ sender: Any) {
    }
    
    @IBAction func CancelBtn(_ sender: Any) {
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }



}
