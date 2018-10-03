import Foundation

/*
 * Complete the gradingStudents function below.
 */
func gradingStudents(grades: [Int]) -> [Int] {
    
    var newGrades = [Int]()
    
    for grade in grades {
        
        if grade + 5 < 40 {
            newGrades.append(grade)
        } else if grade % 5 != 0 {
            let newGrade = (grade / 5 + 1) * 5
            if newGrade - grade < 3 {
                newGrades.append(newGrade)
            } else {
                newGrades.append(grade)
            }
        } else {
            let newGrade = (grade / 5) * 5
            if newGrade - grade < 3 {
                newGrades.append(newGrade)
            } else {
                newGrades.append(grade)
            }
        }
        
    }
    
    return newGrades
}

let fileName = ProcessInfo.processInfo.environment["OUTPUT_PATH"]!
FileManager.default.createFile(atPath: fileName, contents: nil, attributes: nil)
let fileHandle = FileHandle(forWritingAtPath: fileName)!

guard let n = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
    else { fatalError("Bad input") }

let grades: [Int] = AnyIterator{ readLine() }.prefix(n).map {
    if let gradesItem = Int($0.trimmingCharacters(in: .whitespacesAndNewlines)) {
        return gradesItem
    } else { fatalError("Bad input") }
}

guard grades.count == n else { fatalError("Bad input") }

let result = gradingStudents(grades: grades)

fileHandle.write(result.map{ String($0) }.joined(separator: "\n").data(using: .utf8)!)
fileHandle.write("\n".data(using: .utf8)!)
