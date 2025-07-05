//
//  DayMay_Six.swift
//  LeetcodeDayly
//
//  Created by JL L on 2025/05/06.
//

import UIKit
/**
 链接地址： https://leetcode.cn/problems/add-two-numbers/description/
 题目：
 给你两个 非空 的链表，表示两个非负的整数。它们每位数字都是按照 逆序 的方式存储的，并且每个节点只能存储 一位 数字。
 
 请你将两个数相加，并以相同形式返回一个表示和的链表。

 你可以假设除了数字 0 之外，这两个数都不会以 0 开头。
 输入：l1 = [2,4,3], l2 = [5,6,4]
 输出：[7,0,8]
 解释：342 + 465 = 807.
 示例 2：

 输入：l1 = [0], l2 = [0]
 输出：[0]
 示例 3：

 输入：l1 = [9,9,9,9,9,9,9], l2 = [9,9,9,9]
 输出：[8,9,9,9,0,0,0,1]
 */
class ListNode: NSObject {
    public var val: Int
    public var next: ListNode?
    public  override init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}
class DayMay_Six: NSObject {
    //递归调用
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode?{
        //判断条件为链表为nil时，返回 nil
        if l1 == nil && l2 == nil {
            return nil
        }
    
        //两数相加
        var sum = (l1?.val ?? 0) + (l2?.val ?? 0)
        //如果大于等于10
        var next1 = l1?.next
        
        if sum > 9 {
            // 进1
            let  carray = sum % 10
            next1 = ListNode((next1?.val ?? 0) + carray, next1?.next)
            // 取余
            sum = sum % 10
        }
        var result = ListNode(sum, addTwoNumbers(next1, l2?.next))
        return result
    }
    
    func addTwoNumbers2(_ l1: ListNode?, _ l2: ListNode?) -> ListNode?{
        
        //设置临时变量
        var node1 = l1
        var node2 = l2
        
        //进位值
        var carry : Int = 0
        //返回结果的链表
        var resultNode = ListNode(0)
        //当前节点
        var currentNode = resultNode
        
        //未遍历的链表或者进位值大于0的场合，继续遍历
        while node1 != nil || node2 != nil || carry > 0 {
            //求和
            let sum : Int = (node1?.val ?? 0) + (node2?.val ?? 0) + carry
            //下一个链表
            node1 = node1?.next
            node2 = node2?.next
            //进位值
            carry = sum / 10
            //保存本次遍历的节点
            currentNode.next = ListNode(sum % 10)
            //更新当前节点
            currentNode = currentNode.next!
        }
        return resultNode
    }
    
}
