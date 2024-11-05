import Foundation

let numbers = readLine()!.trimmingCharacters(in: .whitespaces).components(separatedBy: " ").map { Int(String($0))! }

var result = [Int]()
for (index, number) in numbers.enumerated() {
    if index + 1 == 3 || index + 1 == 5 || index + 1 == 10 {
        result.append(number)
    }
}

print(result.reduce(0, +))