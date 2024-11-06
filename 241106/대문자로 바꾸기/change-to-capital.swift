import Foundation

let n = 5

var result = [String]()

func execute(_ input: [String]) {
    result.append(input.map { $0.uppercased() }.joined(separator: " "))
}

for _ in 0 ..< 5 {
    let input = readLine()!.trimmingCharacters(in: .whitespaces).components(separatedBy: " ")
    execute(input)
}

for partialResult in result {
    print(partialResult)
}