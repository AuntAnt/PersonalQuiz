//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Alexey Efimov on 19.02.2023.
//

import UIKit

final class ResultViewController: UIViewController {
    
    @IBOutlet var emojiLabel: UILabel!
    @IBOutlet var resultLabel: UILabel!
    
    var answers: [Answer]!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = false
        
        setResult()
    }
    
    private func setResult() {
        guard let animal = defineResult() else { return }

        emojiLabel.text = "Вы - \(animal.rawValue)"
        resultLabel.text = animal.definition
    }
    
    private func defineResult() -> Animal? {
        let animals = answers.map { $0.animal }
        
        var result = (1, animals.first)
        
        for animal in animals {
            var count = 0
            for index in 0..<animals.count {
                if animal == animals[index] {
                    count += 1
                }
            }
            if count > result.0 {
                result = (count, animal)
            }
        }
        
        guard let animal = result.1 else { return nil }
        return animal
    }
    
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
}
