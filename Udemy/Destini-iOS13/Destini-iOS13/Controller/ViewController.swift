//
//  ViewController.swift
//  Destini-iOS13
//
//  Created by Angela Yu on 08/08/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var storyLabel: UILabel!
    @IBOutlet weak var choice1Button: UIButton!
    @IBOutlet weak var choice2Button: UIButton!

    var storyBrain = StoryBrain()

    override func viewDidLoad() {
        super.viewDidLoad()
        let stories = storyBrain.stories
        let storyNumber = storyBrain.storyNumber

        storyLabel.text = stories[storyNumber].title
        choice1Button.setTitle(stories[storyNumber].choice1, for: .normal)
        choice2Button.setTitle(stories[storyNumber].choice2, for: .normal)
    }

    @IBAction func choiceMade(_ sender: UIButton) {
        let userChoice = sender.title(for: .normal)!
        storyBrain.nextStory(userChoice)
        updateUI()
    }

    func updateUI() {
        let stories = storyBrain.stories
        let storyNumber = storyBrain.storyNumber
        
        storyLabel.text = stories[storyNumber].title
        choice1Button.setTitle(stories[storyNumber].choice1, for: .normal)
        choice2Button.setTitle(stories[storyNumber].choice2, for: .normal)
    }
}

