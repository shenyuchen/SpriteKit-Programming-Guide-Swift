//
//  ViewController.swift
//  SpriteWalkthrough
//
//  Created by hippo_san on 9/24/14.
//  Copyright (c) 2014 hippo_san. All rights reserved.
//

import UIKit
import SpriteKit

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
    let view = self.view as SKView
    view.showsFPS = true
    view.showsDrawCount = true
    view.showsNodeCount = true
  }
  
  override func viewWillAppear(animated: Bool) {
    let hello = HelloScene(size: CGSizeMake(768, 1024))
    let spriteView = self.view as SKView
    spriteView.presentScene(hello)
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

