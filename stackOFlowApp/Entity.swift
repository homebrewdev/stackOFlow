//
//  Entity.swift
//  stackOFlowApp
//
//  Created by Egor Devyatov on 16/09/2019.
//  Copyright © 2019 Egor Devyatov. All rights reserved.
//

import Foundation

struct Element : Decodable {
    let items : [Items]
}

struct Items : Decodable {
    let title : String?
    //let link : String?
    
    enum CodingKeys: String, CodingKey {
        case title = "title"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.title = try? container.decode(String.self, forKey: .title)
    }
}
