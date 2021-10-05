//
//  UserService.swift
//  PamagaITer
//
//  Created by Kazakevich, Vitaly on 4.10.21.
//

import Combine

protocol UserService {}

final class AppUserService {
    @Published var currentUser: User?
}

extension AppUserService: UserService {}
