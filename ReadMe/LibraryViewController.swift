//
//  ViewController.swift
//  ReadMe
//
//  Created by Christian Skorobogatow on 20/7/21.
//

import UIKit

class LibraryViewController: UITableViewController {

    @IBSegueAction func showDetailView(_ coder: NSCoder) -> DetailViewController? {
        
        guard let indexPath = tableView.indexPathForSelectedRow
        else { fatalError("Nothing Selected")}
        
        let book = Library.books[indexPath.row]
        
        return DetailViewController(coder: coder, book: book)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    
    // MARK: - Data Source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return Library.books.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "\(BookCell.self)", for: indexPath) as? BookCell else { fatalError("could not create Bookcell")}
        let book = Library.books[indexPath.row]
            
        cell.titleLabel.text = book.title
        cell.authorLabel.text = book.author
        cell.bookThumbnail.image = book.image
        cell.bookThumbnail.layer.cornerRadius = 12
    
        
        return cell
    }

}

