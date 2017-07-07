//
//  CameraNodeParallax.swift
//  ParallaxTest
//
//  Created by Alex on 06/07/2017.
//  Copyright © 2017 Alexey Kostyurin. All rights reserved.
//

import SpriteKit
class CameraNodeParallax:SKCameraNode{
var backgroundNodes:[SKNode] = []
var backgroundNodesSpeedFactor:[CGVector] = [] // in relation to camera nodes speed

init(position:CGPoint) {
    super.init()
    self.position = position
}

required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
}

override var position : CGPoint {
    didSet {
        
        // Move your parallax backgrounds
        var i = 0
        for node in backgroundNodes {
            
            let positionChangeX = position.x-oldValue.x
            let positionChangeY = position.y-oldValue.y
            let changeX = positionChangeX*backgroundNodesSpeedFactor[i].dx
            let changeY = positionChangeY*backgroundNodesSpeedFactor[i].dy
            node.position = CGPoint(x:node.position.x+changeX,y:node.position.y+changeY)
            
            i += 1
        }
    }
}

func addParallaxBackgroundNode(background:SKNode, vector:CGVector) {
    backgroundNodes.append(background)
    backgroundNodesSpeedFactor.append(vector)
}
}
