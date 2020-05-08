//
//  Shell.swift
//  Core
//
//  Created by Dima Virych on 08.05.2020.
//  Copyright © 2020 Virych. All rights reserved.
//

import Foundation

public protocol Shell {
    @discardableResult
    func execute(_ command: String) -> String
}
