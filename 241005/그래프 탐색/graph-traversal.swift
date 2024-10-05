import Foundation

let nm = readLine()!.trimmingCharacters(in: .whitespaces).components(separatedBy: " ").map { Int(String($0))! }
let n = nm[0]
let m = nm[1]

var graph: [[Int]] = [[0]]
var visited = Array(repeating: false, count: n + 1)

for _ in 0..<n {
    graph.append([Int]())
}

for _ in 0..<m {
    let input = readLine()!.components(separatedBy: " ").map { Int(String($0))! }
    let vertex = input[0]
    let connectedVertex = input[1]
    graph[vertex].append(connectedVertex)
    graph[connectedVertex].append(vertex)
}

func dfs(_ vertex: Int) {
    for currentVertex in graph[vertex] {
        if visited[currentVertex] == false {
            visited[currentVertex] = true
            dfs(currentVertex)
        }
    }
}

dfs(1)

let result = visited.filter { $0 == true }.count - 1
print(result < 0 ? 0 : result)