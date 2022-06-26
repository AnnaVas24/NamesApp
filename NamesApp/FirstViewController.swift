//
//  ViewController.swift
//  NamesApp
//
//  Created by Vasichko Anna on 26.06.2022.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var yourNameTF: UITextField!
    @IBOutlet weak var partnerNameTF: UITextField!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destinationVC = segue.destination as? ResultViewController else { return }
        destinationVC.resultText = "\(yourNameTF.text ?? "") and \(partnerNameTF.text ?? "")"
        destinationVC.resultValue = findResult()
       
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }

    @IBAction func resultButtonPressed(_ sender: Any) {
        if yourNameTF.text == "" || partnerNameTF.text == "" {
            showAlert(
                title: "Names are missing",
                message: "Please enter both names ☺️"
            )
            return
        }
        performSegue(withIdentifier: "goToResult", sender: nil)
    }
    
    @IBAction func unwindSegueToFirstVC(segue: UIStoryboardSegue) {
        yourNameTF.text = ""
        partnerNameTF.text = ""
    }
    
    private func findValue(for name: String) -> Int {
        var count = 0
        
        for character in name.lowercased() {
            switch character {
            case "a", "i", "j", "q", "y":
                count += 1
            case "b", "k", "r":
                count += 2
            case "c", "g", "l", "s":
                count += 3
            case "d", "m", "t":
                count += 4
            case "e", "h", "n", "x":
                count += 5
            case "u", "v", "w":
                count += 6
            case "o", "z":
                count += 7
            case "f", "p":
                count += 8
            default :
                count += 0
            }
        }
        return count
    }
    
    private func findResult() -> Int {
        var result = 0
        
        let firstValue = findValue(for: yourNameTF.text ?? "")
        let secondValue = findValue(for: partnerNameTF.text ?? "")
        let absDifference = abs(firstValue - secondValue)
        
        switch absDifference {
        case 0, 1, 2:
            result = 100
        case 3, 4:
            result = 65
        case 5:
            result = 50
        case 6:
            result = 40
        default:
            result = 30
        }
        return result
    }
}

extension FirstViewController {
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}
