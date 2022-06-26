//
//  ResultViewController.swift
//  NamesApp
//
//  Created by Vasichko Anna on 26.06.2022.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var namesLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var resultSlider: UISlider!
    
    var resultText: String?
    var resultValue: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        namesLabel.text = resultText ?? ""
        resultLabel.text = "\(String(resultValue ?? 0)) %"
        resultSlider.setValue(Float(resultValue ?? 0), animated: true)
        
    }
 
}
