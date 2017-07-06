//
//  GameViewController.swift
//  CarTest2
//
//  Created by Alex on 04/03/2017.
//  Copyright © 2017 Alexey Kostyurin. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let SKview = self.view as! SKView
        // Load the SKScene from 'GameScene.sks'
        let scene = GameScene(size: view.frame.size)
        // Set the scale mode to scale to fit the window
        scene.scaleMode = .aspectFill
        
        // Present the scene
        SKview.presentScene(scene)
        
        
        SKview.ignoresSiblingOrder = true
        
        SKview.showsFPS = true
        SKview.showsNodeCount = true
        SKview.showsPhysics = true
        
    }
    
    override var shouldAutorotate: Bool {
        return true
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
}
