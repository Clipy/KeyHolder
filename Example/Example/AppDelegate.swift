//
//  AppDelegate.swift
//
//  Example
//  GitHub: https://github.com/clipy
//  HP: https://clipy-app.com
//
//  Created by Econa77 on 2016/06/17.
//
//  Copyright © 2016-2018 Clipy Project.
//

import Cocoa
import KeyHolder
import Magnet

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var window: NSWindow!
    @IBOutlet weak var recordView: RecordView!

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        recordView.tintColor = NSColor(red: 0.164, green: 0.517, blue: 0.823, alpha: 1)
        let keyCombo = KeyCombo(doubledCocoaModifiers: .command)
        recordView.keyCombo = keyCombo
        recordView.delegate = self

        let hotKey = HotKey(identifier: "KeyHolderExample", keyCombo: keyCombo!, target: self, action: #selector(AppDelegate.hotkeyCalled))
        hotKey.register()
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        HotKeyCenter.shared.unregisterAll()
    }

    @objc func hotkeyCalled() {
        print("HotKey called!!!!")
    }

}

// MARK: - RecordView Delegate
extension AppDelegate: RecordViewDelegate {
    func recordViewShouldBeginRecording(_ recordView: RecordView) -> Bool {
        return true
    }

    func recordView(_ recordView: RecordView, canRecordKeyCombo keyCombo: KeyCombo) -> Bool {
        // You can customize validation
        return true
    }

    func recordViewDidClearShortcut(_ recordView: RecordView) {
        print("clear shortcut")
        HotKeyCenter.shared.unregisterHotKey(with: "KeyHolderExample")
    }

    func recordViewDidEndRecording(_ recordView: RecordView) {
        print("end recording")
    }

    func recordView(_ recordView: RecordView, didChangeKeyCombo keyCombo: KeyCombo) {
        HotKeyCenter.shared.unregisterHotKey(with: "KeyHolderExample")
        let hotKey = HotKey(identifier: "KeyHolderExample", keyCombo: keyCombo, target: self, action: #selector(AppDelegate.hotkeyCalled))
        hotKey.register()
    }
}
