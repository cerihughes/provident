//
//  Created by Ceri Hughes on 19/04/2020.
//  Copyright © 2020 Ceri Hughes. All rights reserved.
//

@testable import Provident

extension ViewController {
    convenience init(title: String) {
        self.init()
        self.title = title
    }
}
