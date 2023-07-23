//
//  Registrar.swift
//  Provident
//
//  Created by Ceri Hughes on 23/11/2018.
//  Copyright © 2019 Ceri Hughes. All rights reserved.
//

import Foundation

public class Registrar<T, C> {
    public typealias ServiceProviderFunction = (ServiceProviderCreationContext) -> ServiceProvider
    public typealias ViewControllerProviderFunction = () -> any ViewControllerProvider<T, C>

    public let registry: Registry<T, C>

    public private(set) var serviceProviders = [String: ServiceProvider]()
    private(set) var viewControllerProviders = [any ViewControllerProvider<T, C>]()

    public init(registry: Registry<T, C>) {
        self.registry = registry
    }

    deinit {
        registry.reset()
    }

    public func resolve(
        serviceProviderFunctions: [ServiceProviderFunction],
        viewControllerProviderFunctions: [ViewControllerProviderFunction],
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

    func registerViewControllerProviders(functions: [ViewControllerProviderFunction]) {
        for function in functions {
            let viewControllerProvider = function()
            viewControllerProvider.register(with: registry)
            registry.add(registryFunction: viewControllerProvider.createViewController(token:context:))
            viewControllerProvider.configure(with: serviceProviders)
            viewControllerProviders.append(viewControllerProvider)
        }
    }
}