import Foundation

let numbers = readLine()!.trimmingCharacters(in: .whitespaces).components(separatedBy: " ").map { Int(String($0))! }

var sum = numbers.reduce(0, +)

var count = 0
while sum > 10 {
    let isOne = sum % 10

    if isOne == 1 {
        count += 1
    }

    sum /= 10
}

print(count)