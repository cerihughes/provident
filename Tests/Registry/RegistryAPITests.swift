//
//  RegistryAPITests.swift
//  ProvidentTests
//
//  Created by Ceri Hughes on 19/04/2020.
//  Copyright © 2020 Ceri Hughes. All rights reserved.
//

import Provident // To test the API we must NOT use @testable
import XCTest

class RegistryAPITests: XCTestCase {
    private var registry: Registry<String, Void>!
    private var registrar: Registrar<String, Void>!

    override func setUp() {
        super.setUp()

        registry = Registry()
        registrar = Registrar(registry: registry)
    }

    override func tearDown() {
        registry = nil
        registrar = nil

        super.tearDown()
    }

    func testResolveFunctions() {
        let serviceProviderFunctions: [Registrar<String, Void>.ServiceProviderFunction] = [
            TestServiceProvider.init(context:)
        ]

        let viewControllerProviderFunctions: [Registrar<String, Void>.ViewControllerProviderFunction] = [
            TestViewControllerProvider.init
        ]

        XCTAssertNil(registry.createViewController(from: "Test"))
        XCTAssertNil(registry.createViewController(from: "Test", context: ()))

        registrar.resolve(serviceProviderFunctions: serviceProviderFunctions, viewControllerProviderFunctions: viewControllerProviderFunctions)

        XCTAssertNotNil(registry.createViewController(from: "Test"))
        XCTAssertNotNil(registry.createViewController(from: "Test", context: ()))
    }

    func testResolveResolver() {
        let serviceProviderFunctions: [Registrar<String, Void>.ServiceProviderFunction] = [
            TestServiceProvider.init(context:)
        ]

        let viewControllerProviderFunctions: [Registrar<String, Void>.ViewControllerProviderFunction] = [
            TestViewControllerProvider.init
        ]

        XCTAssertNil(registry.createViewController(from: "Test"))
        XCTAssertNil(registry.createViewController(from: "Test", context: ()))

        let resolver = TestResolver(testServiceProviderFunctions: serviceProviderFunctions,
                                    testViewControllerProviderFunctions: viewControllerProviderFunctions)
        registrar.resolve(resolver: resolver)

        XCTAssertNotNil(registry.createViewController(from: "Test"))
        XCTAssertNotNil(registry.createViewController(from: "Test", context: ()))
    }
}
