import Foundation


let nm = readLine()!.trimmingCharacters(in: .whitespaces).components(separatedBy: " ").map { Int(String($0))! }
let n = nm[0]
let m = nm[1]

struct Line: Hashable, Comparable {
	let a: Int
	let b: Int

    static func < (lhs: Line, rhs: Line) -> Bool {
        if lhs.b > rhs.b {
            return true
        }

        return false
    }
}

var lines = [Line]()

for _ in 0 ..< m {
    let line = readLine()!.trimmingCharacters(in: .whitespaces).components(separatedBy: " ").map { Int(String($0))! }
    lines.append(Line(a: line[0] - 1, b: line[1] - 1))
}


func initialResult(_ lines: [Line]) -> [Int] {

    var persons = [Int]()

    for person in 0 ..< n {
        persons.append(person)
    }

    for line in lines {
        let temp = persons[line.a]
        persons[line.a] = persons[line.a + 1]
        persons[line.a + 1] = temp
    }

    return persons
}
lines = lines.sorted()
let pivot = initialResult(lines)

var selectedLines = [Line]()

func isPossible() -> Bool {
    var persons = [Int]()

    for person in 0..<n {
        persons.append(person)
    }

    for line in selectedLines {
        var temp = persons[line.a]
        persons[line.a] = persons[line.a + 1]
        persons[line.a + 1] = temp
    }

    // print(persons)
    // print(sortedSelectedLines)
    if pivot == persons {
        return true
    }

    return false
}

var minCount = lines.count

func findCombination(_ cnt: Int) {
    if cnt == m {
        if isPossible() {
            minCount = min(minCount, selectedLines.count)
        }
        return 
    }

    selectedLines.append(lines[cnt])
    findCombination(cnt + 1)
    selectedLines.removeLast()

    
    findCombination(cnt + 1)
}




findCombination(0)

print(minCount)