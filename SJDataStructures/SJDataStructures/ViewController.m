//
//  ViewController.m
//  SJDataStructures
//
//  Created by zhoushnegjian on 2017/8/30.
//  Copyright © 2017年 https://github.com/zhoushengjian. All rights reserved.
//

#import "ViewController.h"
#import "SJLinkNode.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;


@end

@implementation ViewController {
    SJLinkNode *_link;

}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"链表";
    
    
    [self creatLinkChain];
    
    
//    [self printLinkChain:_link];
//    [self revertChain:_link];
//    [self recrusiveRevertChain:_link];
    

}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    [self printLinkChain:[self revertChain2:_link]];
//    [self printLinkChain:[self revertChain:_link]];
//    [self printLinkChain:[self recrusiveRevertChain:_link]];
    
//    CFAbsoluteTime startTime = CFAbsoluteTimeGetCurrent();
//
    SJLinkNode *p = [self recrusiveRevertChain:_link];
    [self printLinkChain:p];
//
//    NSLog(@"%.9f", CFAbsoluteTimeGetCurrent()-startTime);
    

}

/**
 *  创建链表
 */
- (void)creatLinkChain {
    _link = initLinkNode();
    SJLinkNode *q = _link;
    for (int i=1; i<=10; i++) {
        SJLinkNode *node = malloc(sizeof(SJLinkNode));
        node->e = i;
        node->next = NULL;
        q->next = node;
        q = node;
    }
}

/**
 *  打印链表
 */
- (void)printLinkChain:(SJLinkNode *)p {
    
    p = p->next;
    
    while (p != NULL) {
        NSLog(@"LinkChain:%d", p->e);
        p = p->next;
    }
}

/**
 *  尾插法 逆转一个链表
 */
- (SJLinkNode *)revertChain:(SJLinkNode *)link {
    
    CFAbsoluteTime startTime = CFAbsoluteTimeGetCurrent();

    SJLinkNode *q = link;
    q = q->next;
    link->next = NULL;
    
    while (q != NULL) {
        
        SJLinkNode *p = q;
        q = q->next;
        p->next = link->next;
        
        link->next = p;
    }
    
    NSLog(@"%.9f", CFAbsoluteTimeGetCurrent()-startTime);

    
    return link;
}

/**
 *  原地逆转一个链表
 */
- (SJLinkNode *)revertChain2:(SJLinkNode *)link {
    
    CFAbsoluteTime startTime = CFAbsoluteTimeGetCurrent();
    
    SJLinkNode *p = link->next;
    SJLinkNode *r = p->next;
    
    if (p == NULL || r == NULL) {
        return link;
    }
    
    SJLinkNode *q = r->next;
    if (q == NULL) {
        link->next = r;
        r->next = p;
        p->next = NULL;
        
        return link;
    }

    p->next = NULL;
    
    while (q != NULL) {
        r->next = p;
        p = r;
        r = q;
        q = q->next;
    }
    
    r->next = p;
    q = r;
    
    link->next = q;
    
    NSLog(@"%.9f", CFAbsoluteTimeGetCurrent()-startTime);
    
    return link;
}

/**
 *  递归方式逆转一个链表
 */
- (SJLinkNode *)recrusiveRevertChain:(SJLinkNode *)head {
    
    SJLinkNode *current, *headNext;
    
    if (head == NULL) {
        return NULL;
    }
    
    if (head->next == NULL) {
        return head;
    }else {
        current = head;
        headNext = head->next;
        head = [self recrusiveRevertChain:head->next];
        headNext->next = current;
        current->next = NULL;
    }
    
    return head;
}



@end
