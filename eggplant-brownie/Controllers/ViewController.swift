//
//  ViewController.swift
//  eggplant-brownie
//
//  Created by Gabriel P Ferreira on 2020-10-04.
//

import UIKit

protocol AdicionaRefeicoesDelegate {
    func adiciona(_ refeicao: Refeicao)
}

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, AdicionaItemsDelegate {
    
    // MARK: - IBOUtlets
    @IBOutlet var nomeTextField: UITextField?
    @IBOutlet var nivelFelicidadeTextField: UITextField?
    @IBOutlet var itensTableView: UITableView?
    
    // MARK: - Atributos
    var delegate: AdicionaRefeicoesDelegate?
    var itens: [Item] = [
        Item(nome: "molho de tomate",calorias: 10),
        Item(nome: "queijo",calorias: 50),
        Item(nome: "carne moída",calorias: 50)
    ]
    var itensSelecionados: [Item] = []
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let botaoAdicionaItem = UIBarButtonItem(title: "Adicionar", style: .plain, target: self, action: #selector(self.adicionarItem))
        navigationItem.rightBarButtonItem = botaoAdicionaItem
    }
    
    @objc func adicionarItem() {
        let adicionaItemViewController = AdicionaItemViewController(delegate: self)
        navigationController?.pushViewController(adicionaItemViewController, animated: true)
    }
    
    // MARK: - Overrides AdicionaRefeicoesDelegate
    @IBAction func adicionar(_ sender: Any) {
        guard let nome = nomeTextField?.text else {
            print("O nome da refeição estå nulo")
            return
        }
        guard let nivelFelicidade = nivelFelicidadeTextField?.text, let felicidade = Int(nivelFelicidade) else {
            print("O valor informado do nível de felicidade não é um número inteiro")
            return
        }
        
        let refeicao = Refeicao(nome: nome, felicidade: Int(felicidade), itens: itensSelecionados)
        
        print("Alimento: \(refeicao.nome) Nível de felicidade \(refeicao.felicidade)")
        
        delegate?.adiciona(refeicao)
        navigationController?.popViewController(animated: true)
    }
    
    // MARK: - Overrides UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itens.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celula: UITableViewCell = UITableViewCell(style: .default, reuseIdentifier: nil)
        celula.textLabel?.text = itens[indexPath.row].nome
        return celula
    }
    
    
    // MARK: - Overrides UITableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let celula = tableView.cellForRow(at: indexPath) else { return }
        
        let item = itens[indexPath.row]
        
        if celula.accessoryType == .none{
            celula.accessoryType = .checkmark
            itensSelecionados.append(item)
        } else{
            celula.accessoryType = .none
            itensSelecionados.removeAll(where: {$0.nome == item.nome})
        }
    }
    
    // Mark - Overrides AdicionaItemsDelegate
    func adicionar(_ item: Item) {
        itens.append(item)
        itensTableView?.reloadData()
    }
}

