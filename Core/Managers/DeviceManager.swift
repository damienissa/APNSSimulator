//
//  DeviceManager.swift
//  Core
//
//  Created by Dima Virych on 02.05.2020.
//  Copyright © 2020 Virych. All rights reserved.
//

import Foundation

public class DeviceManager: DeviceProvider {
    
    let parcer: Parsering
    let shell: Shell
    
    public init(parcer: Parsering, shell: Shell) {
        
        self.parcer = parcer
        self.shell = shell
    }
    
    public func getDeviceList() -> [Simulator] {
        
        parcer.parceDeviceList(from: shell.execute("instruments -s devices"))
    }
}
