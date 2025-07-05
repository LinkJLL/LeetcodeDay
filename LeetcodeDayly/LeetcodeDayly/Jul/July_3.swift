//
//  July_3.swift
//  LeetcodeDayly
//
//  Created by JL L on 2025/07/03.
//

import Foundation
/**
 题目链接：https://leetcode.cn/problems/reverse-linked-list-ii/description/?envType=study-plan-v2&envId=top-interview-150
 92. 反转链表 II
 */
class Solution {
    // 时间复杂度O(N) 空间复杂度O(1)
    func reverseBetween(_ head: ListNode?, _ left: Int, _ right: Int) -> ListNode? {
        let dummyNode = ListNode(-1)
        dummyNode.next = head
        // 寻找上一个left上一个节点
        var pre : ListNode? = dummyNode
        for _ in 0..<left-1{
            pre = pre?.next
        }
        // 开始查找右边下一个的节点
        var rightNode : ListNode? = pre
        for _ in 0..<(right-left){
            rightNode = rightNode?.next
        }
        //记录当前left要反转的节点
        let leftNode = pre?.next
        // 记录right 要反转的节点
        let curr = rightNode?.next
        
        // 将左边的节点置为nil
        pre?.next = nil
        rightNode?.next = nil
        // 反转链表
        self.reverseLinkedList(head: leftNode)
        // 将前节点指向右边的节点
        pre?.next = rightNode
        // 将右边的几点指向末尾的节点
        leftNode?.next = curr
        // 返回节点信息  next 因为首个是-1
        return dummyNode.next
    }
    
    
    /// 反转链表
    /// - Parameter head: 当前要反转的链表
    func reverseLinkedList(head : ListNode?){
        var pre: ListNode? = nil
        var cur = head;
        while (cur != nil) {
            let next = cur?.next;
            cur?.next = pre;
            pre = cur;
            cur = next;
        }
        
    }
    
    /// 只需遍历一次
    func reverseBetween2(_ head: ListNode?, _ left: Int, _ right: Int) -> ListNode? {
        var dumyNode : ListNode? = ListNode(-1)
        dumyNode?.next = head
        /// 获取left的上一个节点
        var pre = dumyNode
        for _ in 0..<left-1 {
            ///循环找到节点
            pre = pre?.next
        }
        /// 记录当前的节点
        var cur = pre?.next
        /// 下一个节点
        var next: ListNode? = nil
        for _ in 0..<right-left {
            //记录当前节点
            next = cur?.next
            // 将cur的下一个节点指向 next?.next
            cur?.next = next?.next
            // 将next的下一个节点指向 pre?.next
            next?.next = pre?.next
            // 将pre的下一个节点指向 next
            pre?.next = next
        }
        return dumyNode?.next
    }
    
    
}
