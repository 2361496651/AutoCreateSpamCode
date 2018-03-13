//
//  main.m
//  AutoCreateSpamCode
//
//  Created by zengchunjun on 2018/2/24.
//  Copyright © 2018年 曾春军. All rights reserved.
//

#import <Foundation/Foundation.h>

//引入的头文件
NSString *PublicHeader = @"APublicHeader.h";
//外部(delegate)调用的类
NSString *publicCallClassName = @"ASpamCode_Public";
//垃圾代码输出路径
NSString *outDirectory = @"/Users/zengchunjun/workspace/SDK_Tools/SpamCode2";



void generateSpamCodeFile(); //生成垃圾代码

NSString *getRandomClassName(int length);//获取随机类名

NSString *beforeClass = nil; //上一个类名
NSString *beforeClassMethod = nil; //上一个类的方法名 前半段
NSString *beforeClassArg = nil;//上一个类的参数 后半段方法名

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        
    
        int count = 88;
        while (count > 0) {
            NSString *className = getRandomClassName(7);//随机字符串

            generateSpamCodeFile(outDirectory,className);
            
            count--;
        }
        
        generateSpamCodeFile(outDirectory, publicCallClassName);//生成一个唯一的类，用来外界调用
        
    }
    return 0;
}

#pragma mark:************公共方法****************

#pragma mark:获取随机指定位数的字符串 小写
NSString * getRandomStringsWithLow(int length){
    char data[length];
    
    for (int x=0;x < length; data[x++] = (char)('A' + (arc4random_uniform(26))));
    
    NSString *randomStr = [[NSString alloc] initWithBytes:data length:6 encoding:NSUTF8StringEncoding];
    
    NSString *string = [NSString stringWithFormat:@"%@",randomStr];
    
    return string;
}
#pragma mark:随机获取类前缀
NSString *getClassPrefixString(){
    
    NSString *string = @"BAG_Class_";
    NSArray *strings = @[@"A_A02_E",@"B_A01_F",@"C_A14_G",@"D_A13_H",@"E_A03_I",@"F_A04_J",@"G_A15_K",@"H_A05_L",@"I_A14_M",@"J_A06_N",@"K_A11_O",@"L_A15_P",@"M_A13_Q",@"N_A07_U",@"O_A12_W",@"P_A13_V",@"Q_A14_Y",@"S_A15_Z",@"T_16_S",@"Y_A17_T",@"Z_A18_A"];
    string = strings[(int)(arc4random() % strings.count)];
    
    return string;
}

#pragma mark:随机获取方法名前缀
NSString *getMethodPrefixString(){
    
    NSString *string = @"BAG_method_";
    NSArray *strings = @[@"bpg_X01_",@"bag_X11_",@"bmg_X12_",@"qpg_X03_",@"fag_X05_",@"wme_X13_",@"tpy_X06_",@"uad_X15_",@"msg_X13_",@"msb_X14_",@"nsg_X18_",@"okg_X12_",@"sbg_X19_",@"snk_X15_",@"ssw_X11_",@"ac_X19_",@"ef_X20_",@"cd_X09_",@"of_X12_",@"tt_X01_",@"st_X08_"];
    string = strings[(int)(arc4random() % strings.count)];
    return string;
}



#pragma mark:获取随机 类名
NSString *getRandomClassName(int length)
{
    //获取随机字符串
    NSString *randomStr = getRandomStringsWithLow(length);
    
    NSString *string = [NSString stringWithFormat:@"%@",randomStr];
    string = [[string lowercaseString] capitalizedString];//转换首字母大写
    
//    return [getClassPrefixString() stringByAppendingString:string];
    string = [[@"BJ7_" stringByAppendingString:string] stringByAppendingString:@"_C9S"];
    return string;
}

#pragma mark:随机获取字符串
NSString * getRandromString(){
    
    NSString *string = @"temp";
    
    NSArray<NSString *> *strings = @[@"parameter",@"apple",@"wangyi",@"tencent",@"abcd",@"game",@"flipped",@"crush",@"nostalgia",@"ephemeral",@"effervescence",@"evanescence",@"rendezvous",@"reminisce",@"bazinga",@"serendipity",@"mellifluous",@"petrichor",@"eudemonia",@"mother",@"passion",@"eternity",@"fantastic",@"freedom",@"tranquility",@"sweetheart",@"gorgeous",@"sophisticated",@"renaissance",@"cosmopolitan",@"bumblebee",@"umbrella",@"flabbergasted",@"hippopotamus",@"smashing",@"loquacious",@"smithereens",@"hodgepodge",@"shipshape",@"explosion",@"fuselage",@"zing",@"believe",@"Smithereens",@"final",@"Galaxy",@"Butterfly",@"Rainbow",@"Destiny"];
    
    string = strings[(int)(arc4random() % strings.count)];
    
    return string;
}

#pragma mark:生成随机注释字符串
NSString * getRandromNoteString(){
    
    NSString *string = @"登录，注册，测试";
    
    NSArray<NSString *> *strings = @[@"使用iOS原生来实现",@"监听web内容加载进度、是否加载完成",@"先创建配置对象，用于做一些配置",@"都使用默认的就可以了",@"在iOS上默认为NO，表示不能自动通过窗口打开",@"其实我们没有必要去创建它，因为它根本没有属性和方法",@"WKUserContentController是用于给JS注入对象的",@"传数据统一通过body传，可以是多种类型",@"只支持NSNumber, NSString, NSDate, NSArray,NSDictionary, and NSNull类型",@"通过JS与webview内容交互",@"当JS通过AppModel发送数据到iOS端时，会在代理中收到",@"可以注入多个名称（JS对象），用于区分功能",@"这里只是监听loading、title、estimatedProgress属性",@"链接跳转、接收响应、在导航开始、成功、失败等时要做些处理，就可以通过实现相关的代理方法",@"页面内容到达main frame时回调",@"导航完成时，会回调（也就是页面载入完成了）",@"对于HTTPS的都会触发此代理，如果不要求验证，传默认就行",@"9.0才能使用，web内容处理中断时会触发",@"这样一个 drawable 文件则可以通过它的名字识别",@"代码的注释经常被人忽略，其实注解有很多好处",@"方便使用，会提示注解说明",@"方便日后自己阅读代码",@"方便别人阅读自己代码",@"降低后期维护成本",@"可以快速生成开发文档",@"代码的注释方式五花八门",@"好的代码注解应该是这样的",@"可以使用[Option + 单击]查看注解",@"此方法只有头文件中属性/方法的注解才会提示",@"首先我们来看一下html部分的代码",@"首先要实例化一个WKWebView",@"这里如果没有JS调用OC的功能的话",@"需要配置WKWebViewConfiguration",@"对于WKWebView的实例化这里就不再赘述",@"我们在需要调用JS方法的位置加上下面代码",@"这样就能实现OC调用JS 方法",@"但是当我们运行的时候我们会发现",@"在前面的WKWebView使用之WKUIDelegate中",@"html的弹窗将不会再显示，那想显示弹窗，我们需要实现WKUIDelegate的代理方法",@"接下来实现代理方法",@"弹窗就会显示出来了，而且是iOS自己的原生弹窗",@"看一下iPhone X的模拟器样式",@"纯代码适配iPhone X脚底",@"纯代码的宽高比适配",@"UIBarButtonItem的适配",@"iPhone X的设计图",@"无线真机测试",@"真机地图适配",@"表示设置layer上面设置图片的的拉伸方式",@"表示当前layer设置的图片像素尺寸和试图大小的比例",@"layer上面显示的图片就是寄宿图片左上角四分之一",@"定义一个固定的边框和一个在图层上面可以拉伸的区域",@"需要设置阴影的时候，必须设置shadowOpacity的值是在0.0到1.0之间",@"当设置阴影和裁剪的时候，会把阴影的裁剪掉",@"shadowRadius控制着阴影的模糊度，当为0的时候，阴影和layer就会有一个明显的分界线，当值越来越大的时候，就会越来越自然和模糊",@"layer上面的触摸判断hitTest来判断",@"shadowPath设置阴影的图形",@"mask遮盖来设置图层显示的形状",@"layer三种拉伸过滤模式"];
    
    NSString *temp1 = strings[(int)(arc4random() % strings.count)];
    NSString *temp2 = strings[(int)(arc4random() % strings.count)];
    
    string = [temp1 stringByAppendingString:temp2];
    
    return string;
}

#pragma mark:获取当前时间string格式
NSString * getCurrentDateString(){
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat =  @"yyyy/MM/dd";
    
    return [formatter stringFromDate:[NSDate date]];
}
#pragma mark:获取当前年
NSString * getCurrentYearString(){
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat =  @"yyyy";
    
    return [formatter stringFromDate:[NSDate date]];
}




#pragma mark:方法名集合
NSSet * getMethodNamesSet(){
    
    NSMutableSet *set = [NSMutableSet set];
    
    int count = 10;
    while (count > 0) {
        
        NSString *methodPre = getMethodPrefixString();
        NSString *methodName = [methodPre stringByAppendingString:getRandromString()];
        if (methodName == nil || [methodName isEqualToString:@""]) {
            methodName = @"bird_method_";
        }
        
        methodName = [@"G9X_" stringByAppendingString:methodName];
        methodName = [methodName stringByAppendingString:@"_A8P"];
        
        [set addObject:methodName];
        count--;
    }
    
    
    
    return set;
}




#pragma mark : 生成垃圾代码

static NSString *const kHClassFileTemplate = @"\
// \n\
// %@\n\
// Created by apple on %@\n\
// \n\
// Copyright © %@年 apple. All rights reserved.\n\
//\n\n\n\
%@\n\
@interface %@ : NSObject \n\
%@\n\
@end\n";
static NSString *const kMClassFileTemplate = @"\
// \n\
// %@\n\
// Created by apple on %@\n\
// \n\
// Copyright © %@年 apple. All rights reserved.\n\
//\n\n\n\
#import \"%@.h\"\n\
#import %@ \n\
@implementation %@ \n\
%@\n\
@end\n";


#pragma mark:tools
//创建文件夹
void createDirectory(NSString *outDirectory){
    //创建目录
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if (![fileManager fileExistsAtPath:outDirectory isDirectory:NO]) {
        [fileManager createDirectoryAtPath:outDirectory withIntermediateDirectories:YES attributes:nil error:nil];
    }
}

//创建文件
void createFile(NSString *filePath,NSString *initData){
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if (![fileManager fileExistsAtPath:filePath isDirectory:NO]) {
        //第一次创建写入importString
        [initData writeToFile:filePath atomically:YES encoding:NSUTF8StringEncoding error:nil];
    }
}

//在文件末尾换号写入数据
void writeDataToEndOfFile(NSString *filePath,NSString *dataString){
    NSFileHandle *fileHandle = [NSFileHandle fileHandleForWritingAtPath:filePath];
    if (fileHandle == nil) {
        NSLog(@"Open of file for writing failed");
    }else{
        [fileHandle seekToEndOfFile];
        [fileHandle writeData:[dataString dataUsingEncoding:NSUTF8StringEncoding]];
        [fileHandle closeFile];
    }
}


#pragma mark:生成有调用关系的辣鸡代码

void generateSpamCodeFile(NSString *outDirectory,NSString *className){
    
    NSString *importString = @"#import <Foundation/Foundation.h> \n";
    
    //创建输出目录
    createDirectory(outDirectory);
    
    //一个.h头文件
    NSString *headerFilePath = [outDirectory stringByAppendingPathComponent:PublicHeader];
    createFile(headerFilePath, importString); //创建导入所有 .h 的头文件
    
    NSString *classH = [className stringByAppendingString:@".h"];
    NSString *importClassH = [NSString stringWithFormat:@"#import \"%@\" \n",classH];
   
    //往对外的头文件中写入 #import "xxxxx.h"数据
    writeDataToEndOfFile(headerFilePath, importClassH);
    
    //初始化一个.h .m文件的内容
    NSMutableString *hFileMethodsString = [NSMutableString string];
    NSMutableString *mFileMethodsString = [NSMutableString string];
    
    //方法的第二个参数名，与第二个参数前的方法名相同
    NSString *gOutParameterName = getMethodPrefixString();
    
    
    NSString *beforeMethod = nil; //正在写入方法的上一个方法(本类中)
    NSInteger index = 0; //正在写入第 index 个方法
    
    //每个类的方法集合，对外的类只用一个方法，用来调用
    NSSet *methodSets = getMethodNamesSet();
    if ([className isEqualToString:publicCallClassName]) {
        methodSets = [NSSet setWithObjects:@"main_X10_Call", nil];
        
    }
    
    NSInteger length = methodSets.count; //每个类的方法数
    for (NSString *methodName in methodSets) {
        //.h文件中新增注释 // mark:
        [hFileMethodsString appendFormat:@"//mark:%@ \n %@ (void)%@:(NSString *)%@ %@:(NSString *)%@;\n\n",getRandromNoteString(), @"+", methodName,@"arg1",gOutParameterName,gOutParameterName];
        
        
        //.m文件中新增注释 #pragma mark:
        [mFileMethodsString appendFormat:@"#pragma mark:%@ \n %@ (void)%@:(NSString *)%@ %@:(NSString *)%@ {\n",getRandromNoteString(), @"+", methodName,@"arg1",gOutParameterName,gOutParameterName];
        
        //方法内的代码
        [mFileMethodsString appendFormat:@"    NSLog(@\"function:%%s line:\", %@);\n\n", @"__FUNCTION__"];
        [mFileMethodsString appendFormat:@"    [%@ substringFromIndex:1];\n\n", gOutParameterName];
        [mFileMethodsString appendFormat:@"    [%@ isEqualToString:@\"%@\"];\n\n", gOutParameterName,getRandromString()];
        [mFileMethodsString appendFormat:@"    NSLog(@\"%%@===%%@\", %@,%@);\n\n", gOutParameterName,[NSString stringWithFormat:@"@\"%@\"",getRandromString()]];
        
        //文件内 不是第一个方法 用self调用上一个方法
        if (beforeMethod) {
            
            [mFileMethodsString appendFormat:@"    //调用%@ \n [self %@:%@ %@:%@];\n\n", beforeMethod,beforeMethod,@"arg1",gOutParameterName,gOutParameterName];
            
            if (index == length - 1) { //最后一个方法
                if (beforeClass && beforeClassMethod && beforeClassArg) {//不是生成的第一个类，开始调用上一个类的第一个方法
                    [mFileMethodsString appendFormat:@"    //调用%@ \n [%@ %@:%@ %@:%@];\n\n", beforeClass,beforeClass,beforeClassMethod,@"arg1",beforeClassArg,gOutParameterName];
                }
                
                beforeClassMethod = methodName;//上一个类的最后一个方法名
                // beforeClass 在写入文件后再赋值
                beforeClassArg = gOutParameterName;//上个类的最后一个方法的参数名
                
            }
 
        }
        
        //对 对外的那个类单独处理
        if ([className isEqualToString:publicCallClassName]) {
            if (index == length - 1) { //最后一个方法
                if (beforeClass && beforeClassMethod && beforeClassArg) {//不是生成的第一个类，开始调用上一个类的第一个方法
                    [mFileMethodsString appendFormat:@"    //调用%@ \n [%@ %@:%@ %@:%@];\n\n", beforeClass,beforeClass,beforeClassMethod,@"arg1",beforeClassArg,gOutParameterName];
                }
                
            }
        }

        //.m 类文件 结尾
        [mFileMethodsString appendString:@"}\n\n"];
        
        beforeMethod = methodName;//赋值上一个方法名

        index++; //方法数递增
    }
    
    
    //写.h文件
    NSString *fileName = [NSString stringWithFormat:@"%@.h", className];
    NSString *fileContent = [NSString stringWithFormat:kHClassFileTemplate, fileName,getCurrentDateString(),getCurrentYearString(), importString, className, hFileMethodsString];
    [fileContent writeToFile:[outDirectory stringByAppendingPathComponent:fileName] atomically:YES encoding:NSUTF8StringEncoding error:nil];
    
    //插入要导入的上一个类的头文件
    NSString *importClass = @"<Foundation/Foundation.h>";
    if (beforeClass) {
        importClass = [NSString stringWithFormat:@"\"%@\"",[beforeClass stringByAppendingString:@".h"]];
    }
    //写.m文件
    fileName = [NSString stringWithFormat:@"%@.m", className];
    fileContent = [NSString stringWithFormat:kMClassFileTemplate, fileName, getCurrentDateString(),getCurrentYearString(), className,importClass, className, mFileMethodsString];
    [fileContent writeToFile:[outDirectory stringByAppendingPathComponent:fileName] atomically:YES encoding:NSUTF8StringEncoding error:nil];
    
    
    //重新赋值 上一个类名
    beforeClass = className;//赋值上一个类名
}

