//
//  ReminderListViewController+DataSourse.swift
//  CollectionView
//
//  Created by Александр Полетаев on 11.05.2022.
//

import Foundation
import UIKit

extension ReminderListViewController {
    typealias DataSourse = UICollectionViewDiffableDataSource<Int,Reminder.ID>
    typealias Snapshot = NSDiffableDataSourceSnapshot<Int,Reminder.ID>
    
    func cellRegistrationHandler(cell: UICollectionViewListCell, indexPath: IndexPath, id: Reminder.ID) {
        let reminder = reminders[indexPath.item]
        var contentConfiguration = cell.defaultContentConfiguration()
        contentConfiguration.text = reminder.title
        contentConfiguration.secondaryText = reminder.dueDate.dayAndTimeText
        contentConfiguration.secondaryTextProperties.font = UIFont.preferredFont(forTextStyle: .caption1)
        cell.contentConfiguration = contentConfiguration
        
        var doneButtonConConfiguration = doneButtonConConfiguration(for: reminder)
        doneButtonConConfiguration.tintColor = .darkGray
        cell.accessories = [ .customView(configuration: doneButtonConConfiguration),.disclosureIndicator(displayed: .always) ]
        
        var backgroundConfiguration = UIBackgroundConfiguration.listGroupedCell()
        backgroundConfiguration.backgroundColor = UIColor(displayP3Red: 0.3, green: 0.9, blue: 0.9, alpha: 1.2)
        cell.backgroundConfiguration = backgroundConfiguration
        }
    
    private func doneButtonConConfiguration(for reminder: Reminder) -> UICellAccessory.CustomViewConfiguration{
        let symbolName = reminder.isComplete ? "circle.fill" : "circle"
        let symbolConfiguration = UIImage.SymbolConfiguration(textStyle: .title1)
        let image = UIImage(systemName: symbolName, withConfiguration: symbolConfiguration)
        let button = UIButton()
        button.setImage(image, for: .normal)
        return UICellAccessory.CustomViewConfiguration(customView: button, placement: .leading(displayed:.always ))
    }
    
}
