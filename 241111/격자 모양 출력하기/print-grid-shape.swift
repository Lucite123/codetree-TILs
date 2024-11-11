import Foundation

let nm = readLine()!.trimmingCharacters(in: .whitespaces).components(separatedBy: " ").map { Int(String($0))! }
let n = nm[0]
let m = nm[1]

var map = Array(repeating: Array(repeating: 0, count: n), count: n)

for _ in 0 ..< m {
    let rc = readLine()!.trimmingCharacters(in: .whitespaces).components(separatedBy: " ").map { Int(String($0))! }
    map[rc[0] - 1][rc[1] - 1] = rc[0] * rc[1]
}

for partialResult in map {
    print(partialResult.map { String($0) }.joined(separator: " "))
}