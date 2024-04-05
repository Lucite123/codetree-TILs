import Foundation

let nk = readLine()!.trimmingCharacters(in: .whitespaces).components(separatedBy: " ").map { Int(String($0))! }
let n = nk[0]
let k = nk[1]

var map = [[Int]]()

for _ in 0..<n {
    let row = readLine()!.trimmingCharacters(in: .whitespaces).components(separatedBy: " ").map { Int(String($0))! }
    map.append(row)
}

var visited = Array(repeating: Array(repeating: false, count: n), count: n)

var positions = [[Int]]()

for _ in 0..<k {
    let position = readLine()!.trimmingCharacters(in: .whitespaces).components(separatedBy: " ").map { Int(String($0))! }
    positions.append(position)
}

final class Queue<T> {
    var head = 0
    var array: [T?]

    var count: Int {
        return self.array.count - self.head
    }

    var isEmpty: Bool {
        return self.count == 0
    }

    init(_ array: [T?] = [T?]()) {
        self.array = array
    }

    func push(_ element: T) {
        self.array.append(element)
    }

    func pop() -> T? {
        guard self.head < self.array.count,
        let element = self.array[head]
        else { return nil }

        self.array[head] = nil
        self.head += 1

        return element
    }
}

func isValidRange(_ x: Int, _ y: Int) -> Bool {
    return (x >= 0 && x <= n - 1) && (y >= 0 && y <= n - 1)
}

func canGo(_ x: Int, _ y: Int) -> Bool {
    return isValidRange(x, y) && visited[x][y] == false && map[x][y] != 1
}

var queue = Queue<(Int, Int)>()

func bfs() {
    let dxs = [0, 1, 0, -1]
    let dys = [1, 0, -1, 0]

    while queue.isEmpty == false {
        let front = queue.pop()!
        for dir in 0..<4 {
            let newX = front.0 + dxs[dir]
            let newY = front.1 + dys[dir]

            if canGo(newX, newY) {
                visited[newX][newY] = true
                queue.push((newX, newY))
            }
        }
    }
}



struct Position: Hashable {
    let x: Int
    let y: Int
}

var result = Set<Position>()

for position in positions {
    let x = position[0] - 1
    let y = position[1] - 1

    queue.push((x, y))
    bfs()

    for i in 0 ..< n {
        for j in 0 ..< n {
            if visited[i][j] == true {
                result.insert(Position(x: i, y: j))
            }
        }
    }
    visited = Array(repeating: Array(repeating: false, count: n), count: n)
}

print(result.count)


// 서로 다른 좌표의 갯수를 더해야함