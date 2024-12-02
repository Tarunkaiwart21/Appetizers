//
//  User.swift
//  Appetizer
//
//  Created by 61066832 on 30/11/24.
//

import SwiftUI

class User : Codable {
    var firstName = ""
    var lastName = ""
    var email = ""
    var birthday = Date()
    var extraNapkins = false
    var frequentRefills = false
}
