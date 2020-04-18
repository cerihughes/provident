//
//  ServiceProviderCreationContext.swift
//  Provident
//
//  Created by Ceri Hughes on 06/01/2019.
//  Copyright © 2019 Ceri Hughes. All rights reserved.
//

import Foundation

public protocol ServiceProviderCreationContext {
    var launchOptions: LaunchOptions { get }
}

internal class ServiceProviderCreationContextImplementation: ServiceProviderCreationContext {
    var launchOptions: LaunchOptions

    init(launchOptions: LaunchOptions) {
        self.launchOptions = launchOptions
    }
}
