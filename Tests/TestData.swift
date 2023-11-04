//
//  Created by Ceri Hughes on 02/12/2018.
//  Copyright © 2019 Ceri Hughes. All rights reserved.
//

@testable import Provident

class TestViewControllerProvider: ViewControllerProvider {
    var registered = false, unregistered = false
    var capturedServiceProviders: [String: ServiceProvider]?

    func register(with registry: Registry<String, Void>) {
        registered = true
    }

    func configure(with serviceProviders: [String: ServiceProvider]) {
        capturedServiceProviders = serviceProviders
    }

    func createViewController(token: String, context: Void) -> ViewController? {
        ViewController(title: token)
    }
}

class TestServiceProvider: ServiceProvider {
    var name = String(describing: TestServiceProvider.self)

    required init(context: ServiceProviderCreationContext) {}
}

enum TestViewControllerProviderFactory {
    static var created = false
    static func createViewControllerProvider() -> any ViewControllerProvider<String, Void> {
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
