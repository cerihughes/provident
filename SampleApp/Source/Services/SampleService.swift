//
//  SampleService.swift
//  App
//
//  Created by Ceri Hughes on 23/10/2020.
//

import UIKit

protocol SampleService {
    func doSomething()
}

class SampleServiceImplementation: SampleService {
    func doSomething() {
        print("Did something...")
    }
}
