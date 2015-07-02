//
//  ViewController.swift
//  swift1
//
//  Created by Mac mini  on 15/6/10.
//  Copyright (c) 2015年 中交虹桥. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let value1 = "Happy birthday";
        let value2 = 16;
        var value3 =  value1 + String(value2);
        println("value3 =  \(value3)" );
        
        println("\n")
        
       var value4 = "\(value2) + \(value1)"
        println("value4 = \(value4)");
        
        
        var array1 = ["1","2","3"]
        array1[1] = "change value";
        
        var dic = [
            "key1" :"value1",
            "key2" :"value2",
        ]
        dic["key3"] = "value3";
        
        
        println("\(array1) \n \(dic) ");
        
        
        println(" \(array1.count)");
        
        array1 .insert("4", atIndex: 0);
        
        println("newArray  = \(array1)\n");
        
        //流程控制
        //使用if 和switch进行条件判断,for-in.for.while.和do-while 进行循环.条件判断时的圆括号是可选的,但是if或者循环体的{}是必须的.
        let individualScores = [33,44,53,21,22];
        var times = 0;
        for score in individualScores{
            if score > 25 {
                times += 3;
                 println(" 大于25 = \(times)\n");
            }else
            {
                times += 1;
                 println("小于 25 =\(times)\n");
                
            }
        
        }
        
        //if语句中,判断条件必须是布尔表达式
        /*你可以使用if 和 let 一起来判断是否缺失.这些值被看做是选项(Optionals).
        一个选项包含一个值或者nil来表示是否缺失内容.在类型后面添加? 标记一个值是一个选项.
        */
        
        
        var optinalString : String? = "Hello";
        
        optinalString == nil;
        var optionalName:String? = nil;
        var greeting = "Hello!";
        if let name  = optionalName{
              greeting = "Hello,\(name)";
            println("问候 : \(greeting)");
        
        }
        /*如果选项的值为nil 条件为false  否则常量被赋值给name*/
        
        
        
        // switch 语句支持任意数据类型以及比较操作,而不是被限制为整数的相等.
        
        
        let vegetable = "red pepper";
        var vegetableComment : String?;
        switch vegetable{
           case "celery":
                 vegetableComment = "Add some raisins and make ants on a log";
        case "cucumber","watercress":
                 vegetableComment = "That would make a good tea sandwich";
        case let x where x.hasSuffix("pepper"):
             vegetableComment = "Is it a spicy \(x)";
        default :
             vegetableComment = "Everything tasts good in soup.";
        
        
        }
        println("蔬菜 = \(vegetableComment)");
        
        
        
        let interestingNumbers = [
            "Prime"  : [2,3,5,7,11,13],
            "Fibonacci" : [1,1,2,3,5,8],
            "Square" : [1,4,9,16,25],
        ]
        
        var largest = 0 ;
        
        for (kind,numbers) in interestingNumbers
        {
           for number in numbers
           {
            
              if number > largest
              {
                largest = number;
              }
           }
        
        }
        
        
        println("最大数  =  \(largest)")
        
        
        var n =  2
        while n < 100{
            n *= 2;
            println("\(n)\n");
        }
        
        
        var m = 2;
        do {
        m = m*2;
          println("m = \(m)\n");
        
        }while m < 100
        
        var firstForLoop = 0
        
        for i in 0...3 {
            firstForLoop += i ;
        }
        println("firstForLoop = \(firstForLoop)\n");
        
        
        
        
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

