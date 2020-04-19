//
//  TestData.swift
//  ProvidentTests
//
//  Created by Ceri Hughes on 02/12/2018.
//  Copyright © 2019 Ceri Hughes. All rights reserved.
//

import UIKit

@testable import Provident

class TestViewControllerProvider: ViewControllerProvider<String, Void> {
    var registered = false, unregistered = false
    var capturedServiceProviders: [String: ServiceProvider]?
    override func register(with registry: Registry<String, Void>) {
        super.register(with: registry)
        registered = true
    }

    override func unregister(from registry: Registry<String, Void>) {
        super.unregister(from: registry)
        unregistered = true
    }

    override func configure(with serviceProviders: [String: ServiceProvider]) {
        capturedServiceProviders = serviceProviders
    }

    override func createViewController(token: String, context: Void) -> UIViewController? {
        return UIViewController(title: token)
    }
}

class TestServiceProvider: ServiceProvider {
    override init(context: ServiceProviderCreationContext) {
        super.init(context: context)
        name = String(describing: TestServiceProvider.self)
    }
}

class TestViewControllerProviderFactory {
    static var created = false
    static func createViewControllerProvider() -> ViewControllerProvider<String, Void> {
        created = true
        return TestViewControllerProvider()
    }
}

class TestServiceProviderFactory {
    static var created = false
    static func createServiceProvider(context: ServiceProviderCreationContext) -> ServiceProvider {
        created = true
        return TestServiceProvider(context: context)
    }
}
