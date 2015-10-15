//
//  CEFRunContextMenuCallback+Interop.g.swift
//  CEF.swift
//
//  This file was generated automatically from cef_context_menu_handler.h.
//

import Foundation

extension cef_run_context_menu_callback_t: CEFObject {}

/// Callback interface used for continuation of custom context menu display.
public class CEFRunContextMenuCallback: CEFProxy<cef_run_context_menu_callback_t> {
    override init?(ptr: UnsafeMutablePointer<cef_run_context_menu_callback_t>) {
        super.init(ptr: ptr)
    }
    
    static func fromCEF(ptr: UnsafeMutablePointer<cef_run_context_menu_callback_t>) -> CEFRunContextMenuCallback? {
        return CEFRunContextMenuCallback(ptr: ptr)
    }
}

