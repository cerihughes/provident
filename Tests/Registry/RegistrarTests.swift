//
//  RegistrarTests.swift
//  ProvidentTests
//
//  Created by Ceri Hughes on 02/12/2018.
//  Copyright © 2019 Ceri Hughes. All rights reserved.
//

import XCTest

@testable import Provident

class RegistrarTests: XCTestCase {
    // MARK: CUT

    private var registrar: Registrar<String, Void>!

    // MARK: Test Data

    private var resolver: TestResolver!
    private var registry: Registry<String, Void>!

    override func setUp() {
        super.setUp()

        let testServiceProviderFunctions = [TestServiceProviderFactory.createServiceProvider]
        let testViewControllerProviderFunctions = [TestViewControllerProviderFactory.createViewControllerProvider]
        resolver = TestResolver(testServiceProviderFunctions: testServiceProviderFunctions,
                                testViewControllerProviderFunctions: testViewControllerProviderFunctions)
        registry = Registry()
        registrar = Registrar(registry: registry)
    }

    override func tearDown() {
        registrar = nil
        resolver = nil
        registry = nil

        super.tearDown()
    }

    func testCreateServiceProviders() {
        TestServiceProviderFactory.created = false

        XCTAssertEqual(registrar.serviceProviders.count, 0)
        registrar.createServiceProviders(functions: resolver.serviceProviderFunctions(), context: ServiceProviderCreationContextImplementation())

        // Both factories create a service provider object with the same name, so we only get 1 object
        XCTAssertEqual(registrar.serviceProviders.count, 1)

        XCTAssertTrue(TestServiceProviderFactory.created)
    }

    func testRegisterViewControllerProviders() {
        TestViewControllerProviderFactory.created = false

        XCTAssertEqual(registrar.viewControllerProviders.count, 0)
        registrar.registerViewControllerProviders(functions: resolver.viewControllerProviderFunctions())
        XCTAssertEqual(registrar.viewControllerProviders.count, 1)

        XCTAssertTrue(TestViewControllerProviderFactory.created)

        for viewControllerProvider in registrar.viewControllerProviders {
            let testViewControllerProvider = viewControllerProvider as! TestViewControllerProvider
            XCTAssertTrue(testViewControllerProvider.registered)
            XCTAssertFalse(testViewControllerProvider.unregistered)
        }
    }
}
