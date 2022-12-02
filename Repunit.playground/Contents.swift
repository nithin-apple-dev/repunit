import UIKit

var greeting = "Hello, playground"

struct Repunit {
    let n: Int
}

extension Repunit {
    func toNumber() -> Int? {
        let numArray = Array(repeating: 1, count: n)
        return Int(numArray.reduce("") { $0 + String($1) })
    }
}

extension Array where Element == Int {
    func sum() -> Int {
        self.reduce(0, +)
    }
}

func primeFactorSum(repunit: Repunit) -> Int {
    guard var num = repunit.toNumber() else {
        // Failed to parse n to number
        return 0
    }
    // Array to store prime factors
    var primeFactors: [Int] = []
    // No need to consider 1
    var divisor = 2
    while divisor * divisor <= num {
        while num % divisor == 0 {
            primeFactors.append(divisor)
            num /= divisor
        }
        divisor += divisor == 2 ? 1 : 2
    }
    if num > 1 {
        primeFactors.append(num)
    }
    return primeFactors.sum()
}

let repunit = Repunit(n: 10)
print("The sum of prime factors of R(\(repunit.n)) is \(primeFactorSum(repunit: repunit))")
