//
//  SWCharacter.swift
//  APIApplication
//
//  Created by Mac on 04/12/2023.
//

import Foundation

struct SWCharacter: Identifiable, Codable, Hashable{
    
    var id = UUID().uuidString
    var name = ""
    var height = ""
    var mass = ""
    var birth_year = ""
    
    enum CodingKeys: CodingKey{
        case name, height,mass, birth_year
    }
}
