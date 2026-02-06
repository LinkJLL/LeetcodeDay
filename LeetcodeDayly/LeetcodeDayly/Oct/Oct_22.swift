//
//  Oct_22.swift
//  LeetcodeDayly
//
//  Created by JL on 2025/10/22.
//

import UIKit
/**
 给你两个字符串 haystack 和 needle ，请你在 haystack 字符串中找出 needle 字符串的第一个匹配项的下标（下标从 0 开始）。如果 needle 不是 haystack 的一部分，则返回  -1 。
 https://leetcode.cn/problems/find-the-index-of-the-first-occurrence-in-a-string/description/?envType=study-plan-v2&envId=top-interview-150
 Example 1:

 Input: haystack = "sadbutsad", needle = "sad"
 Output: 0
 Explanation: "sad" occurs at index 0 and 6.
 The first occurrence is at index 0, so we return 0.
 Example 2:

 Input: haystack = "leetcode", needle = "leeto"
 Output: -1
 Explanation: "leeto" did not occur in "leetcode", so we return -1.

 */
class Oct_22: NSObject {
    // 暴力解法 时间复杂度 O(nxm) 空间复杂度 O(1) 每个字符串匹配一次
    func strStr(_ haystack: String, _ needle: String) -> Int {
        guard haystack.contains(needle) else {
            return -1
        }
        let n = haystack.count
        let m = needle.count
        let haystackArray = Array(haystack)
        let needleArray = Array(needle)
        for i in 0...(n - m) {
            var flag = true
            for j in 0..<m {
                if haystackArray[i + j] != needleArray[j] {
                    flag = false
                    break
                }
            }
            if flag {
                return i
            }
        }
        return 0
    }
}
