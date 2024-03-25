import Foundation
let input = readLine()!

let commands = input.map { String($0) }

var x = 0
var y = 0
var elapsedTime = 0
var answer = -1

var dir = 3

let dxs = [1, 0, -1, 0]
let dys = [0, -1, 0, 1]

for command in commands {
    switch command {
        case "L":
            dir = (dir + 1) % 4
        case "R":
            dir = ((dir - 1) + 4) % 4
        default:
            x += dxs[dir]
            y += dys[dir]
    }

    elapsedTime += 1

    if x == 0 && y == 0 {
        answer = elapsedTime
        break
    }
}

print(answer)