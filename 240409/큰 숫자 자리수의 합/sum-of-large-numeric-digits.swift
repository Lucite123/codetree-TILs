import Foundation

let numbers = readLine()!.trimmingCharacters(in: .whitespaces).components(separatedBy: " ").map { Int(String($0))! }

let timesOfNumbers = numbers.reduce(1, *)


func sum(_ n: Int) -> Int {
    if n < 10 {
        return n
    }

    return sum(n / 10) + n % 10
}

print(sum(timesOfNumbers))