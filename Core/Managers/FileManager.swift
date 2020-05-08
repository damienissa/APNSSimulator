//
//  FileManager.swift
//  Core
//
//  Created by Dima Virych on 08.05.2020.
//  Copyright © 2020 Virych. All rights reserved.
//

import Foundation

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
