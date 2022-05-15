//
//  ReminderViewController.swift
//  CollectionView
//
//  Created by Александр Полетаев on 15.05.2022.
//

import Foundation
import UIKit

class ReminderViewController: UICollectionViewController{
    typealias DataSourse = UICollectionViewDiffableDataSource<Int, Row>
    private typealias Snapshot = NSDiffableDataSourceSnapshot<Int, Row>
    
    var reminder : Reminder
    private var dataSource: DataSourse!
    
    init(reminder: Reminder) {
        self.reminder = reminder
        var listConfiguration = UICollectionLayoutListConfiguration(appearance: .insetGrouped)
        listConfiguration.showsSeparators = false
        let listLayout = UICollectionViewCompositionalLayout.list(using: listConfiguration)
        super.init(collectionViewLayout: listLayout)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let cellRegistration = UICollectionView.CellRegistration(handler: cellRegistrationHandler)
        dataSource = DataSourse(collectionView: collectionView) {(collectionView:UICollectionView, indexPath: IndexPath, itemIdentifier: Row) in
            return collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: itemIdentifier)
        }
        navigationItem.title = NSLocalizedString("Reminder", comment: "Reminder view controller title")
        
        updateSnapshot()
    }
        
    func cellRegistrationHandler(cell: UICollectionViewListCell, insexPath: IndexPath, row: Row)  {
        var contentConfiguration = cell.defaultContentConfiguration()
        contentConfiguration.text = text(for: row)
        contentConfiguration.textProperties.font = UIFont.preferredFont(forTextStyle: row.texStyle)
        contentConfiguration.image = row.image
        cell.contentConfiguration = contentConfiguration
        cell.tintColor = .systemBlue
    }
    
    private func updateSnapshot() {
          var snapshot = Snapshot()
          snapshot.appendSections([0])
          snapshot.appendItems([.viewTitle, .viewDate, .viewTime, .viewNotes], toSection: 0)
          dataSource.apply(snapshot)
      }
    
    func text( for row: Row) -> String?{
        switch row {
        case .viewDate:
            return reminder.dueDate.dayText
        case .viewNotes :
            return reminder.notes
        case . viewTime:
            return reminder.dueDate.formatted(date: .omitted, time: .shortened)
        case .viewTitle:
            return reminder.title
        }
    }
}
