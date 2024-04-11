import Foundation

let n = Int(readLine()!)!

var map = [[Int]]()
var visited = Array(repeating: Array(repeating: false, count: n), count: n)

for _ in 0..<n {
    let row = readLine()!.trimmingCharacters(in: .whitespaces).components(separatedBy: " ").map { Int(String($0))! }
    map.append(row)
}


struct BombEffect {
    let dxs: [Int]
    let dys: [Int]
}

let bombsEffects = [BombEffect(dxs: [-2, -1, 1, 2], dys: [0, 0, 0, 0]), BombEffect(dxs: [0, 1, 0, -1], dys: [1, 0, -1, 0]), BombEffect(dxs: [-1, 1, 1, -1], dys: [1, 1, -1, -1])]

var bombsPositions = [(Int, Int)]()

for i in 0 ..< n {
    for j in 0 ..< n {
        if map[i][j] == 1 {
            bombsPositions.append((i, j))
        }
    }
}

var maxVisitedCount = 0

func isValideRange(_ x: Int, _ y: Int) -> Bool {
    return (x >= 0 && x <= n - 1) && (y >= 0 && y <= n - 1)
}

func countVisited() {
    var visitedCount = 0

    for index in 0 ..< bombsPositions.count {
        let position = bombsPositions[index]
        let effect = choiceOfBombs[index]

        var x = position.0
        var y = position.1
        visited[x][y] = true

        let dxs = effect.dxs
        let dys = effect.dys

        for dir in 0..<4 {
            let newX = x + dxs[dir]
            let newY = y + dys[dir]
            if isValideRange(newX, newY) {
                visited[newX][newY] = true
            }
        }
    }

    for i in 0 ..< n {
        for j in 0 ..< n {
            if visited[i][j] == true {
                visitedCount += 1
            }
        }
    }

    maxVisitedCount = max(maxVisitedCount, visitedCount)
    visited = Array(repeating: Array(repeating: false, count: n), count: n)
}

var choiceOfBombs = [BombEffect]()

func findPermutation(_ n: Int) {
    if n == bombsPositions.count {
        countVisited()
        return
    }

    for index in 0 ..< bombsEffects.count {
        choiceOfBombs.append(bombsEffects[index])
        findPermutation(n + 1)
        choiceOfBombs.removeLast()
    }
}

findPermutation(0)
print(maxVisitedCount)