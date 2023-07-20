//
//  AuthenticationService.swift
//  SampleApp
//
//  Created by Ceri Hughes on 23/10/2020.
//

import Foundation

protocol AuthenticationService {
    var isAuthenticated: Bool { get }
    func login(username: String, password: String, completion: (Bool) -> Void)
    func logout(completion: () -> Void)
}

class AuthenticationServiceImplementation: AuthenticationService {
    var isAuthenticated = false

    func login(username: String, password: String, completion: (Bool) -> Void) {
        isAuthenticated = loginSync(username: username, password: password)
        completion(isAuthenticated)
    }

    func logout(completion: () -> Void) {
        isAuthenticated = false
        completion()
    }

    private func loginSync(username: String, password: String) -> Bool {
        username == "username" && password == "password"
    }
}
