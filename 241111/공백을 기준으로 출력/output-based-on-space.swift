import Foundation

let input1 = readLine()!.trimmingCharacters(in: .whitespaces).components(separatedBy: " ")
let input2 = readLine()!.trimmingCharacters(in: .whitespaces).components(separatedBy: " ")

let result = input1 + input2

for partialResult in result {
    print(partialResult, terminator: "")
}