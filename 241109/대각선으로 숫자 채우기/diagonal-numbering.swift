import Foundation

let nm = readLine()!.trimmingCharacters(in: .whitespaces).components(separatedBy: " ").map { Int(String($0))! }
let n = nm[0]
let m = nm[1]

var numbers = Array(repeating: Array(repeating: 0, count: m), count: n)

var current = 1
var temp = 1
for i in 0 ... n + m - 1 {
    if i <= m {
        for j in 0 ..< i {
            if j > n - 1 {
                continue
            }
            let outerIndex = j
            let innerIndex = i - j
            numbers[outerIndex][innerIndex - 1] = current

            current += 1
        }
    } else {
        for k in temp ..< n {
            let outerIndex = k
            let innerIndex = i - k

            numbers[outerIndex][innerIndex - 1] = current
            current += 1 
        }
        temp += 1
    }
}

for partialResult in numbers {
    print(partialResult.map { String($0) }.joined(separator: " "))
}