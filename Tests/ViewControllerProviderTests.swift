//
//  ViewControllerProviderTests.swift
//  ProvidentTests
//
//  Created by Ceri Hughes on 23/07/2023.
//  Copyright © 2023 Ceri Hughes. All rights reserved.
//

import UIKit
import XCTest

@testable import Provident

class ViewControllerProviderTests: XCTestCase {

    /// Tests a ViewControllerProvider implementation that uses the default register(with:) and configure(with:)
    /// implementations
    func testBareMinViewControllerProvider() {
        let registry = Registry<String, Void>()
        let registrar = Registrar(registry: registry)
        registrar.resolve(resolver: ResolverForTesting())

        let viewController = registry.createViewController(from: "testBareMinViewControllerProvider")
        XCTAssertNotNil(viewController)
        XCTAssertEqual(viewController?.title, "testBareMinViewControllerProvider")
    }
}

private class ViewControllerProviderForTesting: ViewControllerProvider {
    func createViewController(token: String, context: Void) -> ViewController? {
        UIViewController(title: token)
    }
}

private class ResolverForTesting: Resolver {
    typealias T = String
    typealias C = Void

    func viewControllerProviderFunctions() -> [Registrar<String, Void>.ViewControllerProviderFunction] {
        [
            ViewControllerProviderForTesting.init
        ]
    }
}
