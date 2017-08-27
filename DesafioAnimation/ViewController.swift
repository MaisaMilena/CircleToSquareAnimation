//
//  ViewController.swift
//  DesafioAnimation
//
//  Created by Maisa Milena on 27/08/17.
//  Copyright © 2017 BEPiD. All rights reserved.
//

import UIKit

/**
    Foi utilizado a framework EasyAnimation, a qual estende UIKit, para auxiliar com a personalização das animações.
 */
class ViewController: UIViewController {

    @IBOutlet weak var viewAmarela: UIView!
    @IBOutlet weak var topConstraint: NSLayoutConstraint!
    @IBOutlet weak var sideConstraint: NSLayoutConstraint!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        moveDown()
    }
    
    // Todos os comentários aqui descritos também auxiliam os demais métodos, por isso, não serão repetidos
    func moveDown(){
        print("✨ Iniciou um ciclo ✨")
        print("Tocou embaixo na esquerda")
        
        /// Esse - 30 é adicionado ao final porque se ficasse só com o "frame height" ainda estava cortando o objeto
        topConstraint.constant = view.frame.size.height - viewAmarela.frame.height - 30
 
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 0, options: [], animations: {
            
            self.viewAmarela.backgroundColor = UIColor(red: 1, green: 209/255, blue: 25/255, alpha: 1)
            
            /// faz a transformação para que ocorra a rotação. Aqui define-se a rotação, na próxima animação ela é chamada atribuindo "CATransform3DIdentity" à layer.transform
            self.viewAmarela.layer.transform = CATransform3DConcat(
                /// a rotação é feita em 360 graus
                CATransform3DMakeRotation(CGFloat(Double.pi), 0.0, 0.0, 1.0),
                /// a escala não é mudada, entretanto se deixar sem essa linha ta erro kkkkkk
                CATransform3DMakeScale(1.0, 1.0, 1.0)
            )
            
            /// Muda-se a forma da viewAmarela para que seja circular, ou seja, a propriedade de cornerRadius recebe o comprimento da viewAmarela/2
            self.viewAmarela.layer.cornerRadius = self.viewAmarela.frame.width/2
            
            /// essa função é chamada para atualizar a nova constraint
            self.view.layoutIfNeeded()
            
        }) { (true) in
            
            /// depois que a animação anterior terminou com sucesso, chama a nova animação
            self.moveRight()
        }

    }
    
    func moveRight(){
        print("Tocou embaixo na direita")
        sideConstraint.constant = view.frame.size.width - viewAmarela.frame.width - 30
        
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 0, options: [], animations: {
            
            self.viewAmarela.backgroundColor = UIColor(red: 229/255, green: 204/255, blue: 1, alpha: 1)
            self.viewAmarela.layer.transform = CATransform3DIdentity

            self.viewAmarela.layer.cornerRadius = 0
            self.view.layoutIfNeeded()
            
        }) { (true) in
            self.moveUp()
        }
    }
    
    func moveUp(){
        print("Tocou o topo na direita")
        topConstraint.constant = 0
        
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 0, options: [], animations: {
            
            self.viewAmarela.backgroundColor = UIColor(red: 1, green: 209/255, blue: 25/255, alpha: 1)
            self.viewAmarela.layer.transform = CATransform3DConcat(
                CATransform3DMakeRotation(CGFloat(-Double.pi), 0.0, 0.0, 1.0),
                CATransform3DMakeScale(1.0, 1.0, 1.0)
            )

            self.viewAmarela.layer.cornerRadius = self.viewAmarela.frame.width/2
            self.view.layoutIfNeeded()
            
        }){ (true) in
            self.moveLeft()
        }
    }
    
    func moveLeft(){
        print("Tocou o topo na esquerda")
        sideConstraint.constant = 0
        
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 0, options: [], animations: {
            
            self.viewAmarela.backgroundColor = UIColor(red: 117/255, green: 242/255, blue: 98/255, alpha: 1)
            self.viewAmarela.layer.transform = CATransform3DIdentity
            self.viewAmarela.layer.cornerRadius = 0
            self.view.layoutIfNeeded()
            
        }) { (true) in
            self.moveDown()
        }
    }
    
}

