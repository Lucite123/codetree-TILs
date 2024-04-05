import Foundation

let nk = readLine()!.trimmingCharacters(in: .whitespaces).components(separatedBy: " ").map { Int(String($0))! }
let n = nk[0]
let k = nk[1]

var map = [[Int]]()

for _ in 0 ..< n {
    let row = readLine()!.trimmingCharacters(in: .whitespaces).components(separatedBy: " ").map { Int(String($0))! }
    map.append(row)
}

var visited = Array(repeating: Array(repeating: false, count: n), count: n)

let rc = readLine()!.trimmingCharacters(in: .whitespaces).components(separatedBy: " ").map { Int(String($0))! }
let r = rc[0]
let c = rc[1]

// 상하좌우가 현재칸보다 크면 못감
// 뒤가 막혀있는 경우 생각해야

func isValidRange(_ x: Int, _ y: Int) -> Bool {
    return (x >= 0 && x <= n - 1) && (y >= 0 && y <= n - 1)
}

func checkBlock(_ x: Int, _ y: Int) -> Bool {
    let dxs = [0, 1, 0, -1]
    let dys = [1, 0, -1 ,0]

    var count = 0

    let currentValue = map[x][y]

    for dir in 0 ..< 4 {
        let newX = x + dxs[dir]
        let newY = y + dys[dir]

        if isValidRange(newX, newY) && map[newX][newY] <= currentValue  {
            count += 1
        }
    }

    return count > 0
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
        let element = self.array[self.head]
        else { return nil }

        self.array[self.head] = nil
        self.head += 1

        return element
    }
}

func canGo(_ x: Int, _ y: Int, _ currentValue: Int) -> Bool {
    return isValidRange(x, y) && visited[x][y] == false && map[x][y] < currentValue
}

var queue = Queue<(Int, Int)>()

func dfs() {
    let dxs = [0, 1, 0, -1]
    let dys = [1, 0, -1, 0]
    let currentValue = map[x][y]

    while queue.isEmpty == false {
        let front = queue.pop()!

        for dir in 0..<4 {
            let newX = front.0 + dxs[dir]
            let newY = front.1 + dys[dir]

            if canGo(newX, newY, currentValue)  {
                visited[newX][newY] = true
                queue.push((newX, newY))
            }
        }
    }
}

func findMaxPosition(_ visited: [[Bool]]) -> (Int, Int) {
    var maxValue = 0
    var x = 0
    var y = 0

    for i in 0 ..< visited.count {
        for j in 0 ..< visited.count {
            if visited[i][j] {
                if maxValue < map[i][j] {
                    maxValue = map[i][j]
                    x = i
                    y = j
                }
            }
        }
    }

    return (x, y)
}

var x = r - 1
var y = c - 1

if checkBlock(x, y) == false {
    print(x + 1, y + 1)
    exit(0)
}

queue.push((x, y))

for _ in 0 ..< k {
    
    dfs()
    let position = findMaxPosition(visited)
    x = position.0
    y = position.1

    if checkBlock(x, y) == false {
        print(x + 1, y + 1)
        exit(0)
    }

    queue.push((x, y))
    visited = Array(repeating: Array(repeating: false, count: n), count: n)
}

print(x + 1, y + 1)