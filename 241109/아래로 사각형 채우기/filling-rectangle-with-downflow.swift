import Foundation

let n = Int(readLine()!)!


var currentNum = 1

var map = Array(repeating: Array(repeating: 0, count: n), count: n)

for i in 0 ..< n {
    for j in 0 ..< n {
        map[j][i] = currentNum
        currentNum += 1
    }
}

for partialResult in map {
    print(partialResult.map { String($0) }.joined(separator: " "))
}