//
//  LocalizedAppStrings.swift
//  DogApi
//
//  Created by Sree Tej Peddaiahgari on 2/1/23.
//

import Foundation
func Localized(_ text: LocalizedAppStrings) -> String {
    return text.localized
}

// swiftlint:disable type_body_length
enum LocalizedAppStrings: String {
    // MARK: General Texts
    case loading          = "Loading"
    
    // MARK: Home
    case homeTitle        = "Home_Title"
    case typeOfView1      = "Type_Of_View_1"
    case typeOfView2      = "Type_Of_View_2"
    
    
    // MARK: ALl Dogs View
    case allDogsViewTitle = "All_Dogs_View_Title"
    
    var localized: String {
        return NSLocalizedString(self.rawValue, comment: "")
    }
    
}
