//
//  Icon.swift
//  DuckAnswers
//
//  Created by Tristan Lopes on 30/06/2014.
//  Copyright (c) 2014 twlopes. All rights reserved.
//

import Foundation

class Icon {
    var url: NSURL?
    var height: String?
    var width: String?

    init(json : JSONValue) {
        height = json["height"].string
        width = json["width"].string
        url = NSURL.URLWithString(json["URL"].string)
    }
}