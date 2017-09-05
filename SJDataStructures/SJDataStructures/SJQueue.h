//
//  SJQueue.h
//  FishHook使用
//
//  Created by zhoushnegjian on 2017/8/26.
//  Copyright © 2017年 zhoushengjian. All rights reserved.
//

#ifndef SJQueue_h
#define SJQueue_h

#include <stdio.h>

typedef void* QElemType;

typedef struct QNode {
    QElemType data;
    struct QNode *next;
}QNode, *QueuePtr;

typedef struct {
    QueuePtr front;
    QueuePtr rear;
}SJLinkQueue;

//初始化队列
void init_Queue(SJLinkQueue **q);

//进队
void en_Queue (SJLinkQueue *queue, QElemType e);

//出队
QElemType de_Queue(SJLinkQueue *q);

//获得当前队列大小
size_t sj_queue_size(SJLinkQueue *q);

//获得当前队列元素（指针）个数
int sj_queue_count(SJLinkQueue *q);

#endif /* SJQueue_h */


