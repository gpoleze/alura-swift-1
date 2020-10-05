//
//  ViewController.swift
//  eggplant-brownie
//
//  Created by Gabriel P Ferreira on 2020-10-04.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var nomeTextField: UITextField!
    @IBOutlet var nivelFelicidadeTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func adicionar(_ sender: Any) {
        
        print("Alimento: \(nomeTextField?.text ?? "") Nível de felicidade \(nivelFelicidadeTextField?.text ?? "")")
    }
    
}

