//
//  Created by Ceri Hughes on 19/04/2020.
//  Copyright © 2020 Ceri Hughes. All rights reserved.
//

import Provident // To test the API we must NOT use @testable
import XCTest

class RegistryAPITests: XCTestCase {
    private var registrar: Registrar<String, Void>!

    override func setUp() {
        super.setUp()

        registrar = Registrar()
    }

    override func tearDown() {
        registrar = nil

        super.tearDown()
    }

    func testResolveFunctions() {
        let serviceProviderFunctions: [ServiceProviderFunction] = [
            TestServiceProvider.init(context:)
        ]

        let viewControllerProviderFunctions: [ViewControllerProviderFunction] = [
            TestViewControllerProvider.init
        ]

        let registry = registrar.registry
        XCTAssertThrowsError(try registry.createViewController(from: "Test"))
        XCTAssertThrowsError(try registry.createViewController(from: "Test", context: ()))

        registrar.resolve(
            serviceProviderFunctions: serviceProviderFunctions,
            viewControllerProviderFunctions: viewControllerProviderFunctions
        )

        XCTAssertNotNil(try registry.createViewController(from: "Test"))
        XCTAssertNotNil(try registry.createViewController(from: "Test", context: ()))
    }

    func testResolveResolver() {
        let serviceProviderFunctions: [ServiceProviderFunction] = [
            TestServiceProvider.init(context:)
        ]

        let viewControllerProviderFunctions: [ViewControllerProviderFunction] = [
            TestViewControllerProvider.init
        ]

        let registry = registrar.registry
        XCTAssertThrowsError(try registry.createViewController(from: "Test"))
        XCTAssertThrowsError(try registry.createViewController(from: "Test", context: ()))

        let resolver = TestResolver(
            testServiceProviderFunctions: serviceProviderFunctions,
            testViewControllerProviderFunctions: viewControllerProviderFunctions
        )
        registrar.resolve(resolver: resolver)

        XCTAssertNotNil(try registry.createViewController(from: "Test"))
        XCTAssertNotNil(try registry.createViewController(from: "Test", context: ()))
    }
}
