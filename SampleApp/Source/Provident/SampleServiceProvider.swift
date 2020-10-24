//
//  SampleServiceProvider.swift
//  App
//
//  Created by Ceri Hughes on 22/10/2020.
//

import Provident

let sampleServiceProviderName = "sampleServiceProviderName"

class SampleServiceProvider: ServiceProvider {
    let loginService: LoginService = LoginServiceImplementation()

    override init(context: ServiceProviderCreationContext) {
        super.init(context: context)
        name = sampleServiceProviderName
    }
}
