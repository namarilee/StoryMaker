//
//  BackgroundSelect.swift
//  StoryMaker
//
//  Created by Marina Lee on 2/23/20.
//  Copyright © 2020 marinalee. All rights reserved.
//

import UIKit

extension UILabel {
    
    func animate(newText: String, characterDelay: TimeInterval) {
        
        DispatchQueue.main.async {
            
            self.text = ""
            
            for (index, character) in newText.enumerated() {
                DispatchQueue.main.asyncAfter(deadline: .now() + characterDelay * Double(index)) {
                    self.text?.append(character)
                }
            }
        }
    }
    
}

class BackgroundSelect: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var Button1: UIButton!
    
    @IBOutlet weak var Button2: UIButton!
    
    @IBOutlet weak var Button3: UIButton!
    
    @IBOutlet weak var Label1: UILabel!
    
    @IBOutlet weak var Label2: UILabel!
    
    @IBOutlet weak var Label3: UILabel!
    var answer0 = [
        "Amusement",
        "School",
        "Zoo"] as [Any]
    
    var answer1 = [ "dog", "cat",  "cow"] as [Any]
    
    var answer2 = [UIImage(imageLiteralResourceName: "pizza"), "Hotdog", "Popcorn"] as [Any]
    
    var answer3 = ["Merry-go-round", "Rollercoaster", "Ferris wheel"]
    
    var answer4 = ["Ping pong", "Xylophone", "Basketball"]
    
    var answers = [
         ["Amusement", "School", "Zoo"],
        ["dog",  "cat",  "cow"],
        [UIImage(imageLiteralResourceName: "pizza"), "Hotdog", "Popcorn"],
        ["Merry-go-round", "Rollercoaster", "Ferris wheel"],
        ["Ping pong", "Xylophone", "Basketball"]
    ]
    
    var questions =
        ["Where would you like your story to be?",
         "Let's start building your story! Choose a character",
         "Choose a food item!",
         "Let's go on a ride!",
         "What would you like to play?"]
    
    var imageLabels = [
    ["Amusement Park", "School", "idk"],
    ["Pup", "Whiskers", "Bessie"]
    ]
    
    var row = 0
    
    var introLabel = UILabel(frame: CGRect(x: 320, y: 290, width: 500, height: 21))

    var helloButton = UIButton(type: UIButton.ButtonType.custom) as UIButton
    
    var character =  UIImageView(frame: CGRect(x: 180, y: 450, width: 100, height: 150))
    
    var speechBubble = UIImageView(frame: CGRect(x: 220, y: 240, width: 500, height: 300))
    
    var chooseButton = UIButton(type: UIButton.ButtonType.custom) as UIButton
    
    var playMyStoryButton = UIButton(type: UIButton.ButtonType.custom) as UIButton

    var captionRect = UIImageView(frame: CGRect(x: 170, y: 20, width: 416.5, height: 72.5))
    
    var captionLabel = UILabel(frame: CGRect(x: 170, y: 20, width: 500, height: 21))

    var count = 0
    
    func hideButtonQuestions() {
        questionLabel.isHidden = true
        Button1.isHidden = true
        Button2.isHidden = true
        Button3.isHidden = true
        introLabel.isHidden = true
        Label1.isHidden = true
        Label2.isHidden = true
        Label3.isHidden = true
        chooseButton.isHidden = true

    }

    func showButtonQuestions() {
        questionLabel.isHidden = false
        Button1.isHidden = false
        Button2.isHidden = false
        Button3.isHidden = false
        introLabel.isHidden = false
        Label1.isHidden = false
        Label2.isHidden = false
        Label3.isHidden = false
    }

    func showCharacter() {
        character.image = UIImage(named: "dog")
        self.view.addSubview(character)
        UIView.animate(withDuration: 1, delay: 2, usingSpringWithDamping: 0.5, initialSpringVelocity: 5, options: [], animations: {
            self.character.transform = CGAffineTransform(translationX: 0, y: -150)
        })
    }
    
    func showSpeechBubble() {
        speechBubble.image = UIImage(named: "speechBubble")
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.view.addSubview(self.speechBubble)
      
            UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 3, options: [], animations: {
                self.speechBubble.transform = CGAffineTransform(scaleX: 2, y: 2)
            })
        }
    }
    
    func addMessageToSpeechBubble(_ message: String) {
        self.introLabel.isHidden = false
        self.introLabel.font = UIFont(name: "Rockwell", size: 18)
        self.introLabel.text = message
        DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
            self.view.addSubview(self.introLabel)
            self.introLabel.animate(newText: self.introLabel.text ?? "", characterDelay: 0.07)
        }
    }
    
    func hideIntro() {
        character.isHidden = true
        speechBubble.isHidden = true
        helloButton.isHidden = true
        self.introLabel.removeFromSuperview()
    }
    
    func showChooseButton() {
        let chooseImage = UIImage(named: "choose button")
        chooseButton.frame = CGRect(x: 150, y: 270, width: 108, height: 81)
        chooseButton.setImage(chooseImage, for: .normal)
        self.view.addSubview(self.chooseButton)
        chooseButton.addTarget(self, action: #selector(chooseButtonClicked), for: .touchUpInside)
    }
    
    func goToCharacterSelect() {
        view.removeBackground()
        questionLabel.text = questions[1]
        Label1.text = imageLabels[1][0]
        Label1.adjustsFontSizeToFitWidth = true
        Button1.setTitle(answers[1][0] as? String, for: .normal)
        Label2.text = imageLabels[1][1]
        Label2.adjustsFontSizeToFitWidth = true
        Button2.setTitle(answers[1][1] as? String, for: .normal)
        Label3.text = imageLabels[1][2]
        Label3.adjustsFontSizeToFitWidth = true
        Button3.setTitle(answers[1][2] as? String, for: .normal)
        Button2.setImage(UIImage(named: "cat"), for: .normal)
        Button2.imageView?.contentMode = UIView.ContentMode.scaleAspectFit
        Button3.setImage(UIImage(named: "cow"), for: .normal)
        Button3.imageView?.contentMode = UIView.ContentMode.scaleAspectFit
        
        let playImage = UIImage(named: "play my story button")
        playMyStoryButton.frame = CGRect(x: 150, y: 300, width: 240, height: 180)
        playMyStoryButton.setImage(playImage, for: .normal)
        self.view.addSubview(self.playMyStoryButton)
        playMyStoryButton.addTarget(self, action: #selector(playButtonClicked), for: .touchUpInside)
    }
    
    func showCaptionRect() {
        captionRect.image = UIImage(named: "captionRect")
        self.view.addSubview(self.captionRect)
      UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 3, options: [], animations: {
            self.captionRect.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
           })
               
    }
    
    func updateCaption(_ caption: String) {
        captionLabel.text = ""
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        questionLabel.text = questions[row]
        
        questionLabel.adjustsFontSizeToFitWidth = true
        
        Button1.setImage(UIImage(named: "amusement"), for: .normal)
        
        Button1.imageView?.contentMode = .scaleAspectFit
        
        Button1.setTitle(answers[row][0] as? String, for: .normal)
        Button2.setTitle(answers[row][1] as? String, for: .normal)
        Button3.setTitle(answers[row][2] as? String, for: .normal)
        
        Button1.addTarget(self, action: #selector(Button1Clicked), for: .touchUpInside)
        
    }
    
    let Mainstory : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
    
    @IBAction func backgroundButtonClicked(_ sender: UIButton) {
        
        showChooseButton()
        
        questionLabel.text = questions[row]
       
        userAnswers.background = sender.title (for: .normal)!
        
        userAnswers.character = sender.title (for: .normal)!
        
        userAnswers.food = sender.title (for: .normal)!
        
        print(userAnswers.background)
        print(userAnswers.character)

        if userAnswers.character == "dog" {
            showChooseButton()
        }
        
    }
    
    @IBAction func chooseButtonClicked(_ sender: UIButton) {
             row += 1
             print(row)
        
        if userAnswers.background == "Amusement" {
            hideButtonQuestions()
            view.addBackground(imageName: "amusement2", contentMode: .scaleAspectFill)
            
            showCharacter()
                     
            showSpeechBubble()
                 
            addMessageToSpeechBubble("Welcome to the amusement park!")
                     

            let helloImage = UIImage(named: "hello")
                     
            helloButton.frame = CGRect(x: 620, y: 330, width: 72, height: 54)
            helloButton.setImage(helloImage, for: .normal)
                 
            DispatchQueue.main.asyncAfter(deadline: .now() + 7) {
                self.view.addSubview(self.helloButton)
                UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 3, options: [], animations: {
                         
                self.helloButton.transform = CGAffineTransform(scaleX: 2, y: 2)
                         
                         
                     })
                 }
                     helloButton.addTarget(self, action: #selector(helloButtonClicked), for: .touchUpInside)
                     
                     Button1.setImage(UIImage(named: "dog"), for: .normal)

                 }
        }
        
    @IBAction func helloButtonClicked(_ sender: UIButton) {
            count += 1
            print(count)
        
        if self.count == 1 {
            
            self.introLabel.font = UIFont(name: "Rockwell", size: 18)
            helloButton.isHidden = true
            self.introLabel.text = "Let's choose a character!"
            self.view.addSubview(self.introLabel)
            self.introLabel.animate(newText: self.introLabel.text ?? "", characterDelay: 0.07)
        
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            
                self.helloButton.isHidden = false
                let helloImage = UIImage(named: "Next button")
                self.helloButton.setImage(helloImage, for: .normal)
            }
        
        }
           if self.count == 2 {
                self.helloButton.removeTarget(self, action: #selector(self.helloButtonClicked), for: .touchUpInside)
                self.hideIntro()
                self.showButtonQuestions()
                self.goToCharacterSelect()
            }
            
        
    }
    
    @IBAction func playButtonClicked(_ sender: UIButton) {
        
        view.addBackground(imageName: "amusement2", contentMode: .scaleAspectFill)
        hideButtonQuestions()
        playMyStoryButton.isHidden = true
        showCaptionRect()
        self.captionLabel.font = UIFont(name: "Rockwell", size: 25)
         self.view.addSubview(self.captionLabel)
        updateCaption("Pup had an amazing day at the amusement park!")

    }
    
    @IBAction func Button1Clicked(_ sender: UIButton) {
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 5, options: [], animations: {
                                
            self.Button1.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
                                
                                
                            })
    }

}

struct userAnswers {
    static var background = ""
    static var character = ""
    static var food = ""
}

