//:Playground - noun: a place where people can play



import UIKit

var str = "Hello, playground"


//print 打印

print(str)





print(str,appendNewline:false)



print("\(str) xiaoming")




//浮点数 Double 表示63位浮点数,Float表示32位浮点数 自动判断为Double

let minValue = UInt8.min


let maxValue = UInt8.max


let float = 22.3

(float is Double)
(float is Float)



let Pi =  3  + 0.1415926

let Integer = 17
let binaryInteger = 0b10001   //二进制
let octaInteger = 0o21        //八进制
let hexdecimalIngeter = 0x11  //十六进制



1.25e2
1.25e-2

//可读性增强  只能是下划线

let paddedDouble = 0000123.123
let oneMillion = 1_000_100
let justOverOneMillion = 1_000_000_000_000

//:数值型类型转换 超出范围编译阶段就能检测到





