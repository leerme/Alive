//
//  GPLocationViewController.m
//  Alive
//
//  Created by qianfeng on 15-5-27.
//  Copyright (c) 2015年 程志鹏. All rights reserved.
//

#import "GPLocationViewController.h"


#import "GPLocationModel.h"
#import "GPLocationDataModel.h"
#import "GPLocationHotCitiesModel.h"
#import "GPLocationLbsCityModel.h"
#import "GPLocationCitiesModel.h"

#import "AFHTTPRequestOperationManager.h"



@interface GPLocationViewController () <UITableViewDataSource, UITableViewDelegate>

@property(nonatomic, strong)GPLocationModel *locationModel;
@property (nonatomic, strong)UITableView *tableView;
@property (nonatomic, strong)NSMutableDictionary *sectionRowCount;
@property (nonatomic, strong)NSArray *sortArray;
@property (nonatomic, assign)NSInteger oldRow;

@end

@implementation GPLocationViewController


//懒加载plist文件,获取城市列表

+ (id)locationViewController
{
    return [[self alloc]init];
}

- (id)init
{
    if (self = [super init]) {
        
        //加载plist文件,转化模型
        [self startDownloadDataWithUrlString:@"http://act.myzaker.com/?c=city_list"];
        
        //创建tableView
        CGRect rect = CGRectMake(0, 40, 375, 667);
        UITableView *tableView = [[UITableView alloc]initWithFrame:rect style:UITableViewStylePlain];
        tableView.delegate = self;
        tableView.dataSource = self;
        [self.view addSubview:tableView];
        tableView.bounces = NO;
        self.tableView = tableView;
        
        //添加一个搜索框,不要添加到header上,这样会移动
        UISearchBar *searchBar = [[UISearchBar alloc]initWithFrame:CGRectMake(0, 64, GPSearchWidth, GPSearchheight)];
        searchBar.placeholder = @"我在...";
        [self.view addSubview:searchBar];
        searchBar.searchBarStyle = UISearchBarStyleProminent;
    }
    return self;
}


//加载网络,获取城市列表信息
-(void)startDownloadDataWithUrlString:(NSString *)urlString
{
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:urlString parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        //转换模型数据
        GPLocationModel *locationModel = [GPLocationModel locationModelWithDict:responseObject];
        
        self.locationModel = locationModel;
        
        [self traverseModel];
 
#warning mark - 网络加载完成之后,必须要roload一次,因为创建cell要比网络加载(异步的)更快
        [self.tableView reloadData];
  
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
}


//遍历模型查找出有每组多少行,存放进字典中
- (void)traverseModel
{
    NSMutableDictionary *mutDict = [[NSMutableDictionary alloc]init];
    for (int i = 0; i < 26; i++) {
        
        NSString *str = [NSString stringWithFormat:@"%c", 'A'+i];
        int count = 0;
        for (GPLocationCitiesModel *citiesModel in self.locationModel.dataModel.cities) {
            NSString *letter = citiesModel.letter;
            if ([letter isEqualToString:str]) {
                count++;
                [mutDict setObject:[NSNumber numberWithInt:count] forKey:letter];
            }
            
        }
    }
    self.sectionRowCount = mutDict;
    
//    NSLog(@"%@", mutDict);
    
    //排序字典
    NSArray *keys = [mutDict allKeys];
    //排好序的key值
    NSArray *sortArray = [keys sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
        return [obj1 compare:obj2 options:NSNumericSearch];
    }];
    
    self.sortArray = sortArray;
    
//    for (NSString *categoryId in sortArray) {
//        NSLog(@"[dict objectForKey:categoryId] === %@",[dict objectForKey:categoryId]);
//    }
//    NSLog(@"---sortArray:%@-----", sortArray);
//    NSLog(@"----sectionCount:%ld-----", self.sectionRowCount.count);
//    NSLog(@"----%@-----", self.sectionRowCount);
}



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
//    return self.sectionRowCount.count; //A-Z,#
    return 1;   //暂时不分组,就一组
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
//    NSString *key = [self.sortArray objectAtIndex:section];  //此处的key值已经排好序
//    NSNumber *row = [self.sectionRowCount objectForKey:key]; //按照key值找value值
//    NSLog(@"----section:%ld, key:%@, row:%@------", section, key, row);
//    return [row intValue];
    
    return self.locationModel.dataModel.hot_cities.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"myCell";
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:identifier];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
//    NSLog(@"----section:%ld, row:%ld-------", indexPath.section, indexPath.row);
//    GPLocationCitiesModel *citiesModel = self.locationModel.dataModel.cities[indexPath.row];
    
    GPLocationHotCitiesModel *hotCitiesModel = self.locationModel.dataModel.hot_cities[indexPath.row];
    cell.textLabel.text = hotCitiesModel.city_name;
    
    return  cell;
}

//
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [[tableView cellForRowAtIndexPath:indexPath] setAccessoryType:UITableViewCellAccessoryCheckmark];
    
    NSLog(@"即将跳转到相应城市列表");
    [self.navigationController popViewControllerAnimated:YES];
    [_delegate changeNavigationItem:self andCitiesModel:self.locationModel.dataModel.hot_cities[indexPath.row]];
}

//4.设置组名
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    
//    NSString *key = [self.sortArray objectAtIndex:section];
    return @"热门城市";
}


////5.设置快捷条
////一般组名和组index名相同,因为这样会认为是找相同的名字的组
////其实是按照位置查找的,按titleIndex的位置找这个位置上的组
- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    return self.sortArray;
}

@end
