//
//  Videojuego.swift
//  T3E3
//
//  Created by Cristian Contreras Velásquez on 18-03-16.
//  Copyright © 2016 Cristian Contreras Velásquez. All rights reserved.
//

import UIKit

import SpriteKit


class Videojuego: SKScene, SKPhysicsContactDelegate {
    
    let score = SKLabelNode(fontNamed:"Chalkduster")
    var target:SKSpriteNode!
    var puntos = 0
    var value:Float = 0.0
    
    enum ColliderType: UInt32 {
    case Player = 0
    case Target = 1
        
    }
    
    override func didMoveToView(view: SKView) {
        //Definimos la Física a utilizar
        
        self.physicsWorld.contactDelegate = self
        
        let size2 = CGRectMake(0.0, 0.0, self.frame.size.width, self.frame.size.height)
        
        self.physicsBody = SKPhysicsBody(edgeLoopFromRect: size2)
        
        //Definimos el Personaje
        
        let player = SKSpriteNode(color: UIColor.redColor(), size: CGSizeMake(100, 50))
        
        player.physicsBody = SKPhysicsBody(rectangleOfSize: CGSizeMake(100, 50))
        
        player.position = CGPoint(x: CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame));
        
        player.name = "Player"
        
        player.physicsBody?.categoryBitMask = ColliderType.Player.rawValue
        
        player.physicsBody?.collisionBitMask = ColliderType.Target.rawValue
        
        player.physicsBody?.contactTestBitMask = ColliderType.Target.rawValue
        
        self.addChild(player)
        
        //Definimos el Objetivo
        target = SKSpriteNode(color: UIColor.greenColor(), size: CGSizeMake(40, 20))
        target.physicsBody = SKPhysicsBody(rectangleOfSize: CGSizeMake(40, 20))
        target.physicsBody?.dynamic = false
        target.position = CGPointMake(200, 530)
        target.name = "Target"
        target.physicsBody?.categoryBitMask = ColliderType.Target.rawValue
        target.physicsBody?.collisionBitMask = ColliderType.Player.rawValue
        target.physicsBody?.contactTestBitMask = ColliderType.Player.rawValue
        self.addChild(target)
        //Secuencia que formará la acción de moverse
        
        let movimiento = SKAction.sequence([SKAction.moveTo(CGPointMake(0, 530), duration: 2.0),SKAction.moveTo(CGPointMake(self.frame.size.width, 530), duration: 2.0)])
        let movimientoConstante = SKAction.repeatActionForever(movimiento)
        
        target.runAction(movimientoConstante)
        
        //Slider utilizado para apuntar
        let slider = UISlider(frame: CGRectMake(0, 0, 325, 100))
        slider.addTarget(self, action: "manejarSlider:", forControlEvents: UIControlEvents.ValueChanged)
        slider.minimumValue = -50
        slider.maximumValue = 50
        view.addSubview(slider)
        
        //Mostrar la puntuación actual por pantalla
        
        score.text = "Puntuación: \(puntos)";
        score.name = "Puntos"
        score.fontSize = 50;
        score.position = CGPoint(x:CGRectGetMidX(self.frame),y:CGRectGetMidY(self.frame));
        
        self.addChild(score)
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?)
        {
            //Al tocar la pantalla disparamos el personaje
            var operation:CGFloat = 250.0
            operation *= (CGFloat)(self.value)
            
            self.childNodeWithName("Player")?.physicsBody?.applyForce(CGVectorMake(operation, 20000))
    }
    
    func didBeginContact(contact: SKPhysicsContact){
            //Calcular si los cuerpos han impactado
            var firstBody:SKPhysicsBody
            var secondBody:SKPhysicsBody
            if(contact.bodyA.categoryBitMask < contact.bodyB.categoryBitMask){
            firstBody = contact.bodyA
            secondBody = contact.bodyB
        }
            else{
            firstBody = contact.bodyB
            secondBody = contact.bodyA
            }
            if(firstBody.categoryBitMask == 1 && secondBody.categoryBitMask == 2){
            //En caso de impacto:
            //Actualizamos los puntos (borrar y añadir label)
            puntos++
            self.childNodeWithName("Puntos")?.removeFromParent()
            score.text = "Puntuación: \(puntos)";
            self.addChild(score)
            //Eliminar objetivo
            secondBody.node?.removeFromParent()
            //Esperar un segundo y hacerlo reaparecer
            let delay = SKAction.waitForDuration(1)
            let generar = SKAction.runBlock({
            self.addChild(self.target)
            })
            let secuencia = SKAction.sequence([delay,generar])
            self.runAction(secuencia)
            }
    }
    func manejarSlider(slider:UISlider){
        self.value = slider.value
        print("Slider_value: \(slider.value)")
    }
}