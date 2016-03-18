//
//  GameViewController.swift
//  Hangman
//
//  Created by Shawn D'Souza on 3/3/16.
//  Copyright © 2016 Shawn D'Souza. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    
    @IBOutlet var aButton: UIButton!
    @IBOutlet var bButton: UIButton!
    @IBOutlet var cButton: UIButton!
    @IBOutlet var dButton: UIButton!
    @IBOutlet var eButton: UIButton!
    @IBOutlet var fButton: UIButton!
    @IBOutlet var gButton: UIButton!
    @IBOutlet var hButton: UIButton!
    @IBOutlet var iButton: UIButton!
    @IBOutlet var jButton: UIButton!
    @IBOutlet var kButton: UIButton!
    @IBOutlet var lButton: UIButton!
    @IBOutlet var mButton: UIButton!
    @IBOutlet var nButton: UIButton!
    @IBOutlet var oButton: UIButton!
    @IBOutlet var pButton: UIButton!
    @IBOutlet var qButton: UIButton!
    @IBOutlet var rButton: UIButton!
    @IBOutlet var sButton: UIButton!
    @IBOutlet var tButton: UIButton!
    @IBOutlet var uButton: UIButton!
    @IBOutlet var vButton: UIButton!
    @IBOutlet var wButton: UIButton!
    @IBOutlet var xButton: UIButton!
    @IBOutlet var yButton: UIButton!
    @IBOutlet var zButton: UIButton!
    
    @IBOutlet var pictureView: UIImageView!
    
    @IBOutlet var displayWord: UILabel!
    @IBOutlet var incorrectLetters: UILabel!

    var triedLetters: String = ""
    var wordArray: [String] = []
    var inverseArray: [Character] = []
    var wordText: String = "" //wtf is this
    var strikes: Int = 1
    
    
    @IBAction func buttonAction(sender: UIButton) {
        switch sender {
        case aButton:
            tryLetter("A")
            break
        case bButton:
            tryLetter("B")
            break
        case cButton:
            tryLetter("C")
            break
        case dButton:
            tryLetter("D")
            break
        case eButton:
            tryLetter("E")
            break
        case fButton:
            tryLetter("F")
            break
        case gButton:
            tryLetter("G")
            break
        case hButton:
            tryLetter("H")
            break
        case iButton:
            tryLetter("I")
            break
        case jButton:
            tryLetter("J")
            break
        case kButton:
            tryLetter("K")
            break
        case lButton:
            tryLetter("L")
            break
        case mButton:
            tryLetter("M")
            break
        case nButton:
            tryLetter("N")
            break
        case oButton:
            tryLetter("O")
            break
        case pButton:
            tryLetter("P")
            break
        case qButton:
            tryLetter("Q")
            break
        case rButton:
            tryLetter("R")
            break
        case sButton:
            tryLetter("S")
            break
        case tButton:
            tryLetter("T")
            break
        case uButton:
            tryLetter("U")
            break
        case vButton:
            tryLetter("V")
            break
        case wButton:
            tryLetter("W")
            break
        case xButton:
            tryLetter("X")
            break
        case yButton:
            tryLetter("Y")
            break
        case zButton:
            tryLetter("Z")
            break
        default:
            break
        }
        sender.alpha = 0
    }
    
    func tryLetter(letter: Character) {
        var correctLetter = false
        
        for (var i = 0; i < inverseArray.count; i++){
            if (letter == inverseArray[i]) {
                //change the letter in inverse array to match the thing
                inverseArray[i] = "*"
                //change the letter in the wordArray to be the new thing
                wordArray[i] = String(letter)
                correctLetter = true
            }
        }
        
        if correctLetter {
            //call changeWordText, is that it?
            changeWordText()
            //check for a win
            let wonGame = checkWin()
            if wonGame {
                print("yay you won")
                endGame(true)
                //trigger segue to other scene
            }
        } else {
            //add letter to list of tried letters (check if it's already there so someone can't press button more than once?)
            if triedLetters.rangeOfString(String(letter)) == nil {
                triedLetters += String(letter)
                triedLetters += " "
                incorrectLetters.text = triedLetters
                // add a strike
                strikes++
                //change the pic
                let newPicString = "hangman" + String(strikes) + ".gif"
                pictureView.image = UIImage(named: newPicString)
                //check for a fail (6 strikes)
                if strikes == 7 {
                    print("you failed")
                    endGame(false)
                }
            }
        }
        
        //tell the button to go away
    }
    
    func checkWin() -> Bool {
        for (var i = 0; i < inverseArray.count; i++) {
            if (inverseArray[i] != "*") {
                return false //still letters to guess
            }
        }
        return true
    }
    
    func endGame(won: Bool) {
        var alertController: UIAlertController
        if won {
            alertController = UIAlertController(title: "YOU WON!", message:
                "Congratulations! Care to try your luck again?", preferredStyle: UIAlertControllerStyle.Alert)
        } else {
            alertController = UIAlertController(title: "YOU LOST", message:
                "Better luck next time!", preferredStyle: UIAlertControllerStyle.Alert)
        }
        
        alertController.addAction(UIAlertAction(title: "Start Over", style: UIAlertActionStyle.Default,handler: startOverHandler))
        
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    
    func startOverHandler(alert: UIAlertAction!) {
        self.viewDidLoad()
        
    }
    
    func changeWordText() {
        var newText = ""
        for (var i = 0; i < wordArray.count; i++) {
            newText += wordArray[i]
        }
        wordText = newText
        displayWord.text = wordText
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let hangmanPhrases = HangmanPhrases()
        let phrase = hangmanPhrases.getRandomPhrase()
        print("The phrase is " + phrase)
        
        pictureView.image = UIImage(named: "hangman1.gif")
        
        aButton.addTarget(self, action: "buttonAction:", forControlEvents: UIControlEvents.TouchUpInside)
        aButton.alpha = 1
        bButton.addTarget(self, action: "buttonAction:", forControlEvents: UIControlEvents.TouchUpInside)
        bButton.alpha = 1
        cButton.addTarget(self, action: "buttonAction:", forControlEvents: UIControlEvents.TouchUpInside)
        cButton.alpha = 1
        dButton.addTarget(self, action: "buttonAction:", forControlEvents: UIControlEvents.TouchUpInside)
        dButton.alpha = 1
        eButton.addTarget(self, action: "buttonAction:", forControlEvents: UIControlEvents.TouchUpInside)
        eButton.alpha = 1
        fButton.addTarget(self, action: "buttonAction:", forControlEvents: UIControlEvents.TouchUpInside)
        fButton.alpha = 1
        gButton.addTarget(self, action: "buttonAction:", forControlEvents: UIControlEvents.TouchUpInside)
        gButton.alpha = 1
        hButton.addTarget(self, action: "buttonAction:", forControlEvents: UIControlEvents.TouchUpInside)
        hButton.alpha = 1
        iButton.addTarget(self, action: "buttonAction:", forControlEvents: UIControlEvents.TouchUpInside)
        iButton.alpha = 1
        jButton.addTarget(self, action: "buttonAction:", forControlEvents: UIControlEvents.TouchUpInside)
        jButton.alpha = 1
        kButton.addTarget(self, action: "buttonAction:", forControlEvents: UIControlEvents.TouchUpInside)
        kButton.alpha = 1
        lButton.addTarget(self, action: "buttonAction:", forControlEvents: UIControlEvents.TouchUpInside)
        lButton.alpha = 1
        mButton.addTarget(self, action: "buttonAction:", forControlEvents: UIControlEvents.TouchUpInside)
        mButton.alpha = 1
        nButton.addTarget(self, action: "buttonAction:", forControlEvents: UIControlEvents.TouchUpInside)
        nButton.alpha = 1
        oButton.addTarget(self, action: "buttonAction:", forControlEvents: UIControlEvents.TouchUpInside)
        oButton.alpha = 1
        pButton.addTarget(self, action: "buttonAction:", forControlEvents: UIControlEvents.TouchUpInside)
        pButton.alpha = 1
        qButton.addTarget(self, action: "buttonAction:", forControlEvents: UIControlEvents.TouchUpInside)
        qButton.alpha = 1
        rButton.addTarget(self, action: "buttonAction:", forControlEvents: UIControlEvents.TouchUpInside)
        rButton.alpha = 1
        sButton.addTarget(self, action: "buttonAction:", forControlEvents: UIControlEvents.TouchUpInside)
        sButton.alpha = 1
        tButton.addTarget(self, action: "buttonAction:", forControlEvents: UIControlEvents.TouchUpInside)
        tButton.alpha = 1
        uButton.addTarget(self, action: "buttonAction:", forControlEvents: UIControlEvents.TouchUpInside)
        uButton.alpha = 1
        vButton.addTarget(self, action: "buttonAction:", forControlEvents: UIControlEvents.TouchUpInside)
        vButton.alpha = 1
        wButton.addTarget(self, action: "buttonAction:", forControlEvents: UIControlEvents.TouchUpInside)
        wButton.alpha = 1
        xButton.addTarget(self, action: "buttonAction:", forControlEvents: UIControlEvents.TouchUpInside)
        xButton.alpha = 1
        yButton.addTarget(self, action: "buttonAction:", forControlEvents: UIControlEvents.TouchUpInside)
        yButton.alpha = 1
        zButton.addTarget(self, action: "buttonAction:", forControlEvents: UIControlEvents.TouchUpInside)
        zButton.alpha = 1
        //add all the button actions
        
        //reset things
        wordArray = []
        inverseArray = []
        triedLetters = ""
        wordText = ""
        strikes = 1
        incorrectLetters.text = triedLetters
        
        
        //initialize both the wordArray and the Inverse array (word array will be "- " and inverse array will be the letter
        for character in phrase.characters {
            if character == " " {
                wordArray.append("    ")
                inverseArray.append("*")
            } else {
                wordArray.append(" - ")
                inverseArray.append(character)
            }
        }
        //call changeWordText() to show the dashes
        changeWordText()
        //put the initial pic up
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
