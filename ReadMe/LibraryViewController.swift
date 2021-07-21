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
        50
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BookCell", for: indexPath)
        let book = Book(
            title: "Title \(indexPath)",
            author: "Author \(indexPath)",
            image: UIImage(systemName: "\(indexPath.row).square.fill")!
        )
        cell.textLabel?.text = book.title
        cell.imageView?.image = book.image
        
        return cell
    }

}

