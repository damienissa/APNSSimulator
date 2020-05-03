//
//  Parcer.swift
//  Core
//
//  Created by Dima Virych on 02.05.2020.
//  Copyright © 2020 Virych. All rights reserved.
//

public struct Parcer: Parcering {
    
    public init() {}
    
    public func parceDeviceList(from str: String) -> [Simulator] {
        
        let arr = str.split(separator: "\n").filter { $0.contains(" (Simulator)") }.filter { !$0.contains("Watch") }.filter { !$0.contains("TV") }
        
        return arr.map { Simulator(container: String($0)) }
    }
}
