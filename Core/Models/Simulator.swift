//
//  Simulator.swift
//  Core
//
//  Created by Dima Virych on 02.05.2020.
//  Copyright © 2020 Virych. All rights reserved.
//

public struct Simulator {
    
    public let name: String
    public let uuid: String
    
    public init(container: String) {
        let splited = container.split(separator: "[")
        name = String(String(splited.first ?? "").dropLast())
        uuid = String(splited.last?.split(separator: "]").first ?? "")
    }
}
