import Foundation

// Complete the divisibleSumPairs function below.
func divisibleSumPairs(n: Int, k: Int, ar: [Int]) -> Int {
    
    var result = 0
    
    for i in 0..<n {
        for j in 0..<n {
            if i != j {
                if (ar[i] + ar[j]) % k == 0 {
                    result += 1
                }
            }
        }
    }
    
    return result / 2
}

let stdout = ProcessInfo.processInfo.environment["OUTPUT_PATH"]!
FileManager.default.createFile(atPath: stdout, contents: nil, attributes: nil)
let fileHandle = FileHandle(forWritingAtPath: stdout)!

guard let nkTemp = readLine() else { fatalError("Bad input") }
let nk = nkTemp.split(separator: " ").map{ String($0) }

guard let n = Int(nk[0].trimmingCharacters(in: .whitespacesAndNewlines))
    else { fatalError("Bad input") }

guard let k = Int(nk[1].trimmingCharacters(in: .whitespacesAndNewlines))
    else { fatalError("Bad input") }

guard let arTemp = readLine() else { fatalError("Bad input") }
let ar: [Int] = arTemp.split(separator: " ").map {
    if let arItem = Int($0.trimmingCharacters(in: .whitespacesAndNewlines)) {
        return arItem
    } else { fatalError("Bad input") }
}

guard ar.count == n else { fatalError("Bad input") }

let result = divisibleSumPairs(n: n, k: k, ar: ar)

fileHandle.write(String(result).data(using: .utf8)!)
fileHandle.write("\n".data(using: .utf8)!)
