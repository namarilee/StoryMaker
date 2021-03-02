//
//  FoodSelectViewController.swift
//  StoryMaker
//
//  Created by Marina Lee on 2/27/21.
//  Copyright © 2021 marinalee. All rights reserved.
//

import Foundation
import UIKit

class FoodSelectViewController: UIViewController {

    @IBOutlet weak var pizzaButton: UIButton!

    @IBOutlet weak var hotdogButton: UIButton!

    @IBOutlet weak var popcornButton: UIButton!

    @IBOutlet weak var pizzaLabel: UILabel!

    @IBOutlet weak var hotdogLabel: UILabel!

    @IBOutlet weak var popcornLabel: UILabel!

    @IBOutlet weak var anywhereButton: UIButton!

    let chooseButton = UIButton(type: UIButton.ButtonType.custom)

    let numSelectors = [#selector(num1Clicked), #selector(num2Clicked), #selector(num3Clicked), #selector(num4Clicked), #selector(num5Clicked)]

    let gameProgressBar = [UIImage(named: "p0"), UIImage(named: "p1"), UIImage(named: "p2"), UIImage(named: "p3"), UIImage(named: "p4"), UIImage(named: "p5")]

    var pizzaGameCoordinator: PizzaGameCoordinator? = nil
    var hotdogGameCoordinator: HotdogGameCoordinator? = nil
    var popcornGameCoordinator: PopcornGameCoordinator? = nil

    var chosenFood = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        chooseButton.isHidden = true

        pizzaLabel.adjustsFontSizeToFitWidth = true
        hotdogLabel.adjustsFontSizeToFitWidth = true
        popcornLabel.adjustsFontSizeToFitWidth = true

        pizzaButton.imageView?.contentMode = UIView.ContentMode.scaleAspectFit
        pizzaButton.translatesAutoresizingMaskIntoConstraints = true
        hotdogButton.imageView?.contentMode = UIView.ContentMode.scaleAspectFit
        hotdogButton.translatesAutoresizingMaskIntoConstraints = true
        popcornButton.imageView?.contentMode = UIView.ContentMode.scaleAspectFit
        popcornButton.translatesAutoresizingMaskIntoConstraints = true
    }

    @IBAction func pizzaButtonClicked(_ sender: UIButton) {
        chosenFood = sender.title (for: .normal)!
        print("Chosen food: \(chosenFood)")

        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 5, options: [], animations: {
            
            self.hotdogButton.transform = .identity
            self.popcornButton.transform = .identity
            self.pizzaButton.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
        })
        
        showChooseButton()
    }

    @IBAction func hotdogButtonClicked(_ sender: UIButton) {
        chosenFood = sender.title (for: .normal)!
        print("Chosen food: \(chosenFood)")

        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 5, options: [], animations: {
            
            self.popcornButton.transform = .identity
            self.pizzaButton.transform = .identity
            self.hotdogButton.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
        })
        
        showChooseButton()
    }

    @IBAction func popcornButtonClicked(_ sender: UIButton) {
        chosenFood = sender.title (for: .normal)!
        print("Chosen food: \(chosenFood)")

        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 5, options: [], animations: {
            
            self.pizzaButton.transform = .identity
            self.hotdogButton.transform = .identity
            self.popcornButton.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
        })
        
        showChooseButton()
    }
    
    func showChooseButton() {
        chooseButton.isHidden = false
        let chooseImage = UIImage(named: "selectButton")
        chooseButton.setImage(chooseImage, for: .normal)
        self.view.addSubview(self.chooseButton)
        chooseButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            chooseButton.heightAnchor.constraint(equalTo: chooseButton.widthAnchor, multiplier: 51.0/190.0),
            chooseButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.12),
            chooseButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            NSLayoutConstraint(item: chooseButton, attribute: .centerY, relatedBy: .equal, toItem: view, attribute: .centerY, multiplier: 1.73, constant: 0)
        ])

        chooseButton.addTarget(self, action: #selector(chooseButtonClicked), for: .touchUpInside)
    }

    @IBAction func chooseButtonClicked(_ sender: UIButton) {

        if chosenFood == "Pizza" {
            pizzaGameCoordinator = PizzaGameCoordinator(parent: self, numSelectors: numSelectors)
            view = pizzaGameCoordinator?.loadView()
        }
        if chosenFood == "Hotdog" {
            hotdogGameCoordinator = HotdogGameCoordinator(parent: self, numSelectors: numSelectors)
            view = hotdogGameCoordinator?.loadView()
        }
        if chosenFood == "Popcorn" {
            popcornGameCoordinator = PopcornGameCoordinator(parent: self)
            view = popcornGameCoordinator?.loadView()
        }
    }

    @IBAction func userClickedAnywhere(_ sender: Any) {
        chooseButton.isHidden = true

        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 5, options: [], animations: {
            
            self.pizzaButton.transform = .identity
            self.hotdogButton.transform = .identity
            self.popcornButton.transform = .identity
        })
    }

    @IBAction func num1Clicked(_ sender: UIButton) {
        if (pizzaGameCoordinator != nil) {
            pizzaGameCoordinator?.handleNumClicked(0)
        } else if (hotdogGameCoordinator != nil) {
            hotdogGameCoordinator?.handleNumClicked(0)
        }
    }

    @IBAction func num2Clicked(_ sender: UIButton) {
        if (pizzaGameCoordinator != nil) {
            pizzaGameCoordinator?.handleNumClicked(1)
        } else if (hotdogGameCoordinator != nil) {
            hotdogGameCoordinator?.handleNumClicked(1)
        }
    }

    @IBAction func num3Clicked(_ sender: UIButton) {
        if (pizzaGameCoordinator != nil) {
            pizzaGameCoordinator?.handleNumClicked(2)
        } else if (hotdogGameCoordinator != nil) {
            hotdogGameCoordinator?.handleNumClicked(2)
        }
    }

    @IBAction func num4Clicked(_ sender: UIButton) {
        if (pizzaGameCoordinator != nil) {
            pizzaGameCoordinator?.handleNumClicked(3)
        } else if (hotdogGameCoordinator != nil) {
            hotdogGameCoordinator?.handleNumClicked(3)
        }
    }

    @IBAction func num5Clicked(_ sender: UIButton) {
        if (pizzaGameCoordinator != nil) {
            pizzaGameCoordinator?.handleNumClicked(4)
        } else if (hotdogGameCoordinator != nil) {
            hotdogGameCoordinator?.handleNumClicked(4)
        }
    }

}
