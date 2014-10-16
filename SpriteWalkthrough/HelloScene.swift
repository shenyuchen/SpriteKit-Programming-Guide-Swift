//
//  HelloScene.swift
//  SpriteWalkthrough
//
//  Created by hippo_san on 9/24/14.
//  Copyright (c) 2014 hippo_san. All rights reserved.
//

import Foundation
import SpriteKit

class HelloScene: SKScene {
  
  var contentCreated = false

  override func didMoveToView(view: SKView) {
    
    if (!self.contentCreated) {
      createSceneContents()
      self.contentCreated = true
    }
    
  }
  
  func newHelloNode() -> SKLabelNode {
    let helloNode = SKLabelNode(fontNamed: "Chalkduster")
    helloNode.text = "Hello, World!"
    helloNode.fontSize = 42
    helloNode.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame))
    helloNode.name = "helloNode"
    return helloNode
  }
  
  func createSceneContents() {
    self.backgroundColor = SKColor.blueColor()
    self.scaleMode = SKSceneScaleMode.AspectFit
    
    self.addChild(newHelloNode())
  }
  
  override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
    let helloNode = childNodeWithName("helloNode")
    if (helloNode != nil) {
      helloNode!.name = nil
      let action = SKAction.sequence([
        [SKAction.moveByX(0, y: 100.0, duration: 0.5)],
        [SKAction.scaleTo(2.0, duration: 0.25)],
        [SKAction.waitForDuration(0.5)],
        [SKAction.fadeOutWithDuration(0.25)],
        [SKAction.removeFromParent()]
        ])
      helloNode?.runAction(action) {
        let spaceshipScene = SpaceshipScene(size: self.size)
        let doors = SKTransition.crossFadeWithDuration(0.5)
        self.view?.presentScene(spaceshipScene, transition: doors)
      }
    }
  }
}
