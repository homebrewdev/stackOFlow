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
    
    enum CodingKeys: String, CodingKey {
        case title         = "title"
        case profile_image = "profile_image"
    }
    
//    init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        
//        self.title = try? container.decode(String.self, forKey: .title)
//    }
}
