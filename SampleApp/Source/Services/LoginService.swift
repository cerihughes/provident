//
//  LoginService.swift
//  App
//
//  Created by Ceri Hughes on 23/10/2020.
//

import Foundation

protocol LoginService {
    func login(username: String, password: String, completion: (Bool) -> Void)
}

class LoginServiceImplementation: LoginService {
    func login(username: String, password: String, completion: (Bool) -> Void) {
        completion(loginSync(username: username, password: password))
    }

    private func loginSync(username: String, password: String) -> Bool {
        username == "username" && password == "password"
    }
}
