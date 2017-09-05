//
//  SortViewController.m
//  SJDataStructures
//
//  Created by zhoushnegjian on 2017/9/4.
//  Copyright © 2017年 https://github.com/zhoushengjian. All rights reserved.
//

#import "SortViewController.h"

@interface SortViewController ()

@end

@implementation SortViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"排序查找";
        
    
    NSArray *array = @[@21, @15, @10, @9, @7, @12, @5, @17, @29, @28];
    
    int ary[10] = {21, 15, 10, 9, 7, 12, 5, 17, 29, 28};
    
    [self quickSort:ary leading:0 trailing:9];
    
//    for (int i=0; i<10; i++) {
//        NSLog(@"%d",ary[i]);
//    }
    
    
    NSMutableArray *ary1 = [self quickSort:[[NSMutableArray alloc] initWithArray:array] start:0 end:(int)array.count-1];
    NSLog(@"%@", ary1);
}

/**
 *  快排 OC数组
 */
- (NSMutableArray *)quickSort:(NSMutableArray *)array start:(int)i end:(int)j {
    int start = i;
    int end   = j;
    
    NSNumber *pivot = array[i];
    
    while (i<j) {
        while (array[j]>pivot && i<j ) j--;
        array[i] = array[j];
        
        while (array[i]<pivot && i<j)  i++;
        array[j] = array[i];
    }
    
    array[i] = pivot;
    
    if (i-1 > start) [self quickSort:array start:start end:i-1];
    
    if (i+1 < end) [self quickSort:array start:i+1 end:end];
    
    return array;
}

/**
 *  快排 C数组
 */
- (void)quickSort:(int[])array leading:(int)i trailing:(int)j {
    
    int start = i;
    int end   = j;
    
    int temp = array[i];
    while (i < j) {
        while (array[j]>temp && i<j) j--;
        array[i] = array[j];
        
        while (array[i]<temp && i<j) i++;
        array[j] = array[i];
    }
    
    array[i] = temp;
    
    if (i-1 > start) [self quickSort:array leading:start trailing:i-1];
    
    if (i+1 < end) [self quickSort:array leading:i+1 trailing:end];
}

/**
 *  冒泡
 */
- (void)bubbleSort:(NSArray *)array {
    NSMutableArray *muteAry = [[NSMutableArray alloc] initWithArray:array];
    
    for (int i=0; i<array.count; i++) {
        for (int j=(int)array.count-1; j>i; j--) {
            if (muteAry[j] < muteAry[j-1]) {
                [muteAry exchangeObjectAtIndex:j withObjectAtIndex:j-1];
            }
        }
    }
    
    NSLog(@"冒泡：%@", muteAry);
}

/**
 *  二分查找
 */
- (int)binarySearch:(int)a {
    NSArray *ary = @[@2, @5, @7, @9, @10, @12, @15, @17, @22, @28];
    
    int i=0;
    int j= ((int)ary.count-1);
    
    int n = -1;
    
    while (i <= j) {
        n = (i+j)/2;
        
        if ([ary[n] intValue] == a) {
            break;
        }else if ([ary[n] intValue] > a) {
            j = n-1;
        }else {
            i = n+1;
        }
    }
    
    if (i > j) {
        n = -1;
    }
    
    NSLog(@"二分查找:%d", n);
    
    return n;
    
}

/**
 *  两个升序列数组合并
 */
- (void)sortArrayAB {
    NSArray *ary1 = @[@2, @5, @8, @10, @14, @16];
    NSArray *ary2 = @[@3, @7, @9, @11, @15, @17];
    NSMutableArray *ary = [NSMutableArray array];
    
    int i=0, j=0;
    while (i<ary1.count && j<ary2.count) {
        if (ary1[i] > ary2[j]) {
            [ary addObject:ary2[j]];
            j++;
        }else {
            [ary addObject:ary1[i]];
            i++;
        }
    }
    
    if (i != ary1.count) {
        while (i != ary1.count) {
            [ary addObject:ary1[i]];
            i++;
        }
    }
    
    if (j != ary2.count) {
        while (j != ary2.count) {
            [ary addObject:ary2[j]];
            j++;
        }
    }
    
    NSLog(@"合并数组：%@", ary);
}

@end
