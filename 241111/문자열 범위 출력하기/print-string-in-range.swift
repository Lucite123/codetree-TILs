import Foundation

let input = readLine()!.map { String($0) }

var result = ""

for index in 2 ..< 10 {
    let partialString = input[index]
    result.append(partialString)
}

print(result)