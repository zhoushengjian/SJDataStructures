//
//  SJLinkNode.h
//  SJDataStructures
//
//  Created by zhoushnegjian on 2017/8/30.
//  Copyright © 2017年 https://github.com/zhoushengjian. All rights reserved.
//

#ifndef SJLinkNode_h
#define SJLinkNode_h

#include <stdio.h>

typedef int SJElemType;

typedef struct SJLinkNode{
    SJElemType e;
    struct SJLinkNode *next;
}SJLinkNode;


void* initLinkNode();

#endif /* SJLinkNode_h */
