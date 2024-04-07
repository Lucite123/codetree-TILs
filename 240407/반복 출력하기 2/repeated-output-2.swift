import Foundation

let n = Int(readLine()!)!

func printHelloWorld(_ n: Int) {
    if n == 0 {
        return
    }

    printHelloWorld(n - 1)
    print("HelloWorld")
}

printHelloWorld(n)