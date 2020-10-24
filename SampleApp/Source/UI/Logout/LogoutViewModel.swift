//
//  LogoutViewModel.swift
//  App
//
//  Created by Ceri Hughes on 24/10/2020.
//

import Combine

class LogoutViewModel: ObservableObject {
    private let authenticationService: AuthenticationService

    init(authenticationService: AuthenticationService) {
        self.authenticationService = authenticationService
    }

    func logout(completion: () -> Void) {
        authenticationService.logout(completion: completion)
    }
}
