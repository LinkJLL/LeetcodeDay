//
//  July_9.swift
//  LeetcodeDayly
//
//  Created by JL L on 2025/07/09.
//

import Foundation

// 环形链表  https://leetcode.cn/problems/linked-list-cycle/solutions/440042/huan-xing-lian-biao-by-leetcode-solution/?envType=study-plan-v2&envId=top-interview-150
class Solution9 {
    /**
     快慢指针 慢指针一次走1格子 快指针 一次走走2步， 终止条件：2个不相等，就停止了，边界值 如果是head为nil,或者只有1个环形会终止条件
     如果2个相遇说明链表中有环
     */
    func hasCycle(_ head: ListNode?) -> Bool{
        if head == nil || head?.next == nil {
            return false
        }
        var slow : ListNode? = head
        var fast : ListNode? = head?.next
        while slow != fast {
            if fast == nil || slow == nil {
                return false
            }
            slow = slow?.next
            fast = fast?.next?.next
        }
        return true
    }
}
