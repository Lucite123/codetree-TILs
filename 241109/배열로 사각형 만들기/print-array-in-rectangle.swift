import Foundation

var numbers = Array(repeating: Array(repeating: 1, count: 5), count: 5)

for i in 1 ..< 5 {
    for j in 1 ..< 5 {
        let left = numbers[i][j - 1]
        let top = numbers[i - 1][j]
        numbers[i][j] = left + top
    }
}

for partialResult in numbers {
    print(partialResult.map { String($0) }.joined(separator: " "))
}