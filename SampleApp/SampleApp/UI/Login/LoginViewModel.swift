//
//  LoginViewModel.swift
//  SampleApp
//
//  Created by Ceri Hughes on 24/10/2020.
//

import Foundation

class LoginViewModel {
    private let authenticationService: AuthenticationService

    let usernameTitle = "Username:"
    let passwordTitle = "Password:"
    let submitTitle = "Submit"

    var username = ""
    var password = ""

    init(authenticationService: AuthenticationService) {
        self.authenticationService = authenticationService
    }

    func login(completion: (Bool) -> Void) {
        authenticationService.login(username: username, password: password, completion: completion)
    }
}
