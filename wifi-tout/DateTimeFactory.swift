//
// Created by Kelvin Harron on 05/02/2020.
// Copyright (c) 2020 Matthew Wilson. All rights reserved.
//

import Foundation

class DateTimeFactory {

    private let dateFormatter = DateFormatter()
    private let localeProvider = LocaleProvider()

    private let dateTimeFormatMedium = "MMM d, h:mm a"

    func getFormattedDate() -> String {
        let timestamp = Date()
        dateFormatter.locale = localeProvider.getUserLocale()
        dateFormatter.dateFormat = dateTimeFormatMedium

        return dateFormatter.string(from: timestamp)
    }
}
