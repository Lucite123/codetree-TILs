import Foundation

let n = 4
var inputs = [String]()

for _ in 0 ..< 4 {
    let input = readLine()!
    inputs.append(input)
}

for i in 0 ..< 4{
    let index = inputs.count - 1 - i
    print(inputs[index])
}