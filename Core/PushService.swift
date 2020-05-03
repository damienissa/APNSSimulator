//
//  PushService.swift
//  Core
//
//  Created by Dima Virych on 02.05.2020.
//  Copyright © 2020 Virych. All rights reserved.
//

import Foundation

public struct Push {
    
    public let title: String
    public let body: String
    public let bage: Int
    public let appID: String
    
    public init(_ title: String?, body: String?, bage: Int?, appID: String) {
        
        self.title = title ?? ""
        self.body = body ?? ""
        self.bage = bage ?? 0
        self.appID = appID
    }
}

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
                "badge": \(push.bage)
            },
            
          },
            "Simulator Target Bundle": "\(push.appID)"
        }

        """)
        let str = "xcrun simctl push \(device.uuid) \(payload)"
        shell.execute(str)
    }
}

struct FileManager {
    
    static func makeFile(with body: String, fileName: String = "payload.apns") -> String {
        
        let docPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .allDomainsMask, true).first!.appending("/\(fileName)")
        try? body.write(to: URL(fileURLWithPath: docPath), atomically: true, encoding: .utf8)
        
        return docPath
    }
    
    static func makeFile(with data: Data, fileName: String = "payload.apns") -> String {
        
        let docPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .allDomainsMask, true).first!.appending("/\(fileName)")
        try? data.write(to: URL(fileURLWithPath: docPath))
        
        return docPath
    }
}
