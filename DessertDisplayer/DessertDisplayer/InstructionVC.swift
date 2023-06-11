//
//  InstructionVC.swift
//  DessertDisplayer
//
//  Created by Michael  Walter on 6/8/23.
//

import Foundation
import UIKit

class InstructionVC: UIViewController {
    @IBOutlet weak var instructionLabel: UILabel!
    var instructions = ""
    
    override func viewDidLoad() {
        instructionLabel.numberOfLines = 0
        instructionLabel.text = instructions
    }
    
}



