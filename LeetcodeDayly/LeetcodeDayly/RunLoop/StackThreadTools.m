//
//  StackThreadTools.m
//  LeetcodeDayly
//
//  Created by JL L on 2025/05/11.
//

#import "StackThreadTools.h"
#import <mach/mach.h>
#import <pthread/pthread.h>

@implementation StackThreadTools

- (void)getStackTread{
    
    thread_array_t list;
    mach_msg_type_number_t count;
    task_threads(mach_task_self(), &list, &count);
    
    
    for (int i = 0; i < count; i++) {
        thread_t thread = list[i];
        pthread_t pt = pthread_from_mach_thread_np(thread);
        if ([NSThread isMainThread] /*&& thread == main_thread_id**/) {
            
        }
//        if (pt) {
//            name[0] = "\0"
//            pthread_getname_np(pt, name, sizeof(name))
//            if (<#condition#>) {
//                <#statements#>
//            }
//        }
    }
}

@end
