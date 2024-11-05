import Foundation

let n = 4

for _ in 0 ..< n {
    let input = readLine()!.trimmingCharacters(in: .whitespaces).components(separatedBy: " ").map { Int(String($0))! }
    print(input.reduce(0, +))
}