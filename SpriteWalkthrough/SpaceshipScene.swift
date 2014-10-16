//
//  SpaceshipScene.swift
//  SpriteWalkthrough
//
//  Created by hippo_san on 9/25/14.
//  Copyright (c) 2014 hippo_san. All rights reserved.
//

import SpriteKit

class SpaceshipScene: SKScene {
  
  var contentCreated = false
  
  override func didMoveToView(view: SKView) {
    if (!contentCreated) {
      createSceneContents()
      contentCreated = true
    }
  }
  
  func createSceneContents() {
    self.backgroundColor = SKColor.blackColor()
    self.scaleMode = SKSceneScaleMode.AspectFit
    
    let spaceship = newSpaceship()
    spaceship.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame))
    
    self.addChild(spaceship)
    
    let makeRocks = SKAction.sequence([
      SKAction.runBlock(self.addRock),
      SKAction.waitForDuration(0.1, withRange: 0.15)
      ])
    
    self.runAction(SKAction.repeatActionForever(makeRocks))
  }
  
  func newSpaceship() -> SKSpriteNode {
    let hull = SKSpriteNode(imageNamed: "rocket.png")
    hull.physicsBody = SKPhysicsBody(rectangleOfSize: hull.size)
    hull.physicsBody!.dynamic = false
    
    let light1 = newLight()
    light1.position = CGPointMake(-28.0, 6.0)
    hull.addChild(light1)
    
    let light2 = newLight()
    light2.position = CGPointMake(28.0, 6.0)
    hull.addChild(light2)
    
    let hover = SKAction.sequence([
      SKAction.waitForDuration(1.0),
      SKAction.moveByX(100.0, y: 50.0, duration: 1.0),
      SKAction.waitForDuration(1.0),
      SKAction.moveByX(-100.0, y: -50.0, duration: 1.0)
      ])
    
    hull.runAction(hover)
    
    return hull
  }
  
  func newLight() -> SKSpriteNode {
    let light = SKSpriteNode(color: SKColor.yellowColor(), size: CGSizeMake(8, 8))
    
    let blink = SKAction.sequence([
      SKAction.fadeOutWithDuration(0.25),
      SKAction.fadeInWithDuration(0.25)
      ])
    
    let blinkTimes = SKAction.repeatActionForever(blink)
    
    light.runAction(blinkTimes)
    
    return light
  }
  
  func addRock() {
    let rock = SKSpriteNode(imageNamed: "rock.png")
    let randomWidth = CGFloat(arc4random()) % CGFloat(self.size.width)
    rock.xScale = 40.0 / rock.size.width
    rock.yScale = 40.0 / rock.size.height
    rock.position = CGPointMake(randomWidth, self.size.height - 50)
    rock.name = "rock"
    rock.physicsBody = SKPhysicsBody(rectangleOfSize: rock.size)
    rock.physicsBody!.usesPreciseCollisionDetection = true
    self.addChild(rock)
  }
}