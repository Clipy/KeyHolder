//
//  AppDelegate.swift
//
//  Example
//  GitHub: https://github.com/clipy
//  HP: https://clipy-app.com
//
//  Copyright © 2015-2020 Clipy Project.
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
        recordView.delegate = self
        recordView.clearButtonMode = .whenRecorded
        restoreKeyCombo()
        recordView.beginRecording()
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        HotKeyCenter.shared.unregisterAll()
    }

    @objc func hotkeyCalled() {
        print("HotKey called!!!!")
    }

    private func restoreKeyCombo() {
        guard let data = UserDefaults.standard.data(forKey: "keyCombo") else { return }
        guard let keyCombo = try? JSONDecoder().decode(KeyCombo.self, from: data) else { return }
        recordView.keyCombo = keyCombo
        let hotKey = HotKey(identifier: "KeyHolderExample",
                            keyCombo: keyCombo,
                            target: self,
                            action: #selector(AppDelegate.hotkeyCalled))
        hotKey.register()
    }

    private func storeKeyCombo(with keyCombo: KeyCombo?) {
        let data = try? JSONEncoder().encode(keyCombo)
        UserDefaults.standard.set(data, forKey: "keyCombo")
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

    func recordView(_ recordView: RecordView, didChangeKeyCombo keyCombo: KeyCombo?) {
        storeKeyCombo(with: keyCombo)
        HotKeyCenter.shared.unregisterAll()
        guard let keyCombo = keyCombo else { return }
        let hotKey = HotKey(identifier: "KeyHolderExample",
                            keyCombo: keyCombo,
                            target: self,
                            action: #selector(AppDelegate.hotkeyCalled))
        hotKey.register()
    }

    func recordViewDidEndRecording(_ recordView: RecordView) {
        print("end recording")
    }
}
