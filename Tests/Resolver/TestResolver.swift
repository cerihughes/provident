//
//  TestResolver.swift
//  ProvidentTests
//
//  Created by Ceri Hughes on 02/12/2018.
//  Copyright © 2019 Ceri Hughes. All rights reserved.
//

import Foundation
import Provident

class TestResolver: Resolver<String, Void> {
    private let testServiceProviderFunctions: [Registrar<String, Void>.ServiceProviderFunction]
    private let testViewControllerProviderFunctions: [Registrar<String, Void>.ViewControllerProviderFunction]

    init(testServiceProviderFunctions: [Registrar<String, Void>.ServiceProviderFunction],
         testViewControllerProviderFunctions: [Registrar<String, Void>.ViewControllerProviderFunction]) {
        self.testServiceProviderFunctions = testServiceProviderFunctions
        self.testViewControllerProviderFunctions = testViewControllerProviderFunctions

        super.init()
    }

    override func serviceProviderFunctions() -> [Registrar<String, Void>.ServiceProviderFunction] {
        testServiceProviderFunctions
    }

    override func viewControllerProviderFunctions() -> [Registrar<String, Void>.ViewControllerProviderFunction] {
        testViewControllerProviderFunctions
    }
}
