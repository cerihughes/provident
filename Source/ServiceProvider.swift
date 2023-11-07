//
//  Created by Ceri Hughes on 24/11/2018.
//  Copyright © 2019 Ceri Hughes. All rights reserved.
//

import Foundation

public protocol ServiceProvider {
    var name: String { get }
}

public protocol ServiceProviderCreationContext {
    var launchOptions: LaunchOptions? { get }
}

class ServiceProviderCreationContextImplementation: ServiceProviderCreationContext {
    var launchOptions: LaunchOptions?
}
