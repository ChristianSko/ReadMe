//
//  NewBookTableViewController.swift
//  ReadMe
//
//  Created by Christian Skorobogatow on 18/8/21.
//

import UIKit

class NewBookTableViewController: UITableViewController {

    @IBOutlet var titleTextfield: UITextField!
    @IBOutlet var authorTextfield: UITextField!
    @IBOutlet var bookImageView: UIImageView!
    
    @IBAction func updateImage() {
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bookImageView.layer.cornerRadius = 16
        
    }
    

}

extension NewBookTableViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let selectedImage = info[.editedImage] as? UIImage else {return}
        bookImageView.image = selectedImage
        dismiss(animated: true)
    }
}


extension NewBookTableViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == titleTextfield {
            return authorTextfield.becomeFirstResponder()
        } else {
            return textField.resignFirstResponder()
        }
    }
}


