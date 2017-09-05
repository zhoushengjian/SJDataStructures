//
//  SJLinkNode.c
//  SJDataStructures
//
//  Created by zhoushnegjian on 2017/8/30.
//  Copyright © 2017年 https://github.com/zhoushengjian. All rights reserved.
//

#include "SJLinkNode.h"
#include <stdlib.h>

void* initLinkNode () {
    
    SJLinkNode *p = malloc(sizeof(SJLinkNode));
    p->e = 0;
    p->next = NULL;
    
    return p;
}

