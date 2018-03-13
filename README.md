

使用说明:
 main.m文件最顶部参数设定，修改输出路径

//引入的头文件
NSString *PublicHeader = @"APublicHeader.h";
//外部(delegate)调用的类
NSString *publicCallClassName = @"ASpamCode_Public";
//垃圾代码输出路径
NSString *outDirectory = @"/Users/zengchunjun/workspace/SDK_Tools/SpamCode2"; 


在Xcode工程 delegate中添加如下方法

- (void)addSpamCodeMethod
{
    CFAbsoluteTime startTime =CFAbsoluteTimeGetCurrent();
    
    int random = 1234567;
    if (random % 2 == 0) { //没有必要调用
        [ASpamCode_Public main_X10_Call:@"ios" bmg_X12_:@"android"];
    }
    
    CFAbsoluteTime linkTime = (CFAbsoluteTimeGetCurrent() - startTime);
    
    NSLog(@"Linked in %f ms", linkTime *1000.0);
}

并在didFinishLaunchingWithOptions方法中调用
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    
    
    [self addSpamCodeMethod];//添加额外的code
    
    return YES;
}