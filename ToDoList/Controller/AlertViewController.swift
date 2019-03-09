//
//  AlertViewController.swift
//  ToDoList
//
//  Created by Arthur on 08.03.2019.
//  Copyright © 2019 Arthur. All rights reserved.
//

import UIKit

class AlertViewController: UIViewController {
    
    @IBOutlet weak var alertView: UIView!
    
    @IBOutlet weak var titleView: UIView!

    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var cancelButton: UIButton!
    
    @IBOutlet weak var createButton: UIButton!
    
    var tableView: UITableView?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        borderShape()
    }
    
    func borderShape(){
        alertView.layer.cornerRadius = 10
        alertView.layer.masksToBounds = true
        
        cancelButton.layer.cornerRadius = 10
        cancelButton.layer.masksToBounds = true
        
        createButton.layer.cornerRadius = 10
        createButton.layer.masksToBounds = true
        
    }
  
    @IBAction func didTapCancelButton(_ sender: Any) {
        
        dismiss(animated: true)
        
    }
    
    @IBAction func didTapCreateButton(_ sender: Any) {
        let newTask = textField!.text
        addItem(nameItem: newTask!)
        tableView?.reloadData()
        dismiss(animated: true)
    }
    
}


