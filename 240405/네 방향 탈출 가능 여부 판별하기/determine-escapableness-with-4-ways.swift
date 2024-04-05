import Foundation

let nm = readLine()!.trimmingCharacters(in: .whitespaces).components(separatedBy: " ").map { Int(String($0))! }
let n = nm[0]
let m = nm[1]

var map = [[Int]]()

for _ in 0 ..< n {
    let row = readLine()!.trimmingCharacters(in: .whitespaces).components(separatedBy: " ").map { Int(String($0))! }
    map.append(row)
}

var visited = Array(repeating: Array(repeating: false, count: m), count: n)

final class Queue<T> {
    var head = 0
    var array: [T?]

    init(_ array: [T?] = [T?]()) {
        self.array = array
    }

    var count: Int {
        return self.array.count - self.head
    }

    var isEmpty: Bool {
        return self.count == 0
    }

    func pop() -> T? {
        guard head < self.array.count,
        let element = self.array[head]
        else { return nil }
        
        self.array[head] = nil
        head += 1
        return element
    }

    func push(_ element: T) {
        self.array.append(element)
    }
}

func isValidRange(_ x: Int, _ y: Int) -> Bool {
    return (x >= 0 && x <= n - 1) && (y >= 0 && y <= m - 1)
}

func canGo(_ x: Int, _ y: Int) -> Bool {
    return isValidRange(x, y) && visited[x][y] == false && map[x][y] != 0
}

func bfs() {
    let dxs = [0, 1, 0, -1]
    let dys = [1, 0, -1, 0]

    while queue.isEmpty == false {
        let front = queue.pop()!

        for dir in 0 ..< 4 {
            let newX = front.0 + dxs[dir]
            let newY = front.1 + dys[dir]

            if canGo(newX, newY) {
                visited[newX][newY] = true
                queue.push((newX, newY))
            }
        }
    }
}


var queue = Queue<(Int, Int)>()
queue.push((0, 0))
bfs()

print(visited[n - 1][m - 1] ? 1 : 0)