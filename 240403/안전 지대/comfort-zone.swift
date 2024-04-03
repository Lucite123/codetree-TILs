import Foundation

let input = readLine()!.trimmingCharacters(in: .whitespaces).components(separatedBy: " ").map { Int(String($0))! }
let n = input[0]
let m = input[1]

var map = [[Int]]()

var maxK = 0

for _ in 0 ..< n {
    let row = readLine()!.trimmingCharacters(in: .whitespaces).components(separatedBy: " ").map { Int(String($0))! }
    maxK = max(row.max()!, maxK)
    map.append(row)
}


var visited = Array(repeating: Array(repeating: false, count: m), count: n)

func isValidRange(_ x: Int, _ y: Int) -> Bool {
    return (x >= 0 && x <= n - 1) && (y >= 0 && y <= m - 1)
}
var k = 0
func canGo(_ x: Int, _ y: Int) -> Bool {
    return isValidRange(x, y) && visited[x][y] == false && map[x][y] > k
}

func dfs(_ x: Int, _ y: Int) {
    let dxs = [0, 1, 0, -1]
    let dys = [1, 0, -1, 0]

    for dir in 0 ..< 4 {
        let newX = x + dxs[dir]
        let newY = y + dys[dir]

        if canGo(newX, newY) {
            visited[newX][newY] = true
            dfs(newX, newY)
        }
    }
}

var resultK = 1
var maxCount = 0

for currentK in 1 ... maxK {
    k = currentK
    var count = 0
    for i in 0 ..< n {
        for j in 0 ..< m {
            if canGo(i, j) {
                count += 1
                dfs(i, j)
            }
        }
    }
    if count > maxCount {
        maxCount = count
        resultK = k
    }
    visited = Array(repeating: Array(repeating: false, count: m), count: n)
}

print(resultK, maxCount)