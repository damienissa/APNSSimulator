//
//  Push.swift
//  Core
//
//  Created by Dima Virych on 08.05.2020.
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
