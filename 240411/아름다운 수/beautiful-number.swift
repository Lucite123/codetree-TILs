import Foundation

let digit = Int(readLine()!)!

// 동일한 숫자에 대해 연달아 같은 숫자의 묶음이 나오는 것

var numbers = [Int]()
var count = 0

func check() -> Bool {
    var numberTable = [Int: Int]()

    if digit == 1 {
        if numbers[0] == 1 {
         
            return true
        }

        return false
    }

    var continuousNumber = numbers[0]
    numberTable[continuousNumber, default: 0] += 1

    for index in 1 ..< numbers.count {
        let currentNumber = numbers[index]

        if continuousNumber != currentNumber {
            let count = numberTable[continuousNumber, default: 0]
            if count % continuousNumber != 0 {
                return false
            }
            continuousNumber = currentNumber
            numberTable = [Int: Int]()
            numberTable[continuousNumber, default: 0 ] += 1
        } else {
            numberTable[continuousNumber, default: 0] += 1
        }
    }

    let count = numberTable[continuousNumber, default: 0]
    if count % continuousNumber != 0 {
        return false
    }

    return true
}

func findPermutation(_ n: Int) {
    if n == digit {
        if check() {
            count += 1
        }
        return
    }

    for number in 1 ... 4 {
        numbers.append(number)
        findPermutation(n + 1)
        numbers.removeLast()
    }
}

findPermutation(0)
print(count)