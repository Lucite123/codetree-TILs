import Foundation

let input = readLine()!.components(separatedBy: " ").map { Int(String($0))! }
let n = input[0]
let m = input[1]

var graph: [[Int]] = [[0]]
var visited = Array(repeating: false, count: n + 1)

// 정답: 1번이 스택에서 나오기 전까지 들어간 최대 깊이 수

for _ in 0 ..< n {
    graph.append([Int]())
}

for _ in 0 ..< m {
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