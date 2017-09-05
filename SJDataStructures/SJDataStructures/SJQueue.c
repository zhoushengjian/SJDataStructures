//
//  SJQueue.c
//  FishHook使用
//
//  Created by zhoushnegjian on 2017/8/26.
//  Copyright © 2017年 zhoushengjian. All rights reserved.
//

#include "SJQueue.h"
#include <stdlib.h>
#include <malloc/malloc.h>

//初始化队列
void init_Queue(SJLinkQueue **q) {
    
    *q = malloc(sizeof(SJLinkQueue));
    
    (*q)->front = (*q)->rear = (QNode *)malloc(sizeof(QNode));
    (*q)->front->next = NULL;
//    (*q)->rear->data = NULL;
}


//进队
void en_Queue (SJLinkQueue *queue, QElemType e) {
    
    
    QueuePtr temp = malloc(sizeof(QNode));
    
    
    
    if (temp && queue->rear) {
        temp->data = e;
        temp->next = NULL;
        queue->rear->next = temp;
        queue->rear = temp;
    }
    
}

//出队
QElemType de_Queue(SJLinkQueue *q) {
    if (q->rear == q->front) {
        return NULL;
    }
    
    QueuePtr temp = q->front->next;
    if (q->front->next == q->rear) {
        q->rear = q->front;
    }
    
    q->front->next = q->front->next->next;
    
    return temp->data;
}

//获得当前队列大小
size_t sj_queue_size(SJLinkQueue *q) {
    
    QNode *p = q->front;
    
    int totalSize = 0;
    while (p != q->rear && p) {
        size_t size = malloc_size(p);
        totalSize += size;
        
        p = p->next;
    }
    return totalSize;
}

//获得当前队列元素（指针）个数
int sj_queue_count(SJLinkQueue *q) {
    QNode *temp = q->front;
    
    int count = 0;
    while (temp != q->rear) {
        count++;
        temp = temp->next;
    }
    return count;
}


