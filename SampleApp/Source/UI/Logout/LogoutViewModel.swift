//
//  LogoutViewModel.swift
//  SampleApp
//
//  Created by Ceri Hughes on 24/10/2020.
//

import Foundation

class LogoutViewModel {
    private let authenticationService: AuthenticationService

    let logoutTitle = "Log out"

    init(authenticationService: AuthenticationService) {
        self.authenticationService = authenticationService
    }

    func logout(completion: () -> Void) {
        authenticationService.logout(completion: completion)
    }
}
