import Foundation

let n = Int(readLine()!)!

var numbers = Array(repeating: Array(repeating: 0, count: n), count: n)
var current = 1

for i in 0 ..< n {
    for j in 0 ..< n {
        let innerIndex = (n - 1) - i
        if i % 2 == 0 {
            let outerIndex = (n - 1) - j
            numbers[outerIndex][innerIndex] = current
        } else {
            let outerIndex = j
            numbers[outerIndex][innerIndex] = current
        }
        
        current += 1
    }
}

for partialResult in numbers {
    print(partialResult.map { String($0) }.joined(separator: " "))
}