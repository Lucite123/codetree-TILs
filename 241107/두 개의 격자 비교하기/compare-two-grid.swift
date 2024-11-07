import Foundation

let nm = readLine()!.trimmingCharacters(in: .whitespaces).components(separatedBy: " ").map { Int(String($0))! }
let n = nm[0]
let m = nm[1]

var one = [[Int]]()
var two = [[Int]]()

for _ in 0 ..< n {
    let input = readLine()!.trimmingCharacters(in: .whitespaces).components(separatedBy: " ").map { Int(String($0))! }
    one.append(input)
}

for _ in 0 ..< n {
    let input = readLine()!.trimmingCharacters(in: .whitespaces).components(separatedBy: " ").map { Int(String($0))! }
    two.append(input)
}

var result = Array(repeating: Array(repeating: 0, count: m), count: n)

for i in 0 ..< n {
    for j in 0 ..< m {
        result[i][j] = one[i][j] == two[i][j] ? 0 : 1
    }
}

for partialResult in result {
    print(partialResult.map { String($0)}.joined(separator: " ") )
}