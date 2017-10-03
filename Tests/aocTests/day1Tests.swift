import Quick
import Nimble

@testable import aoc

class Day1Spec: QuickSpec {

  override func spec() {

    let file = try! String(contentsOfFile: "./Tests/aocTests/day1.input.txt")
    let instructions = file.components(separatedBy: "\n").first!

    describe("findFloor") {
      describe("When using balanced parenthesis") {
        it("Always returns 0") {
          expect(day1.findFloor("()()")) == 0
          expect(day1.findFloor("(())")) == 0
        }
      }

      describe("When using more parethesis") {
        it("Ends in floor 3") {
          expect(day1.findFloor("(((")) == 3
          expect(day1.findFloor("(()(()(")) == 3
        }
      }

      describe("When using one less parethesis") {
        it("Ends in floor -1") {
          expect(day1.findFloor("(()))")) == -1
          expect(day1.findFloor("))(")) == -1
        }
      }

      describe("Part A - reading the input file") {
        it("Ends in floor 138") {
          expect(day1.findFloor(instructions)) == 138
        }
      }
    }

    describe("basementPos") {
      describe("Enters the basement when reaches negative unbalance") {
        it("Enters the basement on first char") {
          expect(day1.basementPos(")")) == 1
        }
      }

      describe("Part B") {
        it("Finds the basement in position 1771") {
          expect(day1.basementPos(instructions)) == 1771
        }
      }
    }
  }

}
