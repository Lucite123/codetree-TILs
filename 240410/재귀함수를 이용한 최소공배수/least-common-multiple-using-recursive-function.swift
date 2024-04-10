import Foundation

let count = Int(readLine()!)!
let numbers = readLine()!.trimmingCharacters(in: .whitespaces).components(separatedBy: " ").map { Int(String($0))! }


func getMinTimesNumber(_ lhs: Int, _ rhs: Int) -> Int {
    var gcd = 1

    for i in 1 ... min(lhs, rhs) {
        if lhs % i == 0 && rhs % i == 0 {
            gcd = i
        }
    }

    return lhs * rhs / gcd
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