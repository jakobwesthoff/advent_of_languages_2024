/* 
    /\
   /  \
   /  \
  /  o \
  /    \
 / u    \
 --------
    ||
    ||
*/

struct XmasTree {
    var groups: Int;

    var ornaments = [
        "🎈", "🎊", "🎀", "🎁", "🔔", "🎶"
    ]

    private func makeOrnaments(width: Int, probability: Double = 0.2) -> String {
        var output=""
        var i = 0;
        while i < width {
            if i < width - 1 && Double.random(in: 0...1) < probability {
                output += ornaments.randomElement()!
                i += 2 
            } else {
                output += " "
                i += 1
            }       
        }

        return output
    }
    
    private func printGroups() {
        for i in 0..<groups {
            var frontSpacing = String(repeating: " ", count: groups - i)
            var innerSpacing = makeOrnaments(width: i*2)
            print("\(frontSpacing)/\(innerSpacing)\\")
            frontSpacing = String(repeating: " ", count: groups - i - 1)
            innerSpacing = makeOrnaments(width: (i+1)*2)
            print("\(frontSpacing)/\(innerSpacing)\\")
        } 
    }

    private func printDivider() {
        print("\(String(repeating: "-", count: groups * 2 + 2))")
    }

    private func printTrunk() {
        let trunkSpacing = String(repeating: " ", count: groups)
        print("\(trunkSpacing)||")
        print("\(trunkSpacing)||")
    }
        

    func draw() {
        printGroups()
        printDivider()
        printTrunk()
    }
}

// Just as an example of internal and external argument labels
func createNewTree(groups n: Int) -> XmasTree {
    return XmasTree(groups: n)
}

let tree = createNewTree(groups: 6)
tree.draw()
