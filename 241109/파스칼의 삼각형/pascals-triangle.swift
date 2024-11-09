import Foundation

let n = Int(readLine()!)!

var numbers = Array(repeating: Array(repeating: 0, count: n), count: n)
numbers[0][0] = 1

func isValid(_ row: Int, _ col: Int) -> Bool {
    if col - 1 >= 0 && numbers[row - 1][col] != 0 && numbers[row - 1][col - 1] != 0 {
        return true
    }

    return false
}

for row in 0 ..< n {
    for col in 0 ... row {
        if isValid(row, col) {
            let topLeft = numbers[row - 1][col - 1]
            let top = numbers[row - 1][col]
            numbers[row][col] = topLeft + top
        } else {
            numbers[row][col] = 1
        }
    }
}

for partialResult in numbers {
    print(partialResult.filter { $0 != 0 }.map { String($0) }.joined(separator: " "))
}