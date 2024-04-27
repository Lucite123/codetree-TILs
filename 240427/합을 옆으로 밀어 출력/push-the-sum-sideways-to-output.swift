import Foundation

let n = Int(readLine()!)!

var numbers = [Int]()

for _ in 0 ..< n {
    let input = Int(readLine()!)!
    numbers.append(input)
}

let total = numbers.reduce(0, +)

var numberString = String(total)

let removed = numberString.removeFirst()
numberString.append(removed)

print(numberString)