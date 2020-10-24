//
//  LoginViewModel.swift
//  App
//
//  Created by Ceri Hughes on 24/10/2020.
//

import Foundation

class LoginViewModel {
    private let loginService: LoginService

    init(loginService: LoginService) {
        self.loginService = loginService
    }

    func login(username: String, password: String, completion: (Bool) -> Void) {
        loginService.login(username: username, password: password, completion: completion)
    }
}
