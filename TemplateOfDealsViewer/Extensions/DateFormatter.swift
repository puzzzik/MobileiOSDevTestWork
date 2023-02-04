//
//  DateFormatter.swift
//  TemplateOfDealsViewer
//
//  Created by Иван Тазенков on 03.02.2023.
//

import Foundation
extension DateFormatter {
    static var timeDate: DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "hh:mm:ss dd.MM.yyyy"
        return dateFormatter
    }
}
