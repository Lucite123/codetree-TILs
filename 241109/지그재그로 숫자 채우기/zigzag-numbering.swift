import Foundation

let nm = readLine()!.trimmingCharacters(in: .whitespaces).components(separatedBy: " ").map { Int(String($0))! }
let n = nm[0]
let m = nm[1]

var numbers = Array(repeating: Array(repeating: 0, count: m), count: n)

var currentNum = 0

for i in 0 ..< m {
    for j in 0 ..< n {
        if i % 2 == 0 {
            numbers[j][i] = currentNum
        } else {
            numbers[n - j - 1][i] = currentNum
        }

        currentNum += 1
    }
}

for partialResult in numbers {
    print(partialResult.map { String($0) }.joined(separator: " "))
}