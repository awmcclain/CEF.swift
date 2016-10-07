//
//  CEFInsets.swift
//  CEF.swift
//
//  Created by Tamas Lustyik on 2016. 05. 03..
//  Copyright © 2016. Tamas Lustyik. All rights reserved.
//

import Foundation

/// Structure representing insets.
/// CEF name: `cef_insets_t`
public struct CEFInsets {
    /// CEF name: `top`
    public let top: Int
    /// CEF name: `left`
    public let left: Int
    /// CEF name: `bottom`
    public let bottom: Int
    /// CEF name: `right`
    public let right: Int
}

extension CEFInsets {
    func toCEF() -> cef_insets_t {
        return cef_insets_t(top: Int32(top), left: Int32(left), bottom: Int32(bottom), right: Int32(right))
    }
    
    static func fromCEF(_ value: cef_insets_t) -> CEFInsets {
        return CEFInsets(top: Int(value.top), left: Int(value.left), bottom: Int(value.bottom), right: Int(value.right))
    }
}
