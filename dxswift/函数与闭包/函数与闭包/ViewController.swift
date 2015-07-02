//
//  ViewController.swift
//  函数与闭包
//
//  Created by Mac mini  on 15/6/15.
//  Copyright (c) 2015年 中交虹桥. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 使用func 定义函数,然后与c语言一样使用函数名进行调用,儿函数返回值类型用->标示.
        
        
        func greet(name : String , day : String) -> String
        {
          return "Hello \(name) , today is \(day)";
        }
        
       println(greet("Simon", "Monday"));
        
       
       //Swift 的函数可以接受可变参数.
        func sumOf(numbers : Int...) -> Int{
           var sum  = 0
            for number in numbers
            {
                sum += number;
            }
            return sum;
        }
        
      println(sumOf())
             println( sumOf(43,597,12222))
        
        
        
      //Swift 的函数可以进行嵌套.被嵌套的函数可以访问外面函数定义的变量.
        
        func returnFifteen() ->Int{
            var y = 10
            func add(){
               y += 5
            
            }
            add()
            return y
        
        }
        
        println(returnFifteen())
    
     //Swift 中的函数也是基本的数据类型,也就是说可以在一个函数中返回另一个函数.
    
        func makeIncrementer() ->(Int -> Int){
            func addOne(number : Int) -> Int{
                 return 1 + number
            }
            return addOne;
        }
    
      var increment = makeIncrementer()
      increment(7);
        
    //Swift 函数当然也可以作为其他函数的参数尽心传递.
        func hasAnyMatches(list : [Int],condition : Int -> Bool) ->Bool
        {
            for item in list{
                 if (condition (item))
                 {
                    return true;
                 }
            
            }
            return false;
        
        }
        
        func lessThanTen (number : Int) -> Bool
        {
            return number < 10;
        }
        
        var numbers = [20,9,1,17];
        hasAnyMatches(numbers, lessThanTen)
        //实际上swift中的函数是闭包的一个特例.我们可以使用没有名字的{}来定义闭包,而闭包内容与返回值类型之间用 
        //用in进行分隔.
        
        
        //类与对象
        //swift中中庸class 关键字定义类.类里面属性的声明与定义变量和常量差不多,而成员方法也于普通函数的写法一样,只是写在类里面
        class NameShape{
            var numberOfSides = 0
            var name : String
            init(name : String){
                self.name = name;
            }
            
            func simpleDescription() ->String
            {
               return "A shape with \(numberOfSides) sides"
            }

        
        }
        
        //直接在类名后增加圆括号 就可以创建类的实例.然后通过点操作符访问它的属性和成员方法.
        var shape = NameShape(name: "Square")
        
        shape.numberOfSides = 7;
        var shapeDes = shape.simpleDescription()
        
    
        
        
        
        /*
           这里要注意的是 init 方法中 self 的用法. 初始化方法的参数传递与普通函数类似.类中的属性都应该进行初始化赋值
        不管是在生命的时候还是在初始化器重.
        deinit 是swi 的析构函数,与dealloc 类似, 用在对象销毁时进行清理工作.
        在类名后使用冒号 : 和父类的名字 表示继承关系,swift中并不要求每个类都有父类.
        
        子类使用override关键字来重写父类的方法,如果没有写override的话,会出现编译错误.同样编译器也会检查带有
        override 关键字的方法是否真的重写了父类的方法.
        
        
        
        */
        
        class Square : NameShape{
                var sideLength : Double
            
                init(sideLength : Double, name : String){
                self.sideLength =  sideLength
                super.init(name : name)
               
                numberOfSides = 4
            
            }
            
            func area() -> Double {
             return sideLength * sideLength
            }
            
            override func  simpleDescription() -> String {
            return "A square with sides of length \(sideLength)."
            }
            
        
        }
        
        
        let test = Square(sideLength: 5.2, name: "my test square")
        test.area()
        test.simpleDescription()
        
        
        //与objective-c 类似,swift还能给属性定义getter 和setter.
        class EquilateraTriangle : NameShape{
            var sideLength:Double = 0.0
            
            init (sideLength : Double, name : String){
            self.sideLength = sideLength
            super.init(name : name)
            numberOfSides = 3
            }
            var perimeter : Double{
                get{
                   return 3.0 * sideLength
                }
                set{
                   sideLength = newValue / 3.0
                }
                
            
            }
            
            
            override func  simpleDescription() -> String {
              return "An equilateral triangle with sides of length \(sideLength)."
            }
        }
        
        var triangle =  EquilateraTriangle(sideLength: 3.1, name: "a triangle")
        
//        triangle.perimeter
//        triangle.perimeter = 9.9
//        triangle.sideLength
        
        
       // 在perimeter 的设置方法中,新的值默认存在newValue 变量里.当然,也可以显式的在set方法后的圆括号中提供变量名字.
       // 注意EquilateralTriangle 类的初始化器里有三步:
        
        //1.设置子类中定义的属性的值.
        //2.调用父类的初始化器
        //3.改变父类中定义的属性的值
        
        //如果你不需要计算属性的值,但是想要在属性的值发生改变之前或者改变之后执行一些任务.可以使用willSet 和
        //和didSet. 例如下面的代码可以保证三角形和四边行得边长总是相同的.
        
        class TriangleAndSquare {
            
            var square : Square{
                willSet{
                    triangle.sideLength = newValue.sideLength;
                }
            }
            
            
            var triangle : EquilateraTriangle{
                willSet{
                    square.sideLength = newValue.sideLength
                }
            }
            
          
            init(size : Double,name : String){
                square = Square(sideLength: size, name: name)
                triangle = EquilateraTriangle(sideLength : size,name : name)
            
            }
            
            
            var triangleAndSquare  = TriangleAndSquare(size : 10,name:"another test shape")
//            triangleAndSquare.square.sideLength
//            triangleAndSquare.triangle.sideLength
//            triangleAndSquare.square = Square(sideLength : 50, name : "larger suqare")
//            triangleAndSquare.triangle.sideLength
            
            
            
        
        }
        //类的成员方法与函数有一个非常重要的区别.函数里得参数名只能在函数体力面使用,
        //而方法得参数名可以在调用的时候使用.
        
        class Counter{
            var count : Int = 0
            func incrementBy(amount : Int, numberOfTimes times : Int){
               count = amount * times
            }
        
        }
        
        var counter = Counter()
        
        counter.incrementBy(2,numberOfTimes : 4)
        //使用选项(Optional)的时候,可以在方法 属性等操作符前使用? . 如果选项的值为nil 则忽略执行?
        //后面的表达式,并且整个表达式的值为nil 否则就执行?后面的表达式.
        let  optionalSquare : Square? = Square(sideLength: 2.5, name: "optional square")
        let sideLength = optionalSquare?.sideLength
        
        
        //枚举与结构体
        
        //使用enum 关键字创建枚举类型.与类类似,枚举类型中一样可以定义方法.
        enum Rank : Int{
            case Ace =  1
            case Two, Three,Four,Five,Six,Seven,Eight,Nine,Ten
            case Jack,Queen,King
            func simpleDescription() -> String{
                switch self {
                case .Ace:
                    return "ace"
                case .Jack:
                    return "jack"
                case .Queen:
                    return "queen"
                case .King:
                    return "king"
                default:
                    return String(self.rawValue)
                
                }
            
            }
        
        }
        
        
        let ace = Rank.Ace
        let aceRawValue = ace.rawValue
        
    
     }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

