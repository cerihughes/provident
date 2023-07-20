//
//  SampleResolver.swift
//  App
//
//  Created by Ceri Hughes on 23/10/2020.
//

import Provident
import UIKit

class SampleResolver: Resolver<Navigation, Void> {
    override func serviceProviderFunctions() -> [Registrar<Navigation, Void>.ServiceProviderFunction] {
        [
            SampleServiceProvider.init(context:)
        ]
    }

    override func viewControllerProviderFunctions() -> [Registrar<Navigation, Void>.ViewControllerProviderFunction] {
        [
            LoginViewControllerProvider.init,
            LogoutViewControllerProvider.init,
            ErrorViewControllerProvider.init
        ]
    }
}
