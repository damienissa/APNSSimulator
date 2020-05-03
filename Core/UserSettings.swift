//
//  UserSettings.swift
//  Core
//
//  Created by Dima Virych on 03.05.2020.
//  Copyright © 2020 Virych. All rights reserved.
//

public struct UserSettings {
    
    @UDProperty(key: "psuhTitle")           public static var title: String?
    @UDProperty(key: "body")                public static var body: String?
    @UDProperty(key: "bage")                public static var bage: String?
    @UDProperty(key: "appID")               public static var appID: String?
    @UDProperty(key: "selectedDevice")      public static var selectedDevice: String?
}
