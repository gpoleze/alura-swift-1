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
    let items: Array<Item> = []
    
    // MARK: - Contrutor
    init(nome:String, felicidade: Int) {
        self.nome=nome
        self.felicidade=felicidade
    }
    
    // MARK: - Métodos
    func totoalDeCalorias() -> Int {
        return items.reduce(0, { result, item in
            result + item.calorias
        })
    }
}
