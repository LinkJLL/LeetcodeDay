//
//  Oct_16Day.swift
//  LeetcodeDayly
//
//  Created by JL on 2025/10/16.
//

import UIKit
/**
 https://leetcode.cn/problems/majority-element/solutions/2362000/169-duo-shu-yuan-su-mo-er-tou-piao-qing-ledrh/?envType=study-plan-v2&envId=top-interview-150
 多数元素
 给定一个大小为 n 的数组 nums ，返回其中的多数元素。多数元素是指在数组中出现次数 大于 ⌊ n/2 ⌋ 的元素。

 你可以假设数组是非空的，并且给定的数组总是存在多数元素。
 */

class Oct_16Day: NSObject {
    public static func majorityElement(_ nums: [Int]) -> Int {
        var votes = 0
        var x = 0
        for num in nums {
            if votes == 0 {
                x = num
            }
            if num == x {
                votes -= 1
            } else {
                votes += 1
            }
        }
        return x
    }
    
    
}
