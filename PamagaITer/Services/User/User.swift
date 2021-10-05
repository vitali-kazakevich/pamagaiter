//
//  User.swift
//  PamagaITer
//
//  Created by Kazakevich, Vitaly on 5.10.21.
//

import Foundation

extension User {
    enum Position {
        case candidate
        case trainee
        case junior
        case middle
        case senior
    }
}

struct User {
    let name: String
    let experience: Double
    let position: Position
}
