//
//  GameScene.swift
//  CarTest2
//
//  Created by Alex on 04/03/2017.
//  Copyright © 2017 Alexey Kostyurin. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    var player:SKSpriteNode!
    var touching:Bool!
    var cameraNode: SKCameraNode!
    override init(size:CGSize){
        super.init(size: size)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func sceneDidLoad() {

        
        let yPos : CGFloat = self.frame.size.height * 0.10
        let startPoint = CGPoint(x: 0, y: yPos)
        let endPoint = CGPoint(x: 8000, y: yPos+90)
        physicsBody = SKPhysicsBody(edgeFrom: startPoint, to: endPoint)
        physicsBody?.restitution = 0.3
        
    }
    func setup(){
        touching = false
        let playerSize = CGSize(width: 20, height: 20)
        player = SKSpriteNode(texture: nil, color: UIColor.red, size: playerSize)
        self.addChild(player)
        player.position.x = 200
        player.position.y = 200
        player.physicsBody =  SKPhysicsBody(rectangleOf: playerSize)
        player.physicsBody?.mass = 0.2
        
         cameraNode = SKCameraNode()
       // print(cameraNode.position.y)
        cameraNode.position.x = player.position.x
        cameraNode.position.y = self.frame.size.height / 2
        camera = cameraNode
        

      }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        touching = false

    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        touching = true

    }
    
    
    override func didMove(to view: SKView) {

    }
    override func update(_ currentTime: TimeInterval) {
        if touching == true {
            player.physicsBody?.applyForce(CGVector(dx: 100, dy: 900))
        }
        
    }
    override func didSimulatePhysics() {
        cameraNode.position.x = player.position.x
    }

}
