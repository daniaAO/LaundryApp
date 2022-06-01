//
//  Location.swift
//  LaundryApp
//
//  Created by Dania Alogla on 22/10/1443 AH.
//

import Foundation

struct Location: Identifiable, Codable, Equatable{
    let id: UUID
    var name: String
    var description: String
    let latitude: Double
    let longitude: Double
    
}
