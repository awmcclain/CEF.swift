//
//  CEFResourceBundle.swift
//  CEF.swift
//
//  Created by Tamas Lustyik on 2015. 10. 15..
//  Copyright © 2015. Tamas Lustyik. All rights reserved.
//

import Foundation

extension CEFResourceBundle {
    
    /// Returns the global resource bundle instance.
    public static var globalBundle: CEFResourceBundle? {
        let cefBundle = cef_resource_bundle_get_global()
        return CEFResourceBundle.fromCEF(cefBundle)
    }
    
    /// Returns the localized string for the specified |string_id| or an empty
    /// string if the value is not found. Include cef_pack_strings.h for a listing
    /// of valid string ID values.
    public func localizedStringForID(stringID: Int) -> String? {
        let cefStrPtr = cefObject.get_localized_string(cefObjectPtr, Int32(stringID))
        defer { CEFStringPtrRelease(cefStrPtr) }
        return cefStrPtr != nil ? CEFStringToSwiftString(cefStrPtr.memory) : nil
    }
    
    /// Retrieves the contents of the specified scale independent |resource_id|.
    /// If the value is found then |data| and |data_size| will be populated and
    /// this method will return true. If the value is not found then this method
    /// will return false. The returned |data| pointer will remain resident in
    /// memory and should not be freed. Include cef_pack_resources.h for a listing
    /// of valid resource ID values.
    public func dataResourceForID(resourceID: Int) -> (dataBufferPtr: UnsafeMutablePointer<Void>, dataSize: size_t)? {
        var dataPtr: UnsafeMutablePointer<Void> = nil
        var size: size_t = 0
        let result = cefObject.get_data_resource(cefObjectPtr, Int32(resourceID), &dataPtr, &size)
        return result != 0 ? (dataPtr, size) : nil
    }
    
    /// Retrieves the contents of the specified |resource_id| nearest the scale
    /// factor |scale_factor|. Use a |scale_factor| value of SCALE_FACTOR_NONE for
    /// scale independent resources or call GetDataResource instead. If the value
    /// is found then |data| and |data_size| will be populated and this method will
    /// return true. If the value is not found then this method will return false.
    /// The returned |data| pointer will remain resident in memory and should not
    /// be freed. Include cef_pack_resources.h for a listing of valid resource ID
    /// values.
    public func dataResourceForID(resourceID: Int, scale: CEFScaleFactor) -> (dataBufferPtr: UnsafeMutablePointer<Void>, dataSize: size_t)? {
        var dataPtr: UnsafeMutablePointer<Void> = nil
        var size: size_t = 0
        let result = cefObject.get_data_resource_for_scale(cefObjectPtr,
                                                           Int32(resourceID),
                                                           scale.toCEF(),
                                                           &dataPtr,
                                                           &size)
        return result != 0 ? (dataPtr, size) : nil
    }

}
