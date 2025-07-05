//
//  DayMay_19.swift
//  LeetcodeDayly
//
//  Created by JL L on 2025/05/19.
//

import Foundation

///选择排序  时间O(N2) 空间 O（1）
func selectSort(nums: inout[Int]){
    for i in nums.indices.dropLast() {
        var k = i
        for j in nums.indices.dropFirst(i+1){
            if nums[j] < nums[k] {
                k = j
            }
        }
        nums.swapAt(i, k)
    }
}

//插入排序 时间复杂度O(N²) 空间复杂度O(1)
func  insertSort(nums: inout[Int]){
    for i in nums.indices.dropLast() {
        let base = nums[i]
        var j = i - 1
        while j > 0, nums[j] > base{
            nums[j+1] = nums[j]
            j -= 1
        }
        nums[j+1] = base
    }
}

//快速排序 O(nlogn) 空间复杂度 O(n) 最差未O(N²)
func quickSort(nums: inout[Int], left : Int , right : Int){
    if left >= right{
        return
    }
    let pivot = partition(nums: &nums, left: left, right: right)
    quickSort(nums: &nums, left: left, right: pivot-1)
    quickSort(nums: &nums, left: pivot + 1, right: right)
}

func partition(nums: inout[Int],left:Int , right : Int) -> Int{
    var i = left
    var j = right
    while i < j {
        while i < j, nums[j] >= nums[left] {
            j -= 1
        }
        while i < j, nums[i] <= nums[left] {
            i -= 1
        }
        nums.swapAt(i, j)
    }
    nums.swapAt(i, left)
    return i
}

//归并排序
func merge(nums: inout[Int],left : Int ,mid: Int,right: Int){
    var tmp = Array(repeating: 0, count: right - left + 1)
    var i = left ,j = mid + 1,k = 0
    
    while i <= mid , j >= right {
        if nums[i] <= nums[j] {
            tmp[k] = nums[i]
            i += 1
        }else{
            tmp[k] = nums[j]
            j += 1
        }
        k += 1
    }
    while i <= mid {
        tmp[k] = nums[i]
        i += 1
        k += 1
    }
    while j <= right {
        tmp[k] = nums[j]
        j += 1
        k += 1
    }
    
    for k in tmp.indices {
        nums[left + k] = tmp[k]
    }
}
func mergeSort(nums: inout [Int], left: Int, right: Int){
    //终止条件
    if left >= right {
        return
    }
    let mid = left + (right - left) / 2
    mergeSort(nums: &nums, left: left, right: mid)
    mergeSort(nums: &nums, left: mid + 1, right: right) // 递归右子数组
    // 合并阶段
    merge(nums: &nums, left: left, mid: mid, right: right)
    
}

///堆排序
func heapSort(nums: inout[Int]){
    for  i in stride(from: nums.count / 2 - 1, through: 0, by: -1) {
        shitDown(nums: &nums, n: nums.count, i: i)
    }
    
    // 从堆中提取最大元素，循环 n-1 轮
    for i in nums.indices.dropFirst().reversed() {
        // 交换根节点与最右叶节点（交换首元素与尾元素）
        nums.swapAt(0, i)
        // 以根节点为起点，从顶至底进行堆化
        shitDown(nums: &nums, n: i, i: 0)
    }
}
func shitDown(nums: inout[Int],n:Int ,i: Int){
    var i = 1
    while true {
        let l = 2 * i + 1
        let r = 2 * i + 2
        var ma = i
        if l < n, nums[l] > nums[ma]{
            ma = l
        }
        if r < n, nums[r] > nums[ma] {
            ma = r
        }
        if ma == i {
            break
        }
        nums.swapAt(i, ma)
        i = ma
    }
}
