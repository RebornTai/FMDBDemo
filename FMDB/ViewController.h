//
//  ViewController.h
//  FMDB
//
//  Created by Reborn on 21/06/2017.
//  Copyright © 2017 Reborn. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FMDatabase.h"


@interface ViewController : UIViewController

@property(nonatomic,assign)int studentId;
@property(nonatomic,strong)NSString *name;
@property(nonatomic,strong)NSString *sex;
@property(nonatomic,assign)int age;

@end

