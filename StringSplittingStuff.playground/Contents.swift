//: Playground - noun: a place where people can play

//  Created by DonMag on 6/10/16.


import UIKit

extension String {
	
	func splitByCount(n: Int, includeRemainder: Bool = false, useRegex: Bool = false) -> [String] {
		
		var rtn = [String]()
		
		if useRegex {
			
			var pattern = ""
			for _ in 0..<n {
				pattern += "."
			}
			var regex: NSRegularExpression
			do {
				let rgx = try NSRegularExpression(pattern: pattern, options: [])
				regex = rgx
			} catch {
				// error creating regex
				return rtn
			}
			let NSCopy = self as NSString
			let matches = regex.matchesInString(self, options: [], range: NSMakeRange(0, NSCopy.length))
			
			rtn = matches.map{NSCopy.substringWithRange($0.range)}
			
			if includeRemainder && self.characters.count % n != 0 {
				rtn.append(self.substringFromIndex(self.endIndex.advancedBy(-(self.characters.count % n))))
			}
			
		} else {
			
			var j = self.startIndex
			
			while (j.distanceTo(self.endIndex) >= n) {
				
				let i = j
				
				j = j.advancedBy(n)
				
				rtn.append(self.substringWithRange(i..<j))
				
			}
			
			if includeRemainder && j < self.endIndex {
				rtn.append(self.substringFromIndex(j))
			}
			
		}
		
		return rtn
		
	}
	
}

var sbc = [String]()
var nstr = "AABBCCDDEEFFGGHHIIJJKK"

var nLen = 2

sbc = nstr.splitByCount(nLen, includeRemainder: true, useRegex: true)
sbc = nstr.splitByCount(nLen, includeRemainder: true, useRegex: false)
sbc = nstr.splitByCount(nLen, includeRemainder: false, useRegex: true)
sbc = nstr.splitByCount(nLen, includeRemainder: false, useRegex: false)

