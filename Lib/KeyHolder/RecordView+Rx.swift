//
//  RecordView+Rx.swift
//  CoherentMac
//
//  Created by Loki on 7/10/18.
//  Copyright © 2018 checkazuja. All rights reserved.
//

import Cocoa
import RxSwift
import RxCocoa
import KeyHolder
import Magnet

#if os(macOS)

fileprivate class ViewDelegate : RecordViewDelegate {
    
    var observer: AnyObserver<KeyCombo?>
    
    init(observer: AnyObserver<KeyCombo?>) {
        self.observer = observer
    }
    
    func recordViewShouldBeginRecording(_ recordView: RecordView) -> Bool {
        return true
    }
    
    func recordView(_ recordView: RecordView, canRecordKeyCombo keyCombo: KeyCombo) -> Bool {
        return true
    }
    
    func recordViewDidClearShortcut(_ recordView: RecordView) {
        observer.onNext(nil)
    }
    
    func recordView(_ recordView: RecordView, didChangeKeyCombo keyCombo: KeyCombo) {
        observer.onNext(keyCombo)
    }
    
    func recordViewDidEndRecording(_ recordView: RecordView) {
        
    }
}

public extension Reactive where Base: RecordView {
    
    var keyCombo : ControlEvent<KeyCombo?> {
        let src = Observable<KeyCombo?>.create { observer in
            self.base.delegateStrong = ViewDelegate(observer: observer)
            
            return Disposables.create() {
                self.base.delegateStrong = nil
            }
        }
        
        return ControlEvent(events: src)
    }
}

#endif
