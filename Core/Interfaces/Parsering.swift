//
//  Parsering.swift
//  Core
//
//  Created by Dima Virych on 02.05.2020.
//  Copyright © 2020 Virych. All rights reserved.
//

public protocol Parsering {
    
    func parceDeviceList(from str: String) -> [Simulator]
}
