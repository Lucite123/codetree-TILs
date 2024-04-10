import Foundation

let count = Int(readLine()!)!
let numbers = readLine()!.trimmingCharacters(in: .whitespaces).components(separatedBy: " ").map { Int(String($0))! }


func isPrimeNumber(_ n: Int) -> Bool {
    if n < 2 {
        return false
    }

    for i in 2 ..< n {
        if n % i == 0 {
            return false
        }
    }

    return true
}

func factorization(_ n: Int) -> [Int: Int] {
    let primeNumbers = [2, 3, 5, 7]
    var remainValue = n
    var factorizationTable = [Int: Int]()
    var primeNumberIndex = 0
    var currentPrimeNumber = primeNumbers[primeNumberIndex]

    if n == 1 {
        return [1: 1]
    }

    while isPrimeNumber(remainValue) == false {
        
        if (remainValue % currentPrimeNumber == 0) == false {
            primeNumberIndex += 1
            currentPrimeNumber = primeNumbers[primeNumberIndex]
            continue
        }

        remainValue = remainValue / currentPrimeNumber
        factorizationTable[currentPrimeNumber, default: 0] += 1
    }

    factorizationTable[remainValue, default: 0] += 1

    return factorizationTable
}


func getMinTimesNumber(_ lhs: Int, _ rhs: Int) -> Int {
    let lhsPrimeNumberTable = factorization(lhs)
    let rhsPrimeNumberTable = factorization(rhs)

    let newPrimeNumberTable = lhsPrimeNumberTable.merging(rhsPrimeNumberTable) { lhsValue, rhsValue in
        if lhsValue >= rhsValue {
            return lhsValue
        }

        return rhsValue
    }

    var minTimesNumber = 1

    for (primeNumber, times) in newPrimeNumberTable {
        minTimesNumber *= Int(pow(Float(primeNumber), Float(times)))
    }

    return minTimesNumber
}



// 하나씩 최소 공배수 재귀 구하기
func calc(_ n: Int) -> Int {
    if n == count - 1 {
        return numbers[count - 1]
    }
    
    let currentNumber = numbers[n]
    let nextNumber = calc(n + 1)

    return getMinTimesNumber(nextNumber, currentNumber)
}

if count == 1 {
    print(numbers[0])
    exit(0)
}

print(calc(0))