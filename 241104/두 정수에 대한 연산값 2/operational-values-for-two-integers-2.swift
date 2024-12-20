import Foundation

let ab = readLine()!.trimmingCharacters(in: .whitespaces).components(separatedBy: " ").map { Int(String($0))! }

let a = ab[0]
let b = ab[1]

func getResult(_ a: Int, _ b: Int) -> (Int, Int) {
    let minValue = min(a, b)
    let maxValue = max(a, b)


    if minValue == a {
        return (minValue + 10, maxValue * 2)
    }

    return (maxValue * 2, minValue + 10)
}

let result = getResult(a, b)

print(result.0, result.1)