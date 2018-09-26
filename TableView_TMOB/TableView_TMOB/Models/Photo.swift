//
//  Model.swift
//  TMOB
//
//  Created by Ahmet AYKAÇ on 26.09.2018.
//  Copyright © 2018 Ahmet AYKAÇ. All rights reserved.
//

import Foundation

struct Photo:Codable {
    var albumId : Int
    var id : Int
    var thumbnailUrl : String
    var title : String
    var url : String
}
