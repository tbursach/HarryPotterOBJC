//
//  TJBCharacterListTableViewController.swift
//  HarryPotterOBJC
//
//  Created by Trevor Bursach on 10/1/20.
//

import UIKit

class TJBCharacterListTableViewController: UITableViewController {
    
    //MARK: - Properties
    
    var characters: [TJBCharacter] = [] {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }

    //MARK: - Lifecycle Functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchCharacter()
    }

    //MARK: - Helper Functions and Methods
    
    func fetchCharacter() {
        TJBCharacterController.fetchCharacter { (characters) in
            self.characters = characters
        }
    }
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characters.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "characterCell", for: indexPath)
        
        let character = characters[indexPath.row]
        cell.textLabel?.text = character.name

        return cell
    }

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "toDetailVC" {
            guard let indexPath = tableView.indexPathForSelectedRow,
                  let destinationVC = segue.destination as? TJBDetailViewController else { return }
            
            let selectedCharacter = characters[indexPath.row]
            destinationVC.character = selectedCharacter
        }
        
    }

} // END OF CLASS
