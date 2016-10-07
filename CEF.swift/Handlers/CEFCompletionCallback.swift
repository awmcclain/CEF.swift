//
//  CEFCompletionCallback.swift
//  CEF.swift
//
//  Created by Tamas Lustyik on 2015. 08. 02..
//  Copyright © 2015. Tamas Lustyik. All rights reserved.
//

import Foundation

/// Generic callback interface used for asynchronous completion.
/// CEF name: `CefCompletionCallback`
public protocol CEFCompletionCallback {
    
    /// Method that will be called once the task is complete.
    /// CEF name: `OnComplete`
    func onComplete()
    
}


public extension CEFCompletionCallback {
    
    func onComplete() {
    }
    
}
