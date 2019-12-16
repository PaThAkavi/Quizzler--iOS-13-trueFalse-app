//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    var progress = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        updateText()
        scorePreview.text = "Score : 0"
    }
    
    
    var quizBrain = QuizBrain()

    @IBOutlet weak var scorePreview: UILabel!
    @IBOutlet weak var barProgress: UIProgressView!
    @IBOutlet weak var questionText: UILabel!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    @IBAction func answerButtonPressed(_ sender: Any)
    {
        let userAnswer = (sender as AnyObject).currentTitle!
        let userGotItRight = quizBrain.checkAnswer(userAnswer!)
        if userGotItRight {
            (sender as! UIButton).backgroundColor = UIColor.green
        } else{
            (sender as! UIButton).backgroundColor = UIColor.red
        }
        
        quizBrain.nextQues()
        
        Timer.scheduledTimer(timeInterval: 0.2 , target: self, selector: #selector(updateText), userInfo: nil, repeats: false)
        
    }
    
    @objc func updateText(){
        questionText.text = quizBrain.getQuesText()
        barProgress.progress = quizBrain.getProgress() // Important
        scorePreview.text = "Score : \(quizBrain.getScore())"
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
    }
}

