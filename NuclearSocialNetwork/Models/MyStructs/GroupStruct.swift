//
//  GroupStruct.swift
//  NuclearSocialNetwork
//
//  Created by Hellizar on 10/4/20.
//

import UIKit

struct GroupStruct {
    var name : String
    var image : UIImage
}

extension GroupStruct : Equatable {
    static func == (first: GroupStruct, second: GroupStruct) -> Bool {
        return  first.name == second.name && first.image == second.image
    }
}
