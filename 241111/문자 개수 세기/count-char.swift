import Foundation

let input = readLine()!.trimmingCharacters(in: .whitespaces).components(separatedBy: " ")
var count = 0
let target = readLine()!

for partialInput in input {
    for partialPartialInput in partialInput {
        let string = partialPartialInput
        if string.isUppercase == false {
            if target == String(string) {
                count += 1
            }
        }
    }
}

print(count)