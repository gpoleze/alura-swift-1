import UIKit

var str = "Hello, playground"

var numbers: [Int] = [1,2,3,4,5]

func isOdd(number: Int)->Bool{
    return number % 2 == 0
}

let number = 5

func message(_ number: Int, _ isOdd: Bool) -> String {
    return "The number \(number) is \(isOdd ?"":"not ")odd"
};

//numbers.forEach{n in
//    print(message(n, isOdd(number: n)))
//}
//
//for n in numbers{
//    print(message(n, isOdd(number: n)))
//}
//
//for i in 0...numbers.count - 1{
//    let   n = numbers[i]
//    print(message(n, isOdd(number: n)))
//}
//
//func testGenerics<Numeric>(_ foo: Numeric)->Numeric{
//    print(type(of: foo))
//    return foo
//}
//
//testGenerics(1)
//testGenerics(1.0)

struct Item {
    let nome: String
    let calorias: Int
}


class Refeicao {
    
    // MARK: Atributos
    
    private let nome: String
    private let felicidade: String
    let items: Array<Item> = []
    
    // MARK: Contrutor
    init(nome:String, felicidade: String) {
        self.nome=nome
        self.felicidade=felicidade
    }
    
    // MARK: Métodos
    func totoalDeCalorias() -> Int {
        return items.reduce(0, { result, item in
            result + item.calorias
        })
    }
}
