import Foundation

struct day1 {

  enum Instruction: Character {
    case Down = ")"
    case Up   = "("

    var nextFloor: Int {
      switch(self) {
        case .Up: return 1
        case .Down: return -1
      }
    }
  }

  static func findFloor(_ inst: String) -> Int {
    return inst.reduce(0) { floor, p in
      floor + Instruction(rawValue: p)!.nextFloor
    }
  }

  static func basementPos(_ inst: String) -> Int {
    return inst.reduce((0, 0)) { acc, p in
      let (floor, count) = acc
      let inst = Instruction(rawValue: p)!

      if(floor == -1) {return acc}

      return (floor + inst.nextFloor, count + 1)
    }.1
  }
}

