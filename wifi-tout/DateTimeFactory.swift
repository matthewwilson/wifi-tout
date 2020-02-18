//
// Created by Kelvin Harron on 05/02/2020.
// Copyright (c) 2020 Matthew Wilson. All rights reserved.
//

import Foundation

class DateTimeFactory {

    private let dateFormatter = DateFormatter()
    private let localeProvider = LocaleProvider()
    private let twentyFourHourFormat = "HH:mm"

    func getFormattedTime() -> String {
        let timestamp = Date()

        dateFormatter.dateStyle = .none
        dateFormatter.timeStyle = .short
        dateFormatter.locale = localeProvider.getUserLocale()

        return dateFormatter.string(from: timestamp)
    }
}
