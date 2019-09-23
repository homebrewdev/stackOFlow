//
//  Entity.swift
//  stackOFlowApp
//
//  Created by Egor Devyatov on 16/09/2019.
//  Copyright © 2019 Egor Devyatov. All rights reserved.
//

import Foundation

struct Element : Codable {
    let items : [Items]
}

struct Items : Codable {
    let title         : String?
    let profile_image : String?
    let link          : String?
    let creation_date : Int?
    //let owner         : [String? : String?]
    let score         : Int?
    
    enum CodingKeys: String, CodingKey {
        case title         = "title"
        case profile_image = "profile_image"
        case link          = "link"
        case creation_date = "creation_date"
        case score         = "score"
        //case owner         = "owner"
    }
    
}

//struct Owners : Codable {
//    let display_name : String?
//    
//    enum CodingKeys: String, CodingKey {
//        case display_name = "display_name"
//    }
//}
