//
//  ViewController.swift
//  Puhser
//
//  Created by Dima Virych on 03.05.2020.
//  Copyright © 2020 Virych. All rights reserved.
//

import Foundation
import Core

protocol ViewControllerProtocol {
    
    func getDeviceList() -> [Simulator]
    func makePush(_ push: Push, forDevice deviece: Simulator)
}

class ViewController: NSObject {
    
    // MARK: - Properties
    
    private let pushService: PushService = PushService(RealShell())
    private let provider: DeviceProvider = DeviceManager(parcer: Parcer(), shell: RealShell())
    
    private var devices: [Simulator] = []
    
    override init() {
        super.init()
        
        devices = provider.getDeviceList()
    }
}


// MARK: - ViewControllerProtocol

extension ViewController: ViewControllerProtocol {
    
    func getDeviceList() -> [Simulator] {
        
        devices
    }
    
    func makePush(_ push: Push, forDevice deviece: Simulator) {
        
        pushService.makePush(push, forDevice: deviece)
    }
}
