//
//  CEFDOMNode+Interop.g.swift
//  CEF.swift
//
//  This file was generated automatically from cef_dom.h.
//

import Foundation

extension cef_domnode_t: CEFObject {}

/// Class used to represent a DOM node. The methods of this class should only be
/// called on the render process main thread.
public class CEFDOMNode: CEFProxy<cef_domnode_t> {
    override init?(ptr: UnsafeMutablePointer<cef_domnode_t>) {
        super.init(ptr: ptr)
    }
    
    static func fromCEF(ptr: UnsafeMutablePointer<cef_domnode_t>) -> CEFDOMNode? {
        return CEFDOMNode(ptr: ptr)
    }
}

