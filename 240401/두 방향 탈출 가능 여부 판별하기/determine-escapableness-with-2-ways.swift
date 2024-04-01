import Foundation

let input = readLine()!.components(separatedBy: " ").map { Int(String($0))! }
let n = input[0]
let m = input[1]

var visited = [[Bool]]()
var map = [[Int]]()

for _ in 0..<n {
    let row = readLine()!.components(separatedBy: " ").map { Int(String($0))! }
    let rowVisited = Array(repeating: false, count: row.count)
    map.append(row)
    visited.append(rowVisited)
}

func isValidRange(_ x: Int, _ y: Int) -> Bool {
    return (x >= 0 && x <= n - 1) && (y >= 0 && y <= n - 1)
}

func canGo(_ x: Int, _ y: Int) -> Bool {
    return isValidRange(x, y) && visited[x][y] == false && map[x][y] != 0
}

func dfs(_ x: Int, _ y: Int) {
    let dxs = [0, 1]
    let dys = [1, 0]

    for i in 0 ..< 2 {
        let newX = x + dxs[i]
        let newY = y + dys[i]

        if canGo(newX, newY) {
            visited[newX][newY] = true
            dfs(newX, newY)
        }
    }
}

visited[0][0] = true
dfs(0, 0)

let result = visited[n - 1][m - 1] ? 1 : 0
print(result)