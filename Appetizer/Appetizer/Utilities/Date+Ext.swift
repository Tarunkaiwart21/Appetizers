//
//  Date+Ext.swift
//  Appetizer
//
//  Created by 61066832 on 01/12/24.
//

import Foundation

extension Date{
    var eighteenYearsAgo : Date {
        Calendar.current.date(byAdding: .year, value: -18, to: Date())!
    }
    
    var hundredYearsAgo : Date {
        Calendar.current.date(byAdding: .year, value: -100, to: Date())!
    }
}
