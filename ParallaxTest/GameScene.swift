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
    var oldCameraPosition:CGPoint!
    
    // backgrounds
    
    var bgrNode: SKSpriteNode!
    var bgrNode2: SKSpriteNode!

    var endLessCamera: CameraNodeParallax!
    
    
    var bgr:ParallaxBackgroundMover!
    var bgr2:ParallaxBackgroundMover!
    
    override init(size:CGSize){
        super.init(size: size)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func sceneDidLoad() {
        touching = false
        let playerSize = CGSize(width: 20, height: 20)
        player = SKSpriteNode(texture: nil, color: UIColor.red, size: playerSize)
        self.addChild(player)
        player.position.x = 200
        player.position.y = 200
        player.physicsBody =  SKPhysicsBody(rectangleOf: playerSize)
        player.physicsBody?.mass = 0.2
        player.zPosition = 2
        
        cameraNode = SKCameraNode()
        // print(cameraNode.position.y)
       
        
        let yPos : CGFloat = self.frame.size.height * 0.10
        let startPoint = CGPoint(x: 0, y: yPos)
        let endPoint = CGPoint(x: 8000, y: yPos+90)
        physicsBody = SKPhysicsBody(edgeFrom: startPoint, to: endPoint)
        physicsBody?.restitution = 0.3
        
        bgrNode = SKSpriteNode(imageNamed: "bg1_1")
        bgrNode.anchorPoint = CGPoint.zero
        //    bgrNode.position = CGPoint(x: self.frame.width/2, y:0)
        
        addChild(bgrNode)
        bgrNode.zPosition = 1
        
        bgrNode2 = SKSpriteNode(imageNamed: "bg2")
        bgrNode2.anchorPoint = CGPoint.zero
        //    bgrNode.position = CGPoint(x: self.frame.width/2, y:0)
        
        addChild(bgrNode2)
        bgrNode2.zPosition = 2
        
        bgr = ParallaxBackgroundMover(background: bgrNode, relativeSpeedToCamera: CGVector(dx:0.9, dy:0))
        
        bgr2 = ParallaxBackgroundMover(background: bgrNode2, relativeSpeedToCamera: CGVector(dx:0.7, dy:0))
        

    }
    func setup(){
                endLessCamera = CameraNodeParallax(position: player.position)
        
        endLessCamera.addParallaxBackgroundNode(background: bgrNode, vector: CGVector(dx: 0.2, dy: 1))
        
        endLessCamera.position.x = player.position.x
        endLessCamera.position.y = self.frame.size.height / 2
        camera = endLessCamera
        oldCameraPosition = cameraNode.position
        

        
        
        

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
            player.physicsBody?.applyForce(CGVector(dx: 100, dy: 400))
        }
       endLessCamera.position.x = player.position.x
        
    }
    override func didSimulatePhysics() {
 //       bgr.triggerChange(newCameraPosition: player.position, oldCameraPosition: cameraNode.position)
  //      cameraNode.position.x = player.position.x
        
        
        //cameraNode.position.x = player.position.x
  //      oldCameraPosition = cameraNode.position
    }

}
