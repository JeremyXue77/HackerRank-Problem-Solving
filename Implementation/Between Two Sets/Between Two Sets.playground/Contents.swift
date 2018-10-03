import Foundation

func gcd ( _  a : Int , _  b : Int ) ->  Int {
    let r = a % b
    if r !=  0 {
        return  gcd (b, r)
    } else {
        return b
    }
}

func  lcm ( _  m : Int , _  n : Int ) ->  Int {
    return m * n /  gcd (m, n)
}

func getTotalX(a: [Int], b: [Int]) -> Int {
    
    if a.min()! > b.max()! {
        return 0
    }
    
    var minlcm = a.min()!
    
    for a_num in a.sorted() {
        minlcm = lcm(a_num, minlcm)
    }
    print("Min LCM : \(minlcm)")
    
    var maxgcd = b.max()!
    
    for num in b {
        maxgcd = gcd(maxgcd, num)
    }
    
    print("Max Gcd : \(maxgcd)")
    
    var result = 0
    
    for i in 1...(b.min()! / minlcm) {
        var total = 0
        for num in b {
            if num % (minlcm * i) == 0 {
                total += 1
            }
            
            if total == b.count {
                result += 1
            }
        }
    }
    
    return result
}

let fileName = ProcessInfo.processInfo.environment["OUTPUT_PATH"]!
FileManager.default.createFile(atPath: fileName, contents: nil, attributes: nil)
let fileHandle = FileHandle(forWritingAtPath: fileName)!

guard let nmTemp = readLine() else { fatalError("Bad input") }
let nm = nmTemp.split(separator: " ").map{ String($0) }

guard let n = Int(nm[0].trimmingCharacters(in: .whitespacesAndNewlines))
    else { fatalError("Bad input") }

guard let m = Int(nm[1].trimmingCharacters(in: .whitespacesAndNewlines))
    else { fatalError("Bad input") }

guard let aTemp = readLine() else { fatalError("Bad input") }
let a: [Int] = aTemp.split(separator: " ").map {
    if let aItem = Int($0.trimmingCharacters(in: .whitespacesAndNewlines)) {
        return aItem
    } else { fatalError("Bad input") }
}

guard a.count == n else { fatalError("Bad input") }

guard let bTemp = readLine() else { fatalError("Bad input") }
let b: [Int] = bTemp.split(separator: " ").map {
    if let bItem = Int($0.trimmingCharacters(in: .whitespacesAndNewlines)) {
        return bItem
    } else { fatalError("Bad input") }
}

guard b.count == m else { fatalError("Bad input") }

let total = getTotalX(a: a, b: b)

fileHandle.write(String(total).data(using: .utf8)!)
fileHandle.write("\n".data(using: .utf8)!)
