import Foundation

let n = 4

var map = [[Int]]()

for _ in 0 ..< n {
    let input = readLine()!.trimmingCharacters(in: .whitespaces).components(separatedBy: " ").map { Int(String($0))! }
    map.append(input)
}

var result = 0
for i in 0 ..< 4 {
    for j in 0 ... i {
        result += map[i][j]
    }
}

print(result)