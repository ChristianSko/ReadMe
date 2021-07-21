//
//  ViewController.swift
//  ReadMe
//
//  Created by Christian Skorobogatow on 20/7/21.
//

import UIKit

class LibraryViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    
    
    // MARK: - Data Source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return Library.books.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BookCell", for: indexPath)
        let book = Library.books[indexPath.row]
            
        cell.textLabel?.text = book.title
        cell.imageView?.image = book.image
        
        return cell
    }

}

