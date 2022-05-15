//
//  ReminderListViewController+Actions..swift
//  CollectionView
//
//  Created by Александр Полетаев on 12.05.2022.
//

import UIKit

extension ReminderListViewController {
    @objc func didPressDoneButton(_ sender: ReminderDoneButton) {
        guard let id = sender.id else {return}
        completeReminder(with: id)
       }
}
