import Foundation

var one = [[Int]]()
let n = 3


for _ in 0 ..< n {
    let input = readLine()!.trimmingCharacters(in: .whitespaces).components(separatedBy: " ").map { Int(String($0))! }
    one.append(input)
}

var two = [[Int]]()

readLine()!

for _ in 0 ..< n {
    let input = readLine()!.trimmingCharacters(in: .whitespaces).components(separatedBy: " ").map { Int(String($0))! }
    two.append(input)
}

var result = Array(repeating: Array(repeating: 0, count: n), count: n)

for i in 0 ..< n {
    for j in 0 ..< n {
        result[i][j] = one[i][j] * two[i][j]
    }
}

for partialResult in result {
    print(partialResult.map { String($0) }.joined(separator: " "))
}