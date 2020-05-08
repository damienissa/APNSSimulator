//
//  View.swift
//  Puhser
//
//  Created by Dima Virych on 02.05.2020.
//  Copyright © 2020 Virych. All rights reserved.
//

import Cocoa
import Core

class View: NSViewController {
    
    // MARK: - Outlets
    
    @IBOutlet var downButton: NSPopUpButton!
    @IBOutlet var titleField: NSTextField!
    @IBOutlet var bodyView: NSTextView!
    @IBOutlet var bageField: NSTextField!
    @IBOutlet var appIDField: NSTextField!
    
    
    // MARK: - Properties
    
    let controller: ViewControllerProtocol = ViewController()

    
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
        UserSettings.title = titleField.stringValue
        UserSettings.body = bodyView.string
        UserSettings.bage = bageField.stringValue
        UserSettings.appID = appIDField.stringValue
    }
    
    private func fillDefaults() {
        
        downButton.select(downButton.menu?.items.first(where: { $0.title == UserSettings.selectedDevice }))
        downButton.title = downButton.selectedItem?.title ?? ""
        titleField.stringValue = UserSettings.title ?? ""
        bodyView.string = UserSettings.body ?? ""
        bageField.stringValue = UserSettings.bage ?? ""
        appIDField.stringValue = UserSettings.appID ?? ""
    }
    
    
    // MARK: - Actions
    
    @IBAction private func send(_ sender: NSButton) {
        
        if let tag = downButton.selectedItem?.tag {
            
            controller.makePush(Push.init(titleField.stringValue, body: bodyView.string, bage: Int(bageField.stringValue), appID: appIDField.stringValue), forDevice: controller.getDeviceList()[tag])
        }
    }
    
    @objc private func didSelect(_ item: NSMenuItem) {
        
        downButton.title = item.title
    }
}


// MARK: - NSTextFieldDelegate, NSTextViewDelegate

extension View: NSTextFieldDelegate, NSTextViewDelegate {
    
    func controlTextDidChange(_ obj: Notification) {
        
        saveDefaults()
    }
    
    func textDidChange(_ notification: Notification) {
        
        saveDefaults()
    }
}
