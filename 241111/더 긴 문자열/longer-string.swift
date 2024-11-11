import Foundation

let input = readLine()!.trimmingCharacters(in: .whitespaces).components(separatedBy: " ")

if input[0].count == input[1].count {
    print("same")
} else {
    let result = input.max(by: { $0.count < $1.count })!
    print(result, terminator: " ")
    print(result.count)
}