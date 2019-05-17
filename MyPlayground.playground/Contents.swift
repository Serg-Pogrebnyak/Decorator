import UIKit

protocol CarProtocol {
    func description() -> String
    func price() -> Int
}

class ToyotaTundra: CarProtocol {
    func description() -> String {
        return "Toyota tundra"
    }
    
    func price() -> Int {
        return 25000
    }
}

class AbstractDecorator: CarProtocol {
    
    private var car: CarProtocol
    
    init(carBaseOrWithOptions car: CarProtocol) {
        self.car = car
    }
    
    func description() -> String {
        return self.car.description()
    }
    
    func price() -> Int {
        return self.car.price()
    }
}

class BaseCar: AbstractDecorator {
    override func description() -> String {
        return "Base car options + \(super.description())"
    }
    
    override func price() -> Int {
        return super.price() + 3000
    }
}

class MiddleCar: AbstractDecorator {
    override func description() -> String {
        return "Base car options + wheels + \(super.description())"
    }
    
    override func price() -> Int {
        return super.price() + 5000
    }
}

let car = ToyotaTundra()
let baseToyota = BaseCar(carBaseOrWithOptions: car)
print(baseToyota.description())
print(baseToyota.price())

let magicCar = MiddleCar(carBaseOrWithOptions: baseToyota)
print(magicCar.description())
print(magicCar.price())
