//
//  TJBDetailViewController.swift
//  HarryPotterOBJC
//
//  Created by Trevor Bursach on 10/1/20.
//

import UIKit

class TJBDetailViewController: UIViewController {
    
    //MARK: - Outlets
    
    @IBOutlet weak var characterNameLabel: UILabel!
    @IBOutlet weak var characterImageView: UIImageView!
    @IBOutlet weak var speciesLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var houseLabel: UILabel!
    @IBOutlet weak var dateOfBirthLabel: UILabel!
    @IBOutlet weak var ancestryLabel: UILabel!
    @IBOutlet weak var eyeColorLabel: UILabel!
    @IBOutlet weak var hairColorLabel: UILabel!
    @IBOutlet weak var wandWoodLabel: UILabel!
    @IBOutlet weak var wandCoreLabel: UILabel!
    
    //MARK: - Properties

    var character: TJBCharacter?
    
    //MARK: - Lifecycle Functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    //MARK: - Helper Functions and Methods
    
    func updateViews() {
        guard let character = character else { return }
        DispatchQueue.main.async {
            self.characterNameLabel.text = character.name
            self.speciesLabel.text = "Species: \(character.species)"
            self.genderLabel.text = "Gender: \(character.gender)"
            self.houseLabel.text = "House: \(character.house)"
            self.dateOfBirthLabel.text = "Date Of Birth: \(character.dateOfBirth)"
            self.ancestryLabel.text = "Ancestry: \(character.ancestry)"
            self.eyeColorLabel.text = "Eye color: \(character.eyeColor)"
            self.hairColorLabel.text = "Hair Color: \(character.hairColor)"
            self.wandWoodLabel.text = "Wand Wood: \(character.wand.wood)"
            self.wandCoreLabel.text = "Wand Core: \(character.wand.core)"
            TJBCharacterController.fetchImage(for: character) { (image) in
                if let image = image {
                    DispatchQueue.main.async {
                        self.characterImageView.image = image
                    }
                }
            }
            
        }
    }
    
    
} // END OF CLASS
