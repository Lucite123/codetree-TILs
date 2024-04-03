import Foundation

let n = Int(readLine()!)!
var map = [[Int]]()
var visited = Array(repeating: Array(repeating: false, count: n), count: n)

for _ in 0..<n {
    let row = readLine()!.trimmingCharacters(in: .whitespaces).components(separatedBy: " ").map { Int(String($0))! }
    map.append(row)
}

func isValidRange(_ x: Int, _ y: Int) -> Bool {
    return (x >= 0 && x <= n - 1) && (y >= 0 && y <= n - 1)
}

func canGo(_ x: Int, _ y: Int) -> Bool {
    return isValidRange(x, y) && map[x][y] != 0 && visited[x][y] == false
}

var count = 0

func dfs(_ x: Int, _ y: Int) {
    let dxs = [0, 0, 1, 0, -1]
    let dys = [0, 1, 0, -1, 0]

    for i in 0 ..< 5 {
        let newX = x + dxs[i]
        let newY = y + dys[i]
        // print(newX, newY)

        if canGo(newX, newY) {
            visited[newX][newY] = true
            count += 1
            dfs(newX, newY)
        }
    }
}

var result = [Int]()
for i in 0 ..< n {
    for j in 0 ..< n {
        if visited[i][j] == false && map[i][j] != 0 {
            count = 0
            dfs(i, j)

            if count == 0 {
                print(i, j)
            }
            result.append(count)
        }
    }
}

print(result.count)
let sortedResult = result.sorted()

for element in sortedResult {
    print(element)
}