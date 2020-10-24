//
//  LoginViewModel.swift
//  App
//
//  Created by Ceri Hughes on 24/10/2020.
//

import Foundation

class LoginViewModel {
    private let authenticationService: AuthenticationService

    init(authenticationService: AuthenticationService) {
        self.authenticationService = authenticationService
    }

    func login(username: String, password: String, completion: (Bool) -> Void) {
        authenticationService.login(username: username, password: password, completion: completion)
    }
}
