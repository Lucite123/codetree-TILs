import Foundation


let nm = readLine()!.trimmingCharacters(in: .whitespaces).components(separatedBy: " ").map { Int(String($0))! }
let n = nm[0]
let m = nm[1]

struct Line: Hashable {
	let a: Int
	let b: Int
}

// a번째 세로줄과 a + 1번째 세로줄을 연결 => y
// 위에서 부터 b번째 위치에 가로줄이 그어짐 => x


func initialMap(_ lines: [Line]) -> [[Int]] {
	var map = Array(repeating: Array(repeating: -1, count: n), count: 15 + 1)
	for (index, line) in lines.enumerated() {
		map[line.b][line.a] = index + 1
		map[line.b][line.a + 1] = index + 1
	}
	
	return map
}

// isValidRange
// 왼쪽, 오른쪽 비교

func checkRight(_ x: Int, _ y: Int, _ map: [[Int]]) -> Bool {
	guard y + 1 <= n - 1
	else { return false}
	
	let currentPosition = map[x][y]
	
	if currentPosition == map[x][y + 1] {
		return true
	}
	
	return false
}

func checkLeft(_ x: Int, _ y: Int, _ map: [[Int]]) -> Bool {
	guard y - 1 >= 0
	else { return false }
	
	let currentPosition = map[x][y]
	
	if currentPosition == map[x][y - 1] {
		return true
	}
	
	return false
}

func ladderGame(_ map: [[Int]]) -> [Int: Int] {
	
	var result = [Int: Int]()
	// 0 => 오른쪽
	// 1 => 왼쪽
	// 2 => 수직
	let dxs = [1, 1, 1]
	let dys = [1, -1, 0]
	
	for person in 0 ..< n {
		var position = (0, person)
		
		while position.0 <= 15 {
			if map[position.0][position.1] == -1 {
				position.0 += 1
				continue
			}
			
			if checkLeft(position.0, position.1, map
			) {
				position.0 += dxs[1]
				position.1 += dys[1]
			} else if checkRight(position.0, position.1, map) {
				position.0 += dxs[0]
				position.1 += dys[0]
			}
		}
		
		result[person] = position.1
	}
	
	return result
}


var lines = [Line]()

for _ in 0 ..< m {
	let line = readLine()!.trimmingCharacters(in: .whitespaces).components(separatedBy: " ").map { Int(String($0))! }
	lines.append(Line(a: line[0] - 1, b: line[1] - 1))
}

var map = initialMap(lines)
var minCount = lines.count
let pivot = ladderGame(map)


var chooseLines = [Line]()
var visited = Set<[Line]>()

func checkResult() {
	guard visited.contains(chooseLines) == false
	else { return }
//	print(chooseLines)
	let map = initialMap(chooseLines)
	let result = ladderGame(map)
	if pivot == result {
		minCount = min(minCount, chooseLines.count)
	}
	visited.insert(chooseLines)
}

// a번째 세로줄과 a + 1번째 세로줄을 연결 => y
// 위에서 부터 b번째 위치에 가로줄이 그어짐 => x

func findCombination(_ digit: Int) {
	// n == 4
	if digit >= n {
		return
	}
	
	var i = 0
	
	while i <= n - 2 {
		chooseLines.append(Line(a: i, b: digit))
		checkResult()
		findCombination(digit + 1)
		chooseLines.removeLast()
		
		checkResult()
		findCombination(digit + 1)
		
		i += 1
	}
}

findCombination(0)
print(minCount)