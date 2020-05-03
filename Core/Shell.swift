//
//  Shell.swift
//  Core
//
//  Created by Dima Virych on 02.05.2020.
//  Copyright © 2020 Virych. All rights reserved.
//


public protocol Shell {
    @discardableResult
    func execute(_ command: String) -> String
}

public struct RealShell: Shell {
    
    public init() { }
    
    @discardableResult
    public func execute(_ command: String) -> String {
        
        let task = Process()
        task.launchPath = "/bin/bash"
        task.arguments = ["-c", command]

        let pipe = Pipe()
        task.standardOutput = pipe
        task.launch()

        let data = pipe.fileHandleForReading.readDataToEndOfFile()
        let output: String = NSString(data: data, encoding: String.Encoding.utf8.rawValue)! as String

        return output
    }
}
