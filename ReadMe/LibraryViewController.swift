//
//  ViewController.swift
//  ReadMe
//
//  Created by Christian Skorobogatow on 20/7/21.
//

import UIKit

class LibraryHeaderView: UITableViewHeaderFooterView {
    static let reuseIdentifier = "\(LibraryHeaderView.self)"
    @IBOutlet var titleLabel: UILabel!
}


class LibraryViewController: UITableViewController {
    enum Section: String, CaseIterable {
        case addNew
        case readMe =  "Readme"
        case finished = "Finished!"
    }
    
    var dataSource: UITableViewDiffableDataSource<Section, Book>!

    @IBSegueAction func showDetailView(_ coder: NSCoder) -> DetailViewController? {
        
        guard let indexPath = tableView.indexPathForSelectedRow,
              let book = dataSource.itemIdentifier(for: indexPath)
        else { fatalError("Nothing Selected")}
        
        return DetailViewController(coder: coder, book: book)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "\(LibraryHeaderView.self)", bundle: nil), forHeaderFooterViewReuseIdentifier: LibraryHeaderView.reuseIdentifier)
        
        configureDataSource()
        updateDataSource()
    }

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateDataSource()
    }
    
    
    // MARK: - Data Source
    
    func configureDataSource() {
        dataSource = UITableViewDiffableDataSource(tableView: tableView) {
            tableView, indexPath, book -> UITableViewCell? in
            if indexPath == IndexPath(row: 0, section: 0) {
                let cell = tableView.dequeueReusableCell(withIdentifier: "newBookCell", for: indexPath)
                
                return cell
                
            }
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "\(BookCell.self)", for: indexPath) as? BookCell else { fatalError("could not create Bookcell")}
            
            
            cell.titleLabel.text                  = book.title
            cell.authorLabel.text                 = book.author
            cell.bookThumbnail.image              = book.image ?? LibrarySymbol.letterSquare(letter: book.title.first).image
            cell.bookThumbnail.layer.cornerRadius = 12
            
            
            if let review = book.review {
                cell.reviewLabel.text       = review
                cell.reviewLabel.isHidden   = false
            }
            
            cell.readMeBookMark.isHidden = !book.readMe
            return cell
        }
    }
    
    
    
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return section == 1 ? "Read Me!" : nil
     }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 { return nil}
        
        guard let headerview = tableView.dequeueReusableHeaderFooterView(withIdentifier: LibraryHeaderView.reuseIdentifier) as? LibraryHeaderView
            else {return nil}
        
        headerview.titleLabel.text = Section.allCases[section].rawValue
        return headerview
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return section !=  0 ? 60 : 0
    }
    
    
    

    func updateDataSource() {
        var newSnapShot = NSDiffableDataSourceSnapshot<Section, Book>()
        newSnapShot.appendSections(Section.allCases)
        newSnapShot.appendItems(Library.books, toSection: .readMe)
        
        let booksByReadMe: [Bool: [Book]] = Dictionary(grouping: Library.books, by: \.readMe)
        for (readMe, books) in booksByReadMe {
            newSnapShot.appendItems(books, toSection: readMe ? .readMe : .finished)
        }
        newSnapShot.appendItems([Book.mockBook], toSection: .addNew)
        dataSource.apply(newSnapShot, animatingDifferences: true)
    }

}

