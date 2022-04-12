//
//  AddEditTableViewController.swift
//  TableViews
//
//  Created by Gerodot on 4/11/22.
//

import UIKit

class AddEditTableViewController: UITableViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var symbolTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var usageTextField: UITextView!
    @IBOutlet weak var titleLabel: UINavigationItem!
    
    
    //MARK: - Properites
    var emoji = Emoji()
    
    //MARK: - UIViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    //MARK: - Methods
    func updateUI() {
        symbolTextField.text = emoji.symbol
        nameTextField.text = emoji.name
        descriptionTextField.text = emoji.description
        usageTextField.text = emoji.usage
        titleName()
        
    }
    
    func titleName() {
        if emoji.symbol != "" && emoji.name != "" && emoji.description != "" && emoji.usage != "" {
            titleLabel.title = "Edit Emoji"
        }
    }
    
    func saveEmoji() {
        emoji.symbol = symbolTextField.text ?? ""
        emoji.name = nameTextField.text ?? ""
        emoji.description = descriptionTextField.text ?? ""
        emoji.usage = usageTextField.text ?? ""
    }
    
    //MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        saveEmoji()
        print(#line,#function, segue.identifier ?? "nil")
    }
}
