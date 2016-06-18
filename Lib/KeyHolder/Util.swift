//
//  Util.swift
//  KeyHolder
//
//  Created by 古林俊佑 on 2016/06/18.
//  Copyright © 2016年 Shunsuke Furubayashi. All rights reserved.
//

import Cocoa

final class Util {
    static func bundleImage(name: String) -> NSImage? {
        var bundle = NSBundle(identifier: "com.clipy-app.KeyHolder")
        if bundle == nil {
            bundle = NSBundle(identifier: "org.cocoapods.KeyHolder")
        }
        guard let resourceBundle = bundle else { return nil }
        return resourceBundle.imageForResource(name)
    }
}
