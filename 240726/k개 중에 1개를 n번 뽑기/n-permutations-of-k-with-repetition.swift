import Foundation

let kn = readLine()!.trimmingCharacters(in: .whitespaces).components(separatedBy: " ").map { Int(String($0))! }
let k = kn[0]
let n = kn[1]

var result = [Int]()

func choose(num: Int) {
    if num == n {
        let printResult = result.map { String($0) }
        print(printResult.joined(separator: " "))
        return 
    }

    for i in 1 ... k {
        result.append(i)
        choose(num: num + 1)
        result.removeLast()
    }
}

choose(num: 0)