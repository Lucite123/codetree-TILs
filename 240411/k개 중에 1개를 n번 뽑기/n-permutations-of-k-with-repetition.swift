import Foundation

let kn = readLine()!.trimmingCharacters(in: .whitespaces).components(separatedBy: " ").map { Int(String($0))! }
let k = kn[0]
let digit = kn[1]

var result = [Int]()    

func Print() {
    let resultString = result.map { String($0) }
    print(resultString.joined(separator: " "))
}

func choice(_ n: Int) {
    if n == digit {
        Print()
        return
    }

    for pickedNumber in 1 ... k {
        result.append(pickedNumber)
        choice(n + 1)
        result.removeLast()
    }
}

choice(0)