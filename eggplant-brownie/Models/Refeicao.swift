//
//  Refeicao.swift
//  eggplant-brownie
//
//  Created by Gabriel P Ferreira on 2020-10-12.
//

import UIKit

class Refeicao: NSObject {
    // MARK: - Atributos
    
    let nome: String
    let felicidade: Int
    let itens: Array<Item>
    
    // MARK: - Contrutor
    init(nome:String, felicidade: Int, itens: [Item] = []) {
        self.nome = nome
        self.felicidade = felicidade
        self.itens = itens
    }
    
    // MARK: - Métodos
    func totoalDeCalorias() -> Int {
        return itens.reduce(0, { result, item in
            result + item.calorias
        })
    }
}
