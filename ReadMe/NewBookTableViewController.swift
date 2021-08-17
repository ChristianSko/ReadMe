//
//  NewBookTableViewController.swift
//  ReadMe
//
//  Created by Christian Skorobogatow on 18/8/21.
//

import UIKit

class NewBookTableViewController: UITableViewController {
    
    let book: Book
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var titleTextfield: UIImageView!
    @IBOutlet var authorLabel: UILabel!
    @IBOutlet var authorTextfield: UITextField!
    @IBOutlet var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    required init?(coder: NSCoder) {fatalError("This should have never been called!") }
    
    init?(coder: NSCoder, book: Book) {
        self.book = book
        super.init(coder: coder)
        
    }
}

extension NewBookTableViewController {
    
}
