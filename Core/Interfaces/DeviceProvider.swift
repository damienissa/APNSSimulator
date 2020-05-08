//
//  DeviceProvider.swift
//  Core
//
//  Created by Dima Virych on 08.05.2020.
//  Copyright © 2020 Virych. All rights reserved.
//

import Foundation

public protocol DeviceProvider {
    func getDeviceList() -> [Simulator]
}
