//
//  World.swift
//  SpriteWalkthrough
//
//  Created by hippo_san on 10/1/14.
//  Copyright (c) 2014 hippo_san. All rights reserved.
//

import SpriteKit

class World: SKScene {
  
  let debugOverlay = SKSpriteNode(color: SKColor.blueColor(), size: CGSizeMake(1024, 768))
  
  override func didMoveToView(view: SKView) {
    self.anchorPoint = CGPointMake(0.5, 0.5)
    
    let myWorld = SKNode()
    self.addChild(myWorld)
    
    let camera = SKNode()
    camera.name = "camera"
    myWorld.addChild(camera)
    
    self.addChild(self.debugOverlay)
  }
  
  override func didFinishUpdate() {
//    self.centerOnNode(self.childNodeWithName("camera")!)
    
    self.addChild(self.debugOverlay)
    
    let gravityLine = SKShapeNode()
    gravityLine.position = CGPointMake(200, 200)
    
    let path = CGPathCreateMutable()
    CGPathMoveToPoint(path, nil, 0, 0)
    CGPathAddLineToPoint(path, nil, self.physicsWorld.gravity.dx * 10, self.physicsWorld.gravity.dy * 10)
    CGPathCloseSubpath(path)
    
    gravityLine.path = path
    
    self.debugOverlay.addChild(gravityLine)
  }
  
  func centerOnNode(node: SKNode) {
    
    let cameraPositionInScene = node.scene?.convertPoint(node.position, fromNode: node.parent!)
    node.parent?.position = CGPointMake(node.parent!.position.x - cameraPositionInScene!.x, node.parent!.position.y - cameraPositionInScene!.y)
  }
  
  override func update(currentTime: NSTimeInterval) {
    self.debugOverlay.removeFromParent()
    self.debugOverlay.removeAllChildren()
  }
}