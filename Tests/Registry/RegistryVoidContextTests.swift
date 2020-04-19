//
//  RegistryVoidContextTests.swift
//  ProvidentTests
//
//  Created by Ceri Hughes on 19/04/2020.
//  Copyright © 2020 Ceri Hughes. All rights reserved.
//

import XCTest
import UIKit

@testable import Provident

class RegistryVoidContextTests: XCTestCase {
    private var registry: Registry<Int, Void>!

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

    // MARK: - Test functions

    private func createFunction(limit: Int) -> (Int, Void) -> UIViewController? {
        return { token, _ in
            guard token <= limit else {
                return nil
            }

            return UIViewController(title: "function \(limit)")
        }
    }
}
