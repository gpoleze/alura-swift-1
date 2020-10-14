//
//  RefeicoesTableViewController.swift
//  eggplant-brownie
//
//  Created by Gabriel P Ferreira on 2020-10-13.
//

import UIKit

class RefeicoesTableViewController: UITableViewController {
    
    var refeicoes = [
        Refeicao(nome: "banana", felicidade: 1),
        Refeicao(nome:"morango",felicidade: 2),
        Refeicao(nome:"uva",felicidade: 3),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("rodando")
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return refeicoes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celula = UITableViewCell(style: .default, reuseIdentifier: nil)
        
        let refeicao = refeicoes[indexPath.row]
        celula.textLabel?.text = "\(refeicao.nome), \(refeicao.felicidade)"
        
        return celula
    }
    
    func adiciona(_ refeicao: Refeicao){
        refeicoes.append(refeicao)
        tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let viewController = segue.destination as? ViewController{
            viewController.tableViewController = self
        }
    }
    
}

