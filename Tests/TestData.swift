//
//  TestData.swift
//  ProvidentTests
//
//  Created by Ceri Hughes on 02/12/2018.
//  Copyright © 2019 Ceri Hughes. All rights reserved.
//

@testable import Provident

class TestViewControllerProvider: SingleViewControllerProvider<String, Void> {
    var registered = false, unregistered = false
    var capturedServiceProviders: [String: ServiceProvider]?
    override func register(with registry: Registry<String, Void>) {
        super.register(with: registry)
        registered = true
    }

    override func configure(with serviceProviders: [String: ServiceProvider]) {
        capturedServiceProviders = serviceProviders
    }

    override func createViewController(token: String, context: Void) -> ViewController? {
        ViewController(title: token)
    }
}

class TestServiceProvider: ServiceProvider {
    override init(context: ServiceProviderCreationContext) {
        super.init(context: context)
        name = String(describing: TestServiceProvider.self)
    }
}

enum TestViewControllerProviderFactory {
    static var created = false
    static func createViewControllerProvider() -> ViewControllerProvider<String, Void> {
        created = true
        return TestViewControllerProvider()
    }
}

enum TestServiceProviderFactory {
    static var created = false
    static func createServiceProvider(context: ServiceProviderCreationContext) -> ServiceProvider {
        created = true
        return TestServiceProvider(context: context)
    }
}
