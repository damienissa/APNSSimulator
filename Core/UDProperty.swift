//
//  UDProperty.swift
//  FeedStoreChallenge
//
//  Created by Dima Virych on 01.02.2020.
//  Copyright © 2020 Essential Developer. All rights reserved.
//

import Foundation

@propertyWrapper
public struct UDProperty<Value> {
    
    let defaults: UserDefaults = UserDefaults(suiteName: "com.Core.Pusher")!
    let key: String
    
    public var wrappedValue: Value? {
        get { getValue() }
        set { set(newValue)}
    }
    
    private func getValue() -> Value? {

        defaults.value(forKey: key) as? Value
    }
    
    private func set(_ value: Value?) {
        
        defaults.set(value, forKey: key)
        defaults.synchronize()
    }
}
