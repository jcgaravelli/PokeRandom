//
//  ViewController.swift
//  Poke Random
//
//  Created by Júlio César Garavelli on 25/04/15.
//  Copyright (c) 2015 Júlio César Garavelli. All rights reserved.
//

import UIKit
import QuartzCore

class pokerandom: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "camp.png")!)
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
        
    override func viewWillAppear(animated: Bool) {
        
        let pokeballopen = UIImageView(image: UIImage(named: "pokeballopen.png"))
        pokeballopen.contentMode = .ScaleAspectFit
        pokeballopen.frame = view.frame
        var X_Co = self.view.frame.size.width - 170
        var Y_Co = self.view.frame.size.height - 130
        pokeballopen.frame = CGRectMake(X_Co, Y_Co,200,130)

        view.addSubview(pokeballopen)
        
        randomPokemon(pokeballopen)
        
    }
    
    
    func randomPokemon(imageView: UIImageView) {
        
        //Pokemon Random
        
        let random = Int(arc4random_uniform(8))
        
        var pokename = "00"
        pokename += String(random)
        pokename += ".png"
        
        let pokemon = UIImageView(image: UIImage (named:pokename))
        pokemon.contentMode = .ScaleAspectFit
        pokemon.frame = view.frame
        pokemon.alpha = 0.0
        
        view.insertSubview(pokemon, aboveSubview: imageView)
        
        UIView.animateWithDuration(3.0, delay: 1.0, options: .CurveEaseOut, animations: {
            pokemon.alpha = 1.0
            }, completion: {_ in
                imageView.image = nil //pokemon.image
//Remove a imagem central do pokemon
//                pokemon.removeFromSuperview()
                
                let image = UIImage(named: "pokeball") as UIImage!
                let button   = UIButton.buttonWithType(UIButtonType.System) as! UIButton
                var X_Co = self.view.frame.size.width - 100
                var Y_Co = self.view.frame.size.height - 90
                button.frame = CGRectMake(X_Co, Y_Co,80,80)
                button .setBackgroundImage(image, forState: UIControlState.Normal)
//                button.setImage(image, forState: .Normal)
                button.setTitle("", forState: UIControlState.Normal)
                button.addTarget(self, action: "buttonAction:", forControlEvents: UIControlEvents.TouchUpInside)
                
                self.view.addSubview(button)
                
                

        })
        
    }
    
    func buttonAction(sender:UIButton!)
    {
        performSegueWithIdentifier("selectpoke", sender: self)
    }
    
}