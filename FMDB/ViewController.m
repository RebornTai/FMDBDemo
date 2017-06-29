//
//  ViewController.m
//  FMDB
//
//  Created by Reborn on 21/06/2017.
//  Copyright © 2017 Reborn. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property(nonatomic,copy)FMDatabase *dataBase;
@end

@implementation ViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"你好");
    
    
    
}

//建立数据库
- (IBAction)createDatabase:(id)sender {
    
    NSString *sandBoxPath = NSHomeDirectory();
    NSString *fileName = [sandBoxPath stringByAppendingPathComponent:@"students.sqlite"];
    NSLog(@"%@",fileName);
    
    _dataBase = [FMDatabase databaseWithPath:fileName];
    
    if ([_dataBase open]) {
        NSLog(@"数据库创建成功");
    }else{
        NSLog(@"数据库创建失败");
    }
}

//建表
- (IBAction)createForm:(id)sender {
    
    if ([_dataBase open]) {
        
        NSString *string = @"create table if not exists t_students(id integer primary key autoincrement, name varchar(256) NOT NUll, age integer NOT NULL, sex varchar(256) NOT NULL)";
        BOOL result = [_dataBase executeUpdate:string];
        if (result) {
            NSLog(@"创建表格成功");
        }
        
    }
}

//添加
- (IBAction)addInfo:(id)sender {
    
//    NSString *insert = @"insert into t_student (name,age) values (?,?);";
    
    self.name = @"小红";
    self.age = 18;
    self.sex = @"female";
    
    //BOOL result = [_dataBase executeUpdate:@"insert into t_student (name, age) values (?,?);",_name,@(age)];
    BOOL result = [_dataBase executeUpdateWithFormat:@"insert into t_students (name,age,sex) values (%@,%i,%@);",_name,_age,_sex];
    
    if (result) {
        NSLog(@"增加成功");
    }
}

//删除
- (IBAction)deleteInfo:(id)sender {
    
    NSString *delete = @"delete from t_students where id = 3";
    
    BOOL result = [_dataBase executeUpdate:delete];
    if (result) {
        NSLog(@"删除成功");
    }
    
}

//修改信息
- (IBAction)changeInfo:(id)sender {
    
    NSString *change = @"update t_students set name = '小柏' where id = 1";
    BOOL result = [_dataBase executeUpdate:change];
    if (result) {
        NSLog(@"更改成功");
    }
    
}

//查询信息
- (IBAction)searchInfo:(id)sender {
    //查询记录条数
    NSString *searchCount = @"select count(*) from t_students";
    //查询所有记录
    NSString *searchAll = @"select * from t_students";
    //查询名字为"小柏"的记录
    NSString *searchName = @"select * from t_students where name = '小柏'";
    //查询名字为"小柏"的ID
    NSString *searchID = @"select id from t_students where name = '小柏'";
    FMResultSet *set = [_dataBase executeQuery:searchAll];
    while (set.next) {
        NSString *name = [set stringForColumn:@"name"];
        NSString *age = [set stringForColumn:@"age"];
        NSString *sex = [set stringForColumn:@"sex"];
        NSLog(@"名字:%@,年龄:%@,性别:%@",name,age,sex);
    }
//
}

- (IBAction)CleanAll:(id)sender {
    
    NSString *clean = @"delete from t_students";
    
    BOOL result = [_dataBase executeUpdate:clean];
    if (result) {
        NSLog(@"全部删除成功!");
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
