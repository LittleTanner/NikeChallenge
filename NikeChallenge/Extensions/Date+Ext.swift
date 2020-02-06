//
//  Date+Ext.swift
//  NikeChallenge
//
//  Created by Kevin Tanner on 2/6/20.
//  Copyright © 2020 Kevin Tanner. All rights reserved.
//

import Foundation

extension Date {
    
    func convertToMonthDayYearFormat() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM d, yyyy"
        return dateFormatter.string(from: self)
    }
}
