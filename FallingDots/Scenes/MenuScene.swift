//
//  MenuScene.swift
//  FallingDots
//
//  Created by Matthew Huie on 2/12/19.
//  Copyright © 2019 Matthew Huie. All rights reserved.
//

import SpriteKit
import UIKit

class MenuScene: SKScene {

    let background = SKSpriteNode(imageNamed: "DotsBackgroundCrop3")
    let titleLabel = SKLabelNode(text: "Dots Dropper")
    let easyLabel = SKLabelNode(text: "Easy")
    let mediumLabel = SKLabelNode(text: "Medium")
    let hardLabel = SKLabelNode(text: "Hard")
    let hiScoreLabel = SKLabelNode(text: "Hi-Scores")
    let tutorialLabel = SKLabelNode(text: "How to Play")
    
    override func didMove(to view: SKView) {
        backgroundColor = UIColor(red: 44/255, green: 62/255, blue: 80/255, alpha: 1.0)
        let backgroundSound = SKAudioNode(fileNamed: "Mining by Moonlight.mp3")
        self.addChild(backgroundSound)
        addMenuUI()

    }
    
    func addMenuUI() {
        
        background.size = CGSize(width: frame.size.width, height: frame.size.height)
        background.zPosition = 0
        background.position = CGPoint(x: frame.size.width / 2, y: frame.size.height / 2)
        addChild(background)
        
        titleLabel.fontName = "MarkerFelt-Wide"
        titleLabel.fontSize = 50.0
        titleLabel.fontColor = .white
        titleLabel.zPosition = 1
        titleLabel.position = CGPoint(x: frame.midX, y: frame.midY + titleLabel.frame.size.height*5)
        addChild(titleLabel)
        
        easyLabel.fontName = "MarkerFelt-Thin"
        easyLabel.fontSize = 40.0
        easyLabel.fontColor = .white
        easyLabel.zPosition = 1
        easyLabel.position = CGPoint(x: frame.midX, y: frame.midY + easyLabel.frame.size.height)
        addChild(easyLabel)
        animate(label: easyLabel)
        
        mediumLabel.fontName = "MarkerFelt-Thin"
        mediumLabel.fontSize = 40.0
        mediumLabel.fontColor = .white
        mediumLabel.zPosition = 1
        mediumLabel.position = CGPoint(x: frame.midX, y: frame.midY - mediumLabel.frame.size.height/2)
        addChild(mediumLabel)
        animate(label: mediumLabel)
        
        hardLabel.fontName = "MarkerFelt-Thin"
        hardLabel.fontSize = 40.0
        hardLabel.fontColor = .white
        hardLabel.zPosition = 1
        hardLabel.position = CGPoint(x: frame.midX, y: frame.midY - hardLabel.frame.size.height*2.1)
        addChild(hardLabel)
        animate(label: hardLabel)
        
        hiScoreLabel.fontName = "MarkerFelt-Thin"
        hiScoreLabel.fontSize = 30.0
        hiScoreLabel.fontColor = .white
        hiScoreLabel.zPosition = 1
        hiScoreLabel.position = CGPoint(x: frame.midX, y: frame.midY - hiScoreLabel.frame.size.height*8)
        addChild(hiScoreLabel)
        animate(label: hiScoreLabel)
        
        tutorialLabel.fontName = "MarkerFelt-Thin"
        tutorialLabel.fontSize = 30.0
        tutorialLabel.fontColor = .white
        tutorialLabel.zPosition = 1
        tutorialLabel.position = CGPoint(x: frame.midX, y: frame.midY - tutorialLabel.frame.size.height*9.5)
        addChild(tutorialLabel)
        animate(label: tutorialLabel)
      
    }
    
    func animate(label: SKLabelNode) {
        let scaleUp = SKAction.scale(to: 1.1, duration: 0.5)
        let scaleDown = SKAction.scale(to: 1.0, duration: 0.5)
        let sequence = SKAction.sequence([scaleUp, scaleDown])
        label.run(SKAction.repeatForever(sequence))
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            if easyLabel.contains(location) {
                let gameScene = GameScene(size: view!.bounds.size)
                gameScene.fallingSpeed = -3
                gameScene.difficulty = "easy"
                view!.presentScene(gameScene)
            } else if mediumLabel.contains(location) {
                let gameScene = GameScene(size: view!.bounds.size)
                gameScene.fallingSpeed = -5
                gameScene.difficulty = "medium"
                view!.presentScene(gameScene)
            } else if hardLabel.contains(location) {
                let gameScene = GameScene(size: view!.bounds.size)
                gameScene.difficulty = "hard"
                gameScene.fallingSpeed = -7
                view!.presentScene(gameScene)
            } else if hiScoreLabel.contains(location) {
                let hiScoreScene = HiScoreScene(size: view!.bounds.size)
                view!.presentScene(hiScoreScene)
            } else if tutorialLabel.contains(location) {
                let tutorialScene = TutorialScene(size: view!.bounds.size)
                view!.presentScene(tutorialScene)
               
            }
            
        }
        
    }
}
