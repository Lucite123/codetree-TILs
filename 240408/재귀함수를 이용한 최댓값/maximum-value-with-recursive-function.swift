import Foundation

let n = Int(readLine()!)!

let numbers = readLine()!.trimmingCharacters(in: .whitespaces).components(separatedBy: " ").map { Int(String($0))! }

func findMax(_ numbers: [Int], _ n: Int) -> Int {
    if n == 0 {
        return numbers[0]
    }

    let currentMax = findMax(numbers, n - 1)
    return currentMax < numbers[n] ? numbers[n] : currentMax
}

print(findMax(numbers, n - 1))