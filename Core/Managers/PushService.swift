//
//  PushService.swift
//  Core
//
//  Created by Dima Virych on 02.05.2020.
//  Copyright © 2020 Virych. All rights reserved.
//

import Foundation

public struct PushService {
    
    let shell: Shell
    
    public init(_ shell: Shell) {
        self.shell = shell
    }
    
    public func makePush(_ push: Push, forDevice device: Simulator) {
        
        let payload = FileManager.makeFile(with: """
        {
          "aps": {
            "alert": {
                "title": "\(push.title)",
                "body": "\(push.body)",
                "sound": "default",
            },
            "badge": \(push.bage)
          },
            "Simulator Target Bundle": "\(push.appID)"
        }
        """)
        let str = "xcrun simctl push \(device.uuid) \(payload)"
        shell.execute(str)
    }
    
    public func makePush(_ aps: String, forDevice device: Simulator, appID: String) {
        
        let payload = FileManager.makeFile(with: """
        {
          \(aps),
            "Simulator Target Bundle": "\(appID)"
        }

        """)
        let str = "xcrun simctl push \(device.uuid) \(payload)"
        shell.execute(str)
    }
}


