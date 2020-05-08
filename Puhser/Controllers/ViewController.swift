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
    func makePush(_ push: Push, forDevice device: Simulator)
}

protocol CustomViewControllerProtocol {
    
    func getDeviceList() -> [Simulator]
    func makePush(_ push: String, forDevice device: Simulator, appID: String)
}

class ViewController: NSObject {
    
    // MARK: - Properties
    
    private let pushService: PushService = PushService(ShellManager())
    private let provider: DeviceProvider = DeviceManager(parcer: ParseringManager(), shell: ShellManager())
    
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
    
    func makePush(_ push: Push, forDevice device: Simulator) {
        
        pushService.makePush(push, forDevice: device)
    }
}

extension ViewController: CustomViewControllerProtocol {
    
    func makePush(_ push: String, forDevice device: Simulator, appID: String) {
        
        pushService.makePush(push, forDevice: device, appID: appID)
    }
}
