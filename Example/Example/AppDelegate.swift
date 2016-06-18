//
//  AppDelegate.swift
//  Example
//
//  Created by 古林　俊祐　 on 2016/06/17.
//  Copyright © 2016年 Shunsuke Furubayashi. All rights reserved.
//

import Cocoa
import KeyHolder
import Magnet

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var window: NSWindow!
    @IBOutlet weak var recordView: RecordView!

    func applicationDidFinishLaunching(aNotification: NSNotification) {
        recordView.tintColor = NSColor(red: 0.164, green: 0.517, blue: 0.823, alpha: 1)
        let keyCombo = KeyCombo(doubledModifiers: .CommandKeyMask)
        recordView.keyCombo = keyCombo
        recordView.delegate = self

        let hotKey = HotKey(identifier: "KeyHolderExample", keyCombo: keyCombo!, target: self, action: #selector(AppDelegate.hotkeyCalled))
        hotKey.register()
    }

    func applicationWillTerminate(aNotification: NSNotification) {
        HotKeyCenter.sharedCenter.unregisterHotKey("KeyHolderExample")
    }

    func hotkeyCalled() {
        print("HotKey called!!!!")
    }

}

// MARK: - RecordView Delegate
extension AppDelegate: RecordViewDelegate {
    func recordViewShouldBeginRecording(recordView: RecordView) -> Bool {
        return true
    }

    func recordView(recordView: RecordView, canRecordShortcut keyCombo: KeyCombo) -> Bool {
        // You can customize validation
        HotKeyCenter.sharedCenter.unregisterHotKey("KeyHolderExample")
        let hotKey = HotKey(identifier: "KeyHolderExample", keyCombo: keyCombo, target: self, action: #selector(AppDelegate.hotkeyCalled))
        hotKey.register()
        return true
    }

    func recordViewDidClearShortcut(recordView: RecordView) {
        print("clear shortcut")
        HotKeyCenter.sharedCenter.unregisterHotKey("KeyHolderExample")
    }

    func recordViewDidEndRecording(recordView: RecordView) {
        print("end recording")
    }
}
