//
//  June_5.swift
//  LeetcodeDayly
//
//  Created by JL L on 2025/06/05.
//

import Foundation
//给你一个链表的头节点 head ，判断链表中是否有环。
//如果链表中有某个节点，可以通过连续跟踪 next 指针再次到达，则链表中存在环。 为了表示给定链表中的环，评测系统内部使用整数 pos 来表示链表尾连接到链表中的位置（索引从 0 开始）。注意：pos 不作为参数进行传递 。仅仅是为了标识链表的实际情况。

class  June_5 {
    //快慢指针 慢指针一次走1格，快指针1次走2格，如果相遇代表有环，如果未相遇 或者为nil说明没有换
    func hasCycle(_ head: ListNode?) -> Bool{
        if head == nil || head?.next == nil {
            return false
        }
        var fast = head
        var slow = head
        
        while fast != nil && fast!.next != nil {
            fast = fast!.next!.next
            slow = slow!.next!
            if fast === slow {
                return true
            }
        }
        return false
        
    }
    
    //哈希表 如果包含 说明有环，如果不包含 说明没有
    func hashHasCycle(_ head: ListNode?) -> Bool{
        if head == nil || head?.next == nil {
            return false
        }
        var list : [ListNode?] = [head]
        var next = head
        while next != nil {
            if list.contains(where: {$0 == next}){
                return true
            }
            list.append(next)
            next = next!.next
        }
        return false
    }
    
}
