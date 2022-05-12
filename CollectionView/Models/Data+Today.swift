//
//  Data+Today.swift
//  CollectionView
//
//  Created by Александр Полетаев on 11.05.2022.
//

import Foundation

extension Date {
    var dayAndTimeText: String {
        let timeText = formatted(date: .omitted, time: .shortened)
        if Locale.current.calendar.isDateInToday(self){
            let timeFormat = NSLocalizedString("Today at %@", comment: "Today at time format string")
            return String(format: timeFormat, timeText)
        }else {
            let dataText = formatted(.dateTime.month(.abbreviated).day())
            let dataAndTimeFormat = NSLocalizedString("%@ at %@", comment: "Date and Time format string")
            return String(format: dataAndTimeFormat, dataText,timeText)
        }
    }
    var dayText: String{
        if Locale.current.calendar.isDateInToday(self){
            return NSLocalizedString("Today", comment: "Today due date description")
        }else {
            return formatted(.dateTime.month().day().weekday(.wide))
        }
    }
}
