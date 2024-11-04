import Foundation


let nm = readLine()!.trimmingCharacters(in: .whitespaces).components(separatedBy: " ").map { Int(String($0))! }
let n = nm[0]
let m = nm[1]

let numbers = readLine()!.trimmingCharacters(in: .whitespaces).components(separatedBy: " ").map { Int(String($0))! }


func getResult(_ a1: Int, _ a2: Int) {
    let total = numbers.reduce(0, +)
    var leftSum: [Int] = []
    var current = 0

    for number in numbers {
        current += number
        leftSum.append(current)
    }

    var rightSum: [Int] = []
    current = 0

    for number in numbers.reversed() {
        current += number
        rightSum.append(current)
    }

    var result = 0

    var leftResult: Int
    let leftIndex = a1 - 2

    if leftIndex >= leftSum.count {
        leftResult = total
    } else if leftIndex < 0 {
        leftResult = 0
    } else {
        leftResult = leftSum[leftIndex]
    }


    var rightResult: Int
    let rightIndex = rightSum.count - a2 - 1
    if rightIndex < 0 {
        rightResult = 0
    } else {
        rightResult = rightSum[rightIndex]
    }

    result = total - (leftResult + rightResult)
    print(result)
}

for _ in 0..<m {
    let input = readLine()!.trimmingCharacters(in: .whitespaces).components(separatedBy: " ").map { Int(String($0))! }
    getResult(input[0], input[1])
}