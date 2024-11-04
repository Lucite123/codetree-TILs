import Foundation

let n = Int(readLine()!)!
let input = readLine()!.trimmingCharacters(in: .whitespaces).components(separatedBy: " ").map { Int(String($0))! }
let numbers = [0] + input

var result: [Int] = []
var currentNumbers: [Int] = []
for (index, number) in numbers.enumerated() {
    if index == 0 {
        continue
    }

    currentNumbers.append(number)

    if index == 1 {
        result.append(number)
        continue
    }

    if index % 2 != 0 {
        currentNumbers = currentNumbers.sorted()
        let index = currentNumbers.count / 2
        result.append(currentNumbers[index])
    }
}

print(result.map { String($0) }.joined(separator: " "))