//
//  CustomTableViewCell.swift
//  BucketLists
//
//  Created by Kevin Lagat on 07/10/2021.
//

import UIKit

protocol AddItemDelegate {
    func addItemToBucket(text: String)
}

protocol SaveItemDelegate {
    func saveItemText(_ item: String)
}

class CustomTableViewCell: UITableViewCell, UITextFieldDelegate {
    
    var text: String?
    
    
    @IBOutlet weak var addItemTextField: UITextField!
    var delegate: AddItemDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        addItemTextField.delegate = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
//        print(string)
        text?.append(string)
        return ((delegate?.addItemToBucket(text: textField.text! + string)) != nil)
    }
    
    
    
    
    
}


