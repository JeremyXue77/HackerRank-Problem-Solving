import Foundation

// Complete the staircase function below.
func staircase(n: Int) -> Void {
    var msg = ""
    
    for _ in 1...n {
        msg += " "
    }
    
    for _ in 1...n {
        msg.removeFirst()
        msg.append("#")
        print(msg)
    }
}

guard let n = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
    else { fatalError("Bad input") }

staircase(n: n)
