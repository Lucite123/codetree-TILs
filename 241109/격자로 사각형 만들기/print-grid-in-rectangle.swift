import Foundation

let n = Int(readLine()!)!

var numbers = Array(repeating: Array(repeating: 1, count: n), count: n)

for i in 1 ..< n {
    for j in 1 ..< n {
        let top = numbers[i - 1][j]
        let topLeft = numbers[i - 1][j - 1]
        let left = numbers[i][j - 1]

        numbers[i][j] = top + topLeft + left
    }
}

for partialResult in numbers {
    print(partialResult.map { String($0) }.joined(separator: " "))
}