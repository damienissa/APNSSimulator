//
//  CustomView.swift
//  Puhser
//
//  Created by Dima Virych on 05.05.2020.
//  Copyright © 2020 Virych. All rights reserved.
//

import Cocoa
import Core

class CustomView: NSViewController {
    
    // MARK: - Outlets
    
    @IBOutlet var downButton: NSPopUpButton!
    @IBOutlet var bodyView: NSTextView!
    @IBOutlet var appIDField: NSTextField!
    
    
    // MARK: - Properties
    
    let controller: CustomViewControllerProtocol = ViewController()

    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    
    // MARK: - Methods
    
    private func setupView() {
        
        downButton.menu?.removeAllItems()
        let list = controller.getDeviceList()
        Array(0 ..< list.count).map { index in
            let item = NSMenuItem(title: list[index].name, action: #selector(didSelect(_:)), keyEquivalent: "")
            item.tag = index
            return item
        }.forEach {
            downButton?.menu?.addItem($0)
        }
        downButton.select(downButton.menu?.items.first)
        fillDefaults()
    }
    
    private func saveDefaults() {
        
        UserSettings.selectedDevice = downButton.title
        UserSettings.customAPS = bodyView.string
        UserSettings.appID = appIDField.stringValue
    }
    
    private func fillDefaults() {
        
        downButton.select(downButton.menu?.items.first(where: { $0.title == UserSettings.selectedDevice }))
        downButton.title = downButton.selectedItem?.title ?? ""
        bodyView.string = UserSettings.customAPS ?? ""
        appIDField.stringValue = UserSettings.appID ?? ""
    }
    
    
    // MARK: - Actions
    
    @IBAction private func send(_ sender: NSButton) {
        
        if let tag = downButton.selectedItem?.tag {
            
            controller.makePush(bodyView.string.replacingOccurrences(of: "”", with: "\"").replacingOccurrences(of: "“", with: "\""), forDevice: controller.getDeviceList()[tag], appID: appIDField.stringValue)
        }
    }
    
    @objc private func didSelect(_ item: NSMenuItem) {
        
        downButton.title = item.title
    }
}


// MARK: - NSTextFieldDelegate, NSTextViewDelegate

extension CustomView: NSTextFieldDelegate, NSTextViewDelegate {
    
    func controlTextDidChange(_ obj: Notification) {
        
        saveDefaults()
    }
    
    func textDidChange(_ notification: Notification) {
        
        saveDefaults()
    }
}

