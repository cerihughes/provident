//
//  RegistryTests.swift
//  ProvidentTests
//
//  Created by Ceri Hughes on 03/05/2019.
//  Copyright © 2019 Ceri Hughes. All rights reserved.
//

import XCTest

@testable import Provident

class RegistryTests: XCTestCase {
    private var registry: Registry<Int, String>!

    override func setUp() {
        super.setUp()

        registry = Registry()
    }

    override func tearDown() {
        registry = nil

        super.tearDown()
    }

    func testRegisterFunction() {
        let uuid = registry.add(registryFunction: createFunction(limit: 10))
        XCTAssertNotNil(registry.createViewController(from: 1))

        registry.removeRegistryFunction(uuid: uuid)
        XCTAssertNil(registry.createViewController(from: 1))
    }

    func testRegisterFunction_providingContext() {
        let uuid = registry.add(registryFunction: createFunction(limit: 10))
        XCTAssertNotNil(registry.createViewController(from: 1, context: "Things"))

        registry.removeRegistryFunction(uuid: uuid)
        XCTAssertNil(registry.createViewController(from: 1, context: "Things"))
    }

    func testRegisterFunctionWithContext() {
        let uuid = registry.add(registryFunction: createFunctionWithContext(limit: 10))
        XCTAssertNotNil(registry.createViewController(from: 1, context: "Things"))

        registry.removeRegistryFunction(uuid: uuid)
        XCTAssertNil(registry.createViewController(from: 1, context: "Things"))
    }

    func testRegisterFunctionWithContext_withoutProvidingContext() {
        let uuid = registry.add(registryFunction: createFunctionWithContext(limit: 10))
        XCTAssertNil(registry.createViewController(from: 1))

        registry.removeRegistryFunction(uuid: uuid)
        XCTAssertNil(registry.createViewController(from: 1))
    }

    func testRegisterFunctions_oneIsValid() {
        let uuid1 = registry.add(registryFunction: createFunction(limit: 0))
        let uuid2 = registry.add(registryFunction: createFunction(limit: 1))

        let vc = registry.createViewController(from: 1)
        XCTAssertNotNil(vc)
        XCTAssertEqual(vc!.title, "function 1")

        registry.removeRegistryFunction(uuid: uuid2)
        XCTAssertNil(registry.createViewController(from: 1))

        registry.removeRegistryFunction(uuid: uuid1)
        XCTAssertNil(registry.createViewController(from: 1))
    }

    func testRegisterFunctionWithContext_oneIsValid() {
        let uuid1 = registry.add(registryFunction: createFunctionWithContext(limit: 0))
        let uuid2 = registry.add(registryFunction: createFunctionWithContext(limit: 1))

        let vc = registry.createViewController(from: 1, context: "Things")
        XCTAssertNotNil(vc)
        XCTAssertEqual(vc!.title, "functionWithContext 1")

        registry.removeRegistryFunction(uuid: uuid2)
        XCTAssertNil(registry.createViewController(from: 1, context: "Things"))

        registry.removeRegistryFunction(uuid: uuid1)
        XCTAssertNil(registry.createViewController(from: 1, context: "Things"))
    }

    func testRegisterFunctions_allValid_usesFirstRegistered() {
        let uuid1 = registry.add(registryFunction: createFunction(limit: 0))
        let uuid2 = registry.add(registryFunction: createFunction(limit: 1))

        let vc = registry.createViewController(from: 0)
        XCTAssertNotNil(vc)
        XCTAssertEqual(vc!.title, "function 0")

        registry.removeRegistryFunction(uuid: uuid2)
        XCTAssertNotNil(registry.createViewController(from: 0))

        registry.removeRegistryFunction(uuid: uuid1)
        XCTAssertNil(registry.createViewController(from: 0))
    }

    func testRegisterFunctionsWithContext_allValid_usesFirstRegistered() {
        let uuid1 = registry.add(registryFunction: createFunctionWithContext(limit: 0))
        let uuid2 = registry.add(registryFunction: createFunctionWithContext(limit: 1))

        let vc = registry.createViewController(from: 0, context: "Things")
        XCTAssertNotNil(vc)
        XCTAssertEqual(vc!.title, "functionWithContext 0")

        registry.removeRegistryFunction(uuid: uuid2)
        XCTAssertNotNil(registry.createViewController(from: 0, context: "Things"))

        registry.removeRegistryFunction(uuid: uuid1)
        XCTAssertNil(registry.createViewController(from: 0, context: "Things"))
    }

    func testRegisterMixedFunctions_functionsWithContextsReturnFirst() {
        let uuid1 = registry.add(registryFunction: createFunctionWithContext(limit: 0))
        let uuid2 = registry.add(registryFunction: createFunction(limit: 0))

        var vc = registry.createViewController(from: 0, context: "Things")
        XCTAssertEqual(vc!.title, "functionWithContext 0")
        registry.removeRegistryFunction(uuid: uuid1)

        vc = registry.createViewController(from: 0, context: "Things")
        XCTAssertEqual(vc!.title, "function 0")
        registry.removeRegistryFunction(uuid: uuid2)
    }

    func testRegisterMixedFunctions_allValid_usesFirstRegistered() {
        let uuid1 = registry.add(registryFunction: createFunctionWithContext(limit: 0))
        let uuid2 = registry.add(registryFunction: createFunctionWithContext(limit: 1))
        let uuid3 = registry.add(registryFunction: createFunction(limit: 0))
        let uuid4 = registry.add(registryFunction: createFunction(limit: 1))

        var vc = registry.createViewController(from: 0, context: "Things")
        XCTAssertEqual(vc!.title, "functionWithContext 0")
        registry.removeRegistryFunction(uuid: uuid1)

        vc = registry.createViewController(from: 0, context: "Things")
        XCTAssertEqual(vc!.title, "functionWithContext 1")
        registry.removeRegistryFunction(uuid: uuid2)

        vc = registry.createViewController(from: 0, context: "Things")
        XCTAssertEqual(vc!.title, "function 0")
        registry.removeRegistryFunction(uuid: uuid3)

        vc = registry.createViewController(from: 0, context: "Things")
        XCTAssertEqual(vc!.title, "function 1")
        registry.removeRegistryFunction(uuid: uuid4)
    }

    func testRegistryDelegateHeldWeakly() {
        var delegate: RegistryTests_RegistryDelegate? = RegistryTests_RegistryDelegate()
        registry.delegate = delegate

        XCTAssertNotNil(registry.delegate)

        delegate = nil

        XCTAssertNil(registry.delegate)
    }

    func testRegistryDelegate() {
        let delegate = RegistryTests_RegistryDelegate()
        registry.delegate = delegate

        let uuid1 = registry.add(registryFunction: createFunction(limit: 10))
        let uuid2 = registry.add(registryFunction: createFunctionWithContext(limit: 10))

        let vc1 = registry.createViewController(from: 1)
        let vc2 = registry.createViewController(from: 1, context: "Things")
        let vc3 = registry.createViewController(from: 11)
        let vc4 = registry.createViewController(from: 11, context: "Things")
        XCTAssertNotNil(vc1)
        XCTAssertNotNil(vc2)
        XCTAssertNil(vc3)
        XCTAssertNil(vc4)

        XCTAssertEqual(delegate.successfulCreations.count, 2)

        XCTAssertEqual(delegate.successfulCreations[0].0, vc1)
        XCTAssertEqual(delegate.successfulCreations[0].1, 1)
        XCTAssertNil(delegate.successfulCreations[0].2)

        XCTAssertEqual(delegate.successfulCreations[1].0, vc2)
        XCTAssertEqual(delegate.successfulCreations[1].1, 1)
        XCTAssertEqual(delegate.successfulCreations[1].2, "Things")

        XCTAssertEqual(delegate.unsuccessfulCreations.count, 2)

        XCTAssertEqual(delegate.unsuccessfulCreations[0].0, 11)
        XCTAssertNil(delegate.unsuccessfulCreations[0].1)

        XCTAssertEqual(delegate.unsuccessfulCreations[1].0, 11)
        XCTAssertEqual(delegate.unsuccessfulCreations[1].1, "Things")

        registry.removeRegistryFunction(uuid: uuid1)
        registry.removeRegistryFunction(uuid: uuid2)
    }
}

private extension RegistryTests {
    // MARK: - Test functions

    func createFunction(limit: Int) -> (Int) -> UIViewController? {
        return { token in
            guard token <= limit else {
                return nil
            }

            let vc = UIViewController()
            vc.title = "function \(limit)"
            return vc
        }
    }

    func createFunctionWithContext(limit: Int) -> (Int, String) -> UIViewController? {
        return { token, _ in
            guard token <= limit else {
                return nil
            }

            let vc = UIViewController()
            vc.title = "functionWithContext \(limit)"
            return vc
        }
    }
}

private class RegistryTests_RegistryDelegate: RegistryDelegate {
    var successfulCreations = [(UIViewController, Int, String?)]()
    var unsuccessfulCreations = [(Int, String?)]()

    func registryDidCreateViewController(_ viewController: UIViewController, from token: Any, context: Any?) {
        successfulCreations.append((viewController, token as! Int, context as! String?))
    }

    func registryDidNotCreateViewControllerFrom(_ token: Any, context: Any?) {
        unsuccessfulCreations.append((token as! Int, context as! String?))
    }
}
