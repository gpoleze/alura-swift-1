//
//  ViewController.swift
//  eggplant-brownie
//
//  Created by Gabriel P Ferreira on 2020-10-04.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var nomeTextField: UITextField?
    @IBOutlet var nivelFelicidadeTextField: UITextField?
    
    var tableViewController: RefeicoesTableViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func adicionar(_ sender: Any) {
        guard let nome = nomeTextField?.text else {
            print("O nome da refeição estå nulo")
            return
        }
        guard let nivelFelicidade = nivelFelicidadeTextField?.text, let felicidade = Int(nivelFelicidade) else {
            print("O valor informado do nível de felicidade não é um número inteiro")
            return
        }
        
        let refeicao = Refeicao(nome: nome, felicidade: Int(felicidade))
        
        print("Alimento: \(refeicao.nome) Nível de felicidade \(refeicao.felicidade)")
     
        tableViewController?.adiciona(refeicao)
        navigationController?.popViewController(animated: true)
    }
    
}

