//
//  PhysicsCategory.swift
//  CarTest2
//
//  Created by Alex on 04/03/2017.
//  Copyright © 2017 Alexey Kostyurin. All rights reserved.
//

import Foundation

struct PhyscisCategory {
    static let None:UInt32 = 0
    static let Player:UInt32 = 0b1
    static let Ground:UInt32 = 0b10
    static let Coin:UInt32 = 0b100
    static let Wheel:UInt32 = 0b1000
    static let Body:UInt32 = 0b10000
}
