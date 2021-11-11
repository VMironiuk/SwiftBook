import Foundation

protocol Shape {
    func draw() -> String
}

struct Triangle: Shape {
    let size: Int

    func draw() -> String {
        var result = [String]()
        for length in 1...size {
            result.append(String(repeating: "*", count: length))
        }
        return result.joined(separator: "\n")
    }
}

struct FlippedShape<T: Shape>: Shape {
    let shape: T

    func draw() -> String {
        let result = shape.draw().split(separator: "\n")
        return result.reversed().joined(separator: "\n")
    }
}

struct JoinedShape<T: Shape, U: Shape>: Shape {
    let top: T
    let bottom: U

    func draw() -> String {
        top.draw() + "\n" + bottom.draw()
    }
}

public func opaqueTypesDemo() {
    let smallTriangle = Triangle(size: 3)
    let flippedSmallTriangle = FlippedShape(shape: smallTriangle)
    let joinedSmallTriangles = JoinedShape(top: smallTriangle, bottom: flippedSmallTriangle)
    print(joinedSmallTriangles.draw())
}
