//
//  DeviceManager.swift
//  Core
//
//  Created by Dima Virych on 02.05.2020.
//  Copyright © 2020 Virych. All rights reserved.
//

import Foundation

public protocol DeviceProvider {
    func getDeviceList() -> [Simulator]
}

public class DeviceManager: DeviceProvider {
    
    let parcer: Parcering
    let shell: Shell
    
    public init(parcer: Parcering, shell: Shell) {
        
        self.parcer = parcer
        self.shell = shell
    }
    
    public func getDeviceList() -> [Simulator] {
        
        parcer.parceDeviceList(from: shell.execute("instruments -s devices"))
    }
}
