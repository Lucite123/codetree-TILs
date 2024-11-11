import Foundation

var inputs = [String]()

for _ in 0 ..< 3 {
    let input = readLine()!
    inputs.append(input)
}

let minResult = inputs.min(by: { $0.count < $1.count })!
let maxResult = inputs.max(by: { $0.count < $1.count })!

print(maxResult.count - minResult.count)