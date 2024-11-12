import Foundation

let n = 4

var inputs = [String]()

for _ in 0 ..< n {
    inputs.append(readLine()!)
}

for input in inputs.reversed() {
    print(input)
}