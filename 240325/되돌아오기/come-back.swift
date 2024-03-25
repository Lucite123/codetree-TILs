import Foundation

let n = Int(readLine()!)!

var x = 0
var y = 0
var seconds = 1

let dxs = [1, 0, -1, 0]
let dys = [0, -1, 0, 1]

var dx = 0
var dy = 0

let mapper: [String: Int] = [
    "N": 3,
    "E": 0,
    "S": 1,
    "W": 2
]

func command(_ dir: String, _ count: Int) {
    dx = dxs[mapper[dir]!]
    dy = dys[mapper[dir]!]


    for _ in 0 ..< count {
        x += dx
        y += dy

        if x == 0 && y == 0 {
            print(seconds)
            exit(0)
        }
        seconds += 1
    }
}

for _ in 0 ..< n {
    let input = readLine()!.components(separatedBy: " ").map { String($0) }
    command(input[0], Int(input[1])!)
}

print(-1)