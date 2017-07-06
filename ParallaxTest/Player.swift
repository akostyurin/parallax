//
//  Player.swift
//  CarTest2
//
//  Created by Alex on 04/03/2017.
//  Copyright © 2017 Alexey Kostyurin. All rights reserved.
//

import SpriteKit

class Player: SKSpriteNode {
    var chassis:SKSpriteNode
    init(){
        
        
        chassis = SKSpriteNode.init(color: UIColor.white, size: CGSize(width:50, height:50))
        let playerSize = CGSize(width: 40, height: 60)
        super.init(texture: nil, color: UIColor.blue, size: playerSize)
        setup()
      
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setup(){
        
       

   //     self.anchorPoint = CGPoint(x:0, y:0)
        physicsBody = SKPhysicsBody(rectangleOf: size)
        physicsBody?.categoryBitMask = PhyscisCategory.Player
        physicsBody?.collisionBitMask = PhyscisCategory.Ground
        physicsBody?.contactTestBitMask = PhyscisCategory.Coin
                let a = SKSpriteNode(texture: nil, color: UIColor.red, size: CGSize(width: 10, height: 10))
        
        
        
        //a.physicsBody?.isDynamic = false
        a.position.x = self.position.x
        a.position.y = self.position.y

        a.physicsBody = SKPhysicsBody(circleOfRadius: 10)
     //   a.physicsBody?.isDynamic = false
     
        self.addChild(a)
        
        print(self.position)
       
       
        self.zPosition = 99
    }
}
