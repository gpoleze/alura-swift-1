//
//  AdicionaItemViewController.swift
//  eggplant-brownie
//
//  Created by Gabriel P Ferreira on 2020-10-18.
//

import UIKit

class AdicionaItemViewController: UIViewController {
    
    // MARK: - Atributos
    var delegate: AdicionaItemsDelegate?
    
    // MARK: - IBOutlets
    @IBOutlet var nomeTextField: UITextField?
    @IBOutlet var caloriasTextField: UITextField?
    
    
    // MARK: - Contrutores

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    init(delegate: AdicionaItemsDelegate) {
        super.init(nibName: "AdicionaItemViewController", bundle: nil)
        self.delegate = delegate
    }
    
    // MARK: - View Life-cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - IBActions
    @IBAction func adicionarItem(_ sender: Any) {
        guard let nome = nomeTextField?.text else {
            // TODO - Lançar um aviso na tela
            return
        }
        guard let caloriasText = caloriasTextField?.text, let calorias = Int(caloriasText) else {
            // TODO - Lançar um aviso na tela
            return
        }

        delegate?.adicionar(Item(nome: nome, calorias: calorias))
        navigationController?.popViewController(animated: true)
    }
}
