//
//  GameScene.swift
//  T3E3
//
//  Created by Cristian Contreras Velásquez on 18-03-16.
//  Copyright (c) 2016 Cristian Contreras Velásquez. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    override func didMoveToView(view: SKView) {
        /* Definimos el Menú Principal */
        self.backgroundColor = UIColor(red: 0.15, green: 0.15, blue: 0.3,
        alpha: 1.0)
        let myLabel = SKLabelNode(fontNamed:"Chalkduster")
        myLabel.text = "Videojuego con SpriteKit";
        myLabel.fontSize = 20;
        myLabel.position = CGPoint(x:CGRectGetMidX(self.frame),
        y:CGRectGetMidY(self.frame));
        self.addChild(myLabel)
        let myLabel2 = SKLabelNode(fontNamed:"Chalkduster")
        myLabel2.text = "Toca para Empezar";
        myLabel2.fontSize = 15;
        myLabel2.position = CGPoint(x:CGRectGetMidX(self.frame),
        y:CGRectGetMidY(self.frame) - 100);
        self.addChild(myLabel2)
    }
    override func touchesBegan(touches: Set<UITouch>, withEvent event:
        UIEvent?) {
        //Al tocar la pantalla cambiamos la escena
        let transicion = SKTransition.doorsOpenVerticalWithDuration(1.0)
        let juego = Videojuego(size: self.size)
        self.scene?.view?.presentScene(juego, transition: transicion)
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
