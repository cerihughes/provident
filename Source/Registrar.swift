//
//  Created by Ceri Hughes on 23/11/2018.
//  Copyright © 2019 Ceri Hughes. All rights reserved.
//

import Foundation

public class Registrar<T, C> {
    private let registryImplementation = RegistryImplementation<T, C>()
    public private(set) var serviceProviders = [String: ServiceProvider]()
    public private(set) var viewControllerProviders = [AnyViewControllerProvider<T, C>]()

    public init() {}

    deinit {
        registryImplementation.reset()
    }

    public var registry: AnyRegistry<T, C> { registryImplementation }

    public func resolve(
        serviceProviderFunctions: [ServiceProviderFunction],
        viewControllerProviderFunctions: [ViewControllerProviderFunction<T, C>],
        launchOptions: LaunchOptions? = nil
    ) {
        let context = ServiceProviderCreationContextImplementation()
        context.launchOptions = launchOptions
        createServiceProviders(functions: serviceProviderFunctions, context: context)
        registerViewControllerProviders(functions: viewControllerProviderFunctions)
    }

    public func resolve(resolver: some Resolver<T, C>, launchOptions: LaunchOptions? = nil) {
        resolve(
            serviceProviderFunctions: resolver.serviceProviderFunctions(),
            viewControllerProviderFunctions: resolver.viewControllerProviderFunctions()
        )
    }

    func createServiceProviders(functions: [ServiceProviderFunction], context: ServiceProviderCreationContext) {
        for function in functions {
            let serviceProvider = function(context)
            let name = serviceProvider.name
            serviceProviders[name] = serviceProvider
        }
    }

    func registerViewControllerProviders(functions: [ViewControllerProviderFunction<T, C>]) {
        for function in functions {
            let viewControllerProvider = function()
            viewControllerProvider.register(with: registryImplementation)
            registryImplementation.add(registryFunction: viewControllerProvider.createViewController(token:context:))
            viewControllerProvider.configure(with: serviceProviders)
            viewControllerProviders.append(viewControllerProvider)
        }
    }
}
