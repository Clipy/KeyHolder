# KeyHolder
![CI](https://github.com/Clipy/KeyHolder/workflows/Swift-Build/badge.svg)
[![Release version](https://img.shields.io/github/release/Clipy/KeyHolder.svg)](https://github.com/Clipy/KeyHolder/releases/latest)
[![License: MIT](https://img.shields.io/github/license/Clipy/KeyHolder.svg)](https://github.com/Clipy/KeyHolder/blob/master/LICENSE)

Record shortcuts in macOS, like Alfred App.

<img src="https://github.com/Clipy/KeyHolder/blob/master/Screenshots/double_tap_shortcut.png?raw=true" width="300">
<img src="https://github.com/Clipy/KeyHolder/blob/master/Screenshots/normal_shortcut.png?raw=true" width="300">

## Example
Set default key combo.
```swift
let recordView = RecordView(frame: CGRect.zero)
recordView.tintColor = NSColor(red: 0.164, green: 0.517, blue: 0.823, alpha: 1)
let keyCombo = KeyCombo(doubledModifiers: .command)
recordView.keyCombo = keyCombo
```

Some delegate methods
```swift
func recordViewShouldBeginRecording(_ recordView: RecordView) -> Bool
func recordView(_ recordView: RecordView, canRecordShortcut keyCombo: KeyCombo) -> Bool
func recordView(_ recordView: RecordView, didChangeKeyCombo keyCombo: KeyCombo?)
func recordViewDidEndRecording(_ recordView: RecordView)
```

Or you can use closures.
```swift
let recordView = RecordView(frame: CGRect.zero)
recordView.didChange = { keyCombo in
    guard let keyCombo = keyCombo else { return } // Clear shortcut
    // Changed new shortcut
}
```

## Dependencies
The source code is dependent on hotkey library.
- [Magnet](https://github.com/Clipy/Magnet)
- [Sauce](https://github.com/Clipy/Sauce)
