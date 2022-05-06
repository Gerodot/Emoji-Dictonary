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
    
    @IBOutlet weak var saveButton: UIBarButtonItem!
    @IBOutlet weak var titleLabel: UINavigationItem!
    
    //MARK: - Properites
    var emoji = Emoji()
    
    //MARK: - UIViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTextFields()
        updateUI()
    }
    
    //MARK: - Methods
    func titleName() {
        if emoji.symbol != "" && emoji.name != "" && emoji.description != "" && emoji.usage != "" {
            titleLabel.title = "Edit"
        }
    }
    
    func saveEmoji() {
        emoji.symbol = symbolTextField.text ?? ""
        emoji.name = nameTextField.text ?? ""
        emoji.description = descriptionTextField.text ?? ""
        emoji.usage = usageTextField.text ?? ""
    }
    
    func setupTextFields() {
        symbolTextField.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: UIControl.Event.editingChanged)
        nameTextField.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: UIControl.Event.editingChanged)
        descriptionTextField.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: UIControl.Event.editingChanged)
        //usageTextField.textFieldDidChange(self, action: #selector(self.textFieldDidChange(_:)), for: UIControl.Event.editingChanged)
    }
    
    func updateUI() {
        symbolTextField.text = emoji.symbol
        nameTextField.text = emoji.name
        descriptionTextField.text = emoji.description
        usageTextField.text = emoji.usage
        titleName()
    }
    
    //MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        saveEmoji()
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        guard !symbolTextField.text!.isEmpty else {
            saveButton.isEnabled = false
            return
        }
        guard !nameTextField.text!.isEmpty else {
            saveButton.isEnabled = false
            return
        }
        guard !descriptionTextField.text!.isEmpty else {
            saveButton.isEnabled = false
            return
        }
        guard !usageTextField.text!.isEmpty else {
            saveButton.isEnabled = false
            return
        }
        saveButton.isEnabled = true
    }
}
