//
//  CEFV8Accessor.g.swift
//  CEF.swift
//
//  Created by Tamas Lustyik on 2015. 07. 31..
//  Copyright © 2015. Tamas Lustyik. All rights reserved.
//

import Foundation

extension cef_v8accessor_t: CEFObject {
}

typealias CEFV8AccessorMarshaller = CEFMarshaller<CEFV8Accessor, cef_v8accessor_t>

extension CEFV8Accessor {
    func toCEF() -> UnsafeMutablePointer<cef_v8accessor_t> {
        return CEFV8AccessorMarshaller.pass(self)
    }

    static func fromCEF(ptr: UnsafeMutablePointer<cef_v8accessor_t>) -> CEFV8Accessor? {
        return CEFV8AccessorMarshaller.take(ptr)
    }
}

extension cef_v8accessor_t: CEFCallbackMarshalling {
    mutating func marshalCallbacks() {
        get = CEFV8Accessor_get
        set = CEFV8Accessor_set
    }
}

func CEFV8Accessor_get(ptr: UnsafeMutablePointer<cef_v8accessor_t>,
                       name: UnsafePointer<cef_string_t>,
                       object: UnsafeMutablePointer<cef_v8value_t>,
                       retval retvalPtr: UnsafeMutablePointer<UnsafeMutablePointer<cef_v8value_t>>,
                       exception excStrPtr: UnsafeMutablePointer<cef_string_t>) -> Int32 {
    guard let obj = CEFV8AccessorMarshaller.get(ptr) else {
        return 0
    }

    var retval: CEFV8Value? = nil
    var excStr: String? = nil
    
    let result = obj.get(CEFStringToSwiftString(name.memory),
                         object: CEFV8Value.fromCEF(object)!,
                         retval: &retval,
                         exception: &excStr)
    
    if result {
        if let retval = retval {
            retvalPtr.memory = retval.toCEF()
        } else {
            retvalPtr.memory = nil
        }
    }
    
    if let excStr = excStr {
        CEFStringSetFromSwiftString(excStr, cefString: excStrPtr)
    }
    
    return result ? 1 : 0
}

func CEFV8Accessor_set(ptr: UnsafeMutablePointer<cef_v8accessor_t>,
                       name: UnsafePointer<cef_string_t>,
                       object: UnsafeMutablePointer<cef_v8value_t>,
                       value: UnsafeMutablePointer<cef_v8value_t>,
                       exception excStrPtr: UnsafeMutablePointer<cef_string_t>) -> Int32 {
    guard let obj = CEFV8AccessorMarshaller.get(ptr) else {
        return 0
    }

    var excStr: String? = nil
    
    let result = obj.set(CEFStringToSwiftString(name.memory),
                         object: CEFV8Value.fromCEF(object)!,
                         value: CEFV8Value.fromCEF(value)!,
                         exception: &excStr)
    
    if let excStr = excStr {
        CEFStringSetFromSwiftString(excStr, cefString: excStrPtr)
    }
    
    return result ? 1 : 0
}

