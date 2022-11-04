## Java简介
### 为什么Java应用最广泛？

从互联网到企业平台，Java是应用最广泛的编程语言，原因在于：

- Java是基于JVM虚拟机的跨平台语言，一次编写，到处运行；

- Java程序易于编写，而且有内置垃圾收集，不必考虑内存管理；

- Java虚拟机拥有工业级的稳定性和高度优化的性能，且经过了长时期的考验；

- Java拥有最广泛的开源社区支持，各种高质量组件随时可用。

### Java语言常年霸占着三大市场：

- 互联网和企业应用，这是Java EE的长期优势和市场地位；

- 大数据平台，主要有Hadoop、Spark、Flink等，他们都是Java或Scala（一种运行于JVM的编程语言）开发的；

- Android移动平台。

### Java语言特点

Java最早是由SUN公司（已被Oracle收购）的詹姆斯·高斯林（高司令，人称Java之父）在上个世纪90年代初开发的一种编程语言。

Java介于编译型语言和解释型语言之间。

> 编译型语言如C、C++，代码是直接编译成机器码执行，但是不同的平台（x86、ARM等）CPU的指令集不同，因此，需要编译出每一种平台的对应机器码。

> 解释型语言如Python、Ruby没有这个问题，可以由解释器直接加载源码然后运行，代价是运行效率太低。

> 而Java是将代码编译成一种“字节码”，它类似于抽象的CPU指令，然后，针对不同平台编写虚拟机，不同平台的虚拟机负责加载字节码并执行，这样就实现了“一次编写，到处运行”的效果。

> 当然，这是针对Java开发者而言。对于虚拟机，需要为每个平台分别开发。为了保证不同平台、不同公司开发的虚拟机都能正确执行Java字节码，SUN公司制定了一系列的Java虚拟机规范。从实践的角度看，JVM的兼容性做得非常好，低版本的Java字节码完全可以正常运行在高版本的JVM上。

随着Java的发展，SUN给Java又分出了三个不同版本：

- Java SE：Standard Edition

- Java EE：Enterprise Edition

- Java ME：Micro Edition

这三者之间有啥关系呢？

```
┌───────────────────────────┐
│Java EE                    │
│    ┌────────────────────┐ │
│    │Java SE             │ │
│    │    ┌─────────────┐ │ │
│    │    │   Java ME   │ │ │
│    │    └─────────────┘ │ │
│    └────────────────────┘ │
└───────────────────────────┘
```

> 简单来说，Java SE就是标准版，包含标准的JVM和标准库，而Java EE是企业版，它只是在Java SE的基础上加上了大量的API和库，以便方便开发Web应用、数据库、消息服务等，Java EE的应用使用的虚拟机和Java SE完全相同。

> Java ME就和Java SE不同，它是一个针对嵌入式设备的“瘦身版”，Java SE的标准库无法在Java ME上使用，Java ME的虚拟机也是“瘦身版”。

毫无疑问，Java SE是整个Java平台的核心，而Java EE是进一步学习Web应用所必须的。我们熟悉的Spring等框架都是Java EE开源生态系统的一部分。不幸的是，Java ME从来没有真正流行起来，反而是Android开发成为了移动平台的标准之一，因此，没有特殊需求，不建议学习Java ME。

因此推荐的Java学习路线图如下：

1. 首先要学习Java SE，掌握Java语言本身、Java核心开发技术以及Java标准库的使用；

2. 如果继续学习Java EE，那么Spring框架、数据库开发、分布式架构就是需要学习的；

3. 如果要学习大数据开发，那么Hadoop、Spark、Flink这些大数据平台就是需要学习的，他们都基于Java或Scala开发；

4. 如果想要学习移动开发，那么就深入Android平台，掌握Android App开发。

### 名词解释

> - JDK：Java Development Kit
> - JRE：Java Runtime Environment

JRE就是运行Java字节码的虚拟机。

但是，如果只有Java源码，要编译成Java字节码，就需要JDK，因为JDK除了包含JRE，还提供了编译器、调试器等开发工具。

二者关系如下：

```
  ┌─    ┌──────────────────────────────────┐
  │     │     Compiler, debugger, etc.     │
  │     └──────────────────────────────────┘
 JDK ┌─ ┌──────────────────────────────────┐
  │  │  │                                  │
  │ JRE │      JVM + Runtime Library       │
  │  │  │                                  │
  └─ └─ └──────────────────────────────────┘
        ┌───────┐┌───────┐┌───────┐┌───────┐
        │Windows││ Linux ││ macOS ││others │
        └───────┘└───────┘└───────┘└───────┘
```

要学习Java开发，当然需要安装JDK了。

那JSR、JCP……又是啥？

- JSR规范：Java Specification Request
- JCP组织：Java Community Process

为了保证Java语言的规范性，SUN公司搞了一个JSR规范，凡是想给Java平台加一个功能，比如说访问数据库的功能，大家要先创建一个JSR规范，定义好接口，这样，各个数据库厂商都按照规范写出Java驱动程序，开发者就不用担心自己写的数据库代码在MySQL上能跑，却不能跑在PostgreSQL上。

所以JSR是一系列的规范，从JVM的内存模型到Web程序接口，全部都标准化了。而负责审核JSR的组织就是JCP。

一个JSR规范发布时，为了让大家有个参考，还要同时发布一个“参考实现”(RI)，以及一个“兼容性测试套件”(TCK)：

- RI：Reference Implementation
- TCK：Technology Compatibility Kit

比如有人提议要搞一个基于Java开发的消息服务器，这个提议很好啊，但是光有提议还不行，得贴出真正能跑的代码，这就是RI。如果有其他人也想开发这样一个消息服务器，如何保证这些消息服务器对开发者来说接口、功能都是相同的？所以还得提供TCK这样的测试工具才行。

通常来说，RI只是一个“能跑”的正确的代码，它不追求速度，只是一个规范。所以，如果真正要选择一个Java的消息服务器，一般是没人用RI的，大家都会选择一个有竞争力的商用或开源产品

## 数据类型

### 基本类型
Java 语言提供了八种基本类型，用户无需定义也可以直接使用。其数据保存在相应的方法栈中。

|基本数据类型|	字节数|	默认值	|包装数据类型	|备注|
|----|----|----|----|----|
|byte	|1|	0|	Byte|	|
|short	|2	|0|	Short|	|
|int	|4	|0|	Integer||	
|long	|8	|0|	Long	||
|float	|4	|0.0f|	Float|	数字后加f|
|double	|8	|0.0|	Double|	|
|char	|2	|null|	Character|	必须用单引号|
|boolean|	|1|	false	|Boolean|	

- 布尔型
boolean 类型只含有两个值：true 和 false。字节存储为 11111111 和 00000000 。

```java
boolean b = true;      
boolean b = false;   
```

- 字符型
char 类型使用单引号来表示字符。因为 Java 统一采用 unicode 编码，2 字节可以表示一字符。char 类型同样可以用十六进制码保存汉字等特殊字符：'\u0000' - '\uffff'。

```java
char ch = 'a';      
char ch = '中';
char ch = '/u3089';   
```

- 整型和浮点型
Java 没有无符号类型，所有数据都有符号。

1. 整型(byte/short/int/long) 用来表示整型数据。

2. 浮点型(float/double) 用来表示浮点数据，实际以指数形式存储，所以和实际值之间有偏差。

- 为 float 类型赋值必须在数字后加 f，否则数字默认被识别为 double 类型，会导致赋值出错。

- 数字基本类型都包含最大最小值常量，如 Integer.MAX_VALUE 和 Integer.MIN_VALUE .

- 在浮点型有三个特殊数值表示溢出和出错：

  - POSITIVE_INFINITY ：正无穷大，正数除以 0 可以得到。
  - NEGATIVE_INFINITY ：负无穷大，负数除以 0 可以得到。
  - NaN ：非数，零除以 0 可以得到。（两个 NAN 值也不相等）

```java
int n = 0;
float f = 0.0f;
long l = Long.MAX_VALUE;               
double d = POSITIVE_INFINITY;
```

### 包装类型
均继承自 Number 抽象类，把基本类型数据封装成对象。基本类型和包装类型之间会自动进行转化。

- 基本类型（如int），是一个值。允许不赋初值，系统自动添加默认值。

- 包装类型（如Integer），是一个对象。实例化必须赋初值，且赋值后不能改变(final)。

包装类型主要用于集合框架中的元素。但阿里巴巴要求所有实体类(POJO) 属性、远程过程调用方法(RPC) 的返回值和参数都必须使用包装数据类型。以此来提醒使用者在需要使用时，必须显式地进行赋值。

**拆箱装箱**

所有基本类型都有对应的**类**类型,这种类就是封装类

**数字封装类**有

Byte,Short,Integer,Long,Float,Double

这些类都是抽象类Number的子类

![img](https://stepimagewm.how2j.cn/672.png)

```java
public class Test{
    public static void main (String[] args){
        int i = 5;
        //把一个基本类型的变量，转换为一个Integer对象
        Integer it = new Integer(i);

        //把一个对象，转换为一个基本类型
        int i2 = it.intValue(); 
    }
} 
```

```java
public class TestNumber {

    public static void main(String[] args) {
        int i = 5;

        Integer it = new Integer(i);
        //Integer是Number的子类，所以打印true
        System.out.println(it instanceof Number);
    }
}
```

- 自动装箱：不需要调用构造方法，通过=符号自动把 基本类型 转换为 类类型 就叫装箱
- 自动拆箱：不需要调用Integer的intValue方法，通过=就自动转换成int类型，就叫拆箱

```java
public class TestNumber {

    public static void main(String[] args) {
        int i = 5;

        //基本类型转换成封装类型
        Integer it = new Integer(i);

        //自动转换就叫装箱
        Integer it2 = i;

    }
}
```

```java
public class TestNumber {

    public static void main(String[] args) {
        int i = 5;

        Integer it = new Integer(i);

        //封装类型转换成基本类型
        int i2 = it.intValue();

        //自动转换就叫拆箱
        int i3 = it;

    }
}
```

### 数组
#### Array 类
数据的集合。本质是一个对象，数据存储在堆区，由引用指向数组首个元素的地址。

创建数组
创建数组时，必须确定数组长度和类型。但如果储存的是基本类型，允许不赋初值（使用默认值）。

```java
int[] arr = new int[4];                    // 方法一
int[] arr = {1,2,3,4};                     // 方法二
int[] arr = new int[]{1,2,3,4};            // 方法三
```

数组长度：在数组对象中，定义了 length 属性记录了数组长度。

```java
int len = arr.length;                      // 返回数组长度  
```

#### Arrays 类
对数组进行操作的辅助类，实现了对数组的常用操作。

- 数组排序
sort 方法：可以对数组排序，默认数组数值从小到大排列，用户可以自定义排列顺序，

```java
Arrays.sort(arr);                                     // 数组排序
```

- 数组复制
copyOf/copyOfRange 方法：复制数组。底层调用 System.arrayCopy 的本地方法实现，常用于数组扩容。

```java
int[] arr1 = Arrays.copyOf(arr, 10);                  // 复制数组：前 10 个单位
int[] arr2 = Arrays.copyOf(arr, 0, arr.length);       // 复制数组：从 0 到 arr.length - 1
```

- 数组转化
asList 方法：将数组转化为列表（List 类），但数组数据必须是包装类型。

调用该方法将数组转换为列表后，在内存中实际还是以数组形式存储。这可能会导致以下两个问题：

1. 调用 List 类的 add 方法向列表中插入数据，会导致异常；
2. 对原数组进行更改，也会导致列表中的数据发生变化。

```java
arr[] = new Integer[]{1, 2, 3, 4};                    // 数组必须是包装数据类型

List list = Arrays.asList(arr);                       // 将数组转换为集合（有问题）               
List list = new ArrayList<>(Arrays.asList(arr));      // 将数组转换为集合（推荐）  
```

### 字符串
#### String类
保存字符串。String 类本质是一个 final 对象，由引用指向存储字符串对象的地址。引用虽然可变，但内存数据不能被更改。

##### 创建字符串
String 对象创建后一经赋值不再改变，有以下两种创建方式：

1. 直接赋值：如果常量池没有，则在常量池新建对象。否则直接使用常量池中已有对象，**引用指向常量池**。

2. 构造方法：如果常量池没有，则在常量池新建对象。无论如何一定会在堆区创建对象，**引用指向堆区**。

```java
String str1 = "string";                       // 引用指向常量池
String str2 = "str" + "ing";                  // 引用指向常量池（指向 str1 的字符串对象）

String str3 = new String("string");           // 引用指向堆区（在堆区新建字符串对象）
String str4 = str1 + str2;                    // 引用指向堆区

String newStr = new String(str.getBytes("ISO-8859-1"), "GBK");          // 获取指定类型编码对象，按指定类型编码
```

String 对象创建后一经赋值不再改变。对字符串数据进行改变，实际是创建新的 String 对象，并改变引用指向新的对象。

```java
str1 = "goodbye";                             // str1 指向新的字符串对象
```

##### 常用方法

```java
int len = str.length();                   // 返回字符串长度

String[] strs = str.split(",");           // 按分隔符分解字符串

boolean c = str.contains(str2);           // 判断是否存在子字符串
int index = str.indexOf(str2);            // 查找子字符串出现的第一个位置，没有返回-1
int index = str.lastIndexOf(str2);        // 查找子字符串出现的最后一个位置，没有返回-1

String str2 = str.trim();                 // 去除字符串左右空格　　
String str2 = str.substring(0,3);         // 截取指定位置（0-2）的子字符串
String str2 = str.replace("a", "b");      // 新字符 a 替换旧字符 b
```

##### 类型转换

```java
// Number -> String

String s1 = data.toString();              // data 必须为包装数据类型
String s2 = Integer.toString(data);       // data 可以为基础数据类型，包括字符数组 char[]
String s3 = String.valueOf(data);         // data 可以为基础数据类型，包括字符数组 char[]

// String -> char
char c = str.charAt(0);
char[] ch = str.toCharArray();

// String -> int

int n1 = Integer.parseInt(str);          
int n2 = Integer.valueOf(str);
```

#### StringBuilder / StringBuffer 类
由于 String 类不可变性，对其频繁更改往往会产生较多临时变量类，占用大量内存。对此我们通常使用 StringBuilder/StringBuffer 来避免，这两个类**允许在原有内存地址**对字符串进行操作。

其中 `StringBuilder` 类性能更好，`StringBuffer` 类线程安全。

##### 创建字符串
必须通过构造方法创建，不可以直接赋值的形式创建:

```java
StringBuffer str = new StringBuffer("hello");
```

字符串默认长度为16，超出后会进行自动扩容。

将 `StringBuilder` / `StringBuffer` 类转化为 `String` 类。

```java
String str2 = str.toString();    
```

##### 专用方法
`StringBuilder` / `StringBuffer` 类可以使用 `String` 类的全部方法，还新增了以下方法直接对字符串进行修改。

```java
str.append("add");                 // 末尾添加字符串，也可以是其他基础类型
str.insert(0,"insert");            // 指定位置插入字符串，也可以是其他基础类型
str.deleteCharAt(6);               // 删除指定位置（6）的字符
str.delete(6,8);                   // 删除指定位置（6和7）的字符串
str.reverse(str2);                 // 翻转字符串
```

### 大数
在 Java 程序中，我们可能会用到一些数值特别巨大、或者小数特别精确的数值，这些数值无法用基础类型表示。因此我们定义了 `BigInteger`/`BigDecimal` 类来保存这类数据，实际是以字符串形式在堆区存储。

#### BigInteger 类
主要用来操作比 long 类型更大的整型数字。

#### BigDecimal 类
基于 `BigInteger` 类实现。由于基本浮点数类型(float/double) 会产生**精度丢失问题**，因此常使用 `BigDecimal` 类代替。涉及金额必须使用该类。

```java
float x = 1.0f;                           // 约等于 0.1
float a = 1.0f - 0.9f;
float b = 0.9f - 0.8f;
System.out.println(a == b);               // false

BigDecimal a = new BigDecimal("1.0");     // 等于 0.1
BigDecimal b = new BigDecimal("0.9");
BigDecimal c = new BigDecimal("0.8");
BigDecimal x = a.subtract(b);
BigDecimal y = b.subtract(c);
System.out.println(x.equals(y));          // true
```

BigInteger 和 BigDecimal 类常用方法

```java
BigDecimal x = a.add(b);                  // 加
BigDecimal x = a.subtract(b);             // 减
BigDecimal x = a.multiply(b);             // 乘
BigDecimal x = a.divide(b);               // 除
BigDecimal x = a.abs();                   // 绝对值
a.compareTo(b);                           // 比较大小

// BigDecimal 类专用
BigDecimal x = y.setScale(3, rules);      // 设置精度和保留规则
```

### 枚举

#### Enum 类
（JDK 1.5 新增）比 Class 类多了部分特殊约束的特殊类型，能更加简洁地定义常量。

使代码更具可读性，允许进行编译时检查，预先记录可接受值的列表，并避免由于传入无效值而引起的意外行为。

> 自定义枚举类实际是继承 Enum 类的 final 类，在类中将自定义该类型的 public static final 属性，并引入了相关方法。

```java
// 定义枚举类
public enum Day {
    MONDAY, TUESDAY, WEDNESDAY,
    THURSDAY, FRIDAY, SATURDAY, SUNDAY
}

// 使用枚举类
public class Demo {
    public boolean test(Day today){
        if(today == Day.MONDAY) return true;
        else teturn false;
    }
}
```

我们可以通过在枚举类型中定义属性,方法和构造函数让它变得更加强大。

实际开发中，枚举类通常的形式是有两个参数（int code，Sring msg）的构造器，可以作为状态码进行返回。

```java
public enum StatusCodeEnum{

    SUCCESS(200,"成功"), NOTFOUND(404,"未找到"), ERROR(500,"错误");

    private int code;
    private String message;

    // 根据常量自动构造
    private StatusCodeEnum(int code, String message) {
        this.code = code;
        this.message = message;
    }

    public int getCode() {
        return code;
    }

    public String getMessage() {
        return message;
    }

    @Override
    public String toString() {
        return "PinType{" +
                "code=" + code +
                ", message='" + message + '\'' +
                '}';
    }
}
```

根据常量自动构造对象并调用方法

`System.out.println(StatusCodeEnum.SUCCESS.getCode());`


### 时间
#### 数字类型
在日常 Java 开发中，我们最常使用 Long 类型，而不是 Date/Timestamp 类型表示时间。

我们可以通过 System.currentTimeMillis 方法获取当前系统时间，默认为 13 位的数字（精确到 ms）。

```java
Long timestamp1 = System.currentTimeMillis();                 // 13 位 精确到 ms
Long timestamp2 = (System.currentTimeMillis()) / 1000;        // 10 位 精确到 s
```

### 泛型
#### 泛型定义
定义类时并不固定数据类型，等到创建对象或调用方法时再明确数据类型。

**编译**过程中，由编译器检查类型安全，自动隐性地对类的数据类型进行强制转换（Object -> 指定数据类型）。编译后生成的 字节码文件(.class) 将不再含有泛型。

#### 泛型使用
可使用 A-Z 之间的任何一个字母，常用：

- T (type)： 表示具体的一个 java 类型
- K V (key value)： 分别代表 java 键值中的 Key Value
- E (element)： 代表 java 集合框架元素
- ？：表示不确定的 java 类

```java
// 定义时使用泛型
public class Box<T> {
    private T t;
    public void set(T t) {
        this.t = t;
    }
    public T get() {
        return t;
    }
} 

// 调用时明确类型
class Test{
    static void main(String[] args){
        Box<Integer> myBox = new Box<>();
        myBox.set(3);
        System.out.print(myBox.get());
    }
}
```

## 面向对象
### 什么是面向对象？
- 面向过程：根据解决问题的过程，直接设计系统。如 C 语言。

- 面向对象：将问题分解成多个对象，设计模块化、低耦合的系统。如 java 语言。

  -  特性：封装、继承、多态。

  - 优点：使系统更加灵活，易维护、易复用、易扩展。

### 封装

#### 普通内部类
定义在**类**中的类，可以使用外部类所有属性和方法。

普通内部类属于具体对象，因此不能声明 static 成员变量和方法。

成员内部类依附外部类而存在。也就是说，如果要创建普通内部类的对象，就必须首先存在外部类的对象。

> 也就是说普通内部类存在的前提必须是外部类已存在
> 就像先有卡牌堆的存在才有卡牌一样，卡牌拥有卡牌堆的所有属性和方法，但没有特殊的成员变量和方法

```java
// 外部类 
class Outter {
    private int num = "10";
    // 内部类  
    class Inner {
        void output(){
            System.out.println(num);
        }
    }
}

public class Test {
    public static void main(String[] args)  {
        // 创建内部类
        Outter outter = new Outter();
        Outter.Inner inner = outter.new Inner();  
        inner.output();
    }
}
```

#### 局部内部类
定义在一个**方法**或者一个**作用域**里的内部类。

对局部内部类的访问仅限于方法内或者该作用域内，且局部内部类不能被访问权限所修饰。

> 局部内部类是为了解释一个方法或作用域而存在的，因此无法被访问修饰符修饰

```java
public class Test {
    public static void main(String[] args)  {
        Factory f = new Factory();  //创建类对象
        Gun myrifle = f.getRifle();  //调用对象getRifle()方法，创建局部内部类
    }
}

class Factory {
    // 局部内部类
    public Gun getRifle(){  // 返回一个Gun类型
        class Rifle extends Gun {   
            int len = 60;
        }
        return new Rifle();
    }
}
```

#### 匿名内部类
匿名内部类不用定义名称，但必须继承一个父类或实现一个接口。

由于没有类名，匿名内部类不能定义构造器。

在创建匿名内部类的时候会立即创建它的实例。因此匿名内部类只能使用一次，通常用来简化代码编写。

最常用的情况就是在多线程的实现上，创建线程类传入参数需要继承 `Thread` 类或实现 `Runnable` 接口。

```java
// 父类或接口
interface Person {
    public void eat();  //只定义了一个方法名
}

public class Demo {
    public static void main(String[] args) {

        Person p = new Person() { 
            // 定义匿名内部类，定义了方法体，并且调用了它
            public void eat() {
                System.out.println("eat apple");
            }
        };
        p.eat();
    }
}
```

JDK 1.8 中引入了 Lambda 表达式，你甚至连方法名都不需要写。

```java
public class Demo {
    public static void main(String[] args) {
        Person p = new Person(() -> {   
            //Lambda表达式写出了方法体
            System.out.println("eat apple");
        });
        p.eat();
    }
}
```

**数据同步**

局部内部类和匿名内部类都定义在方法中，如果调用方法中的其他局部变量，只能调用外部类的局部 final 变量。因为在多线程中，外部类方法中定义的变量 A 在方法执行完毕后生命周期就结束了，而此时 Thread 对象的生命周期很可能还没有结束。内部类方法中访问的变量 A 实际上是拷贝。这就必须限定变量为 final，否则改动将导致数据不一致。

```java
public class Test {
    public void test(final int b) {
        final int a = 10;
        new Thread(){
            public void run() {
                System.out.println(a);
                System.out.println(b);
            };
        }.start();
    }
}
```

#### 静态内部类
静态内部类是不需要依赖于外部类，可以在不创建外部类对象的情况下创建内部类的对象。静态内部类不能使用外部类的非 static 成员变量或者方法。

```java
public class Test {
    public static void main(String[] args)  {
        // 无需外部对象，直接创建内部类
        Outter.Inner inner = new Outter.Inner();
    }
}

class Outter {
    static class Inner {
        int data = 0;
    }
}
```

### 继承
#### 类的继承

子类继承父类后，无需定义也可使用父类定义好的`public/protected` **方法和属性**。也可以进行扩展和方法的重写。

- 父类的属性值不会被子类继承，但子类可以通过父类提供的方法得到父类的属性值。

- 父类的 static 方法不会被子类继承，子类的 static 方法会隐藏父类的同名 static 方法。

- 父类的构造方法不会被子类继承，子类必须在构造方法首行调用父类构造方法（先构造父类，再构造子类）


```java
final public class Trunk extends Car{ 
    // 重定义属性（未公开无法继承）
    String brand;
    String description = "this is a trunk";
    // 扩展属性
    int goods;
    // 扩展方法              
    public void load(int num){
        this.goods += num;
    }
    // 子类构造方法
    public Trunk(String brand){    
        super(brand);        
        this.goods = 0;                          
    }
    // 重写方法
    @Override         
    public void go(String loc){
        super.go(loc);                            
        System.out.print(" with" + goods + "goods"); 
        this.goods = 0;
    }
}
```

Object 类是一切 java 类的父类。对于普通的 java 类,即便不声明也默认继承了 Object 类。

#### 接口继承
和类的继承类似。但 Java **类只能单继承**，而 Java **接口可以多继承**。

```java
interface Charge extends Move, Fight{  
    public abstract void kill(int num);
}
```

### 多态
#### 继承多态
- 重载(overload)：定义多种同名方法，调用时根据传入参数判定调用哪种方法。
- 重写(override)：子类定义完全相同的方法覆盖父类。

重写是多态的前提，其允许父类引用指向子类对象（引用类型为父类，指向的实际对象类型为子类）。

`Car mycar = new Trunk("Benz");`

但不允许子类引用指向父类对象。

~~Trunk mycar = new Car("Benz");~~

如果两个类之间存在继承关系，可以进行强制类型转换。强制类型转换只能改变引用类型，实际指向对象类型不会发生变化。

`Trunk newCar = (Trunk)mycar;`

> 改变的是newCar的类型，而不是mycar

#### 方法多态
- 调用普通方法

  子类同名方法会覆盖父类。执行方法根据实际对象类型来判定，即执行子类重写的方法。

- 调用 `static / private / final` 以及`构造方法`

    特殊方法不能被覆盖，不存在多态。执行方法会根据引用类型来判定，即执行父类方法。

- 调用成员变量

    父类属性值不会被子类继承，不存在多态。调用变量会根据引用类型来判定，即得到父类属性值。

```java
Car myCar = new Trunk("Benz");

myCar.go("London");                    // (trunk) go to London with 0 goods
myCar.showNum();                       // (car) 1
System.out.print(myCar.description);   // (car) this is a car

Trunk newCar = (Trunk)mycar;           // 强制类型转换
System.out.print(newCar.description);  // (trunk) this is a trunk
```

#### 反射机制
JAVA 是动态编译语言（运行时才确定类型），支持反射机制。在运行状态中

- 对于任意一个类，都能够知道这个类的所有属性和方法；
- 对于任意一个对象，都能够调用它的任意一个方法和属性。

通过反射机制能更好地支持多态，降低模块耦合，提高代码灵活度（根据传入类名不同，就能实例化出不同的对象）。

但是在性能上会有较大的损耗。

尽管在应用层面很少使用反射机制，但在设计基础框架的时候反射机制非常有用。

##### 反射机制运用
所谓的反射机制就是java语言在运行时拥有一项自观的能力。

> 使用反射的背景
> 反射大量运用在框架代码和工具代码中，因为这类工程项目往往对于灵活性的要求较高，在实际的业务代码中我们其实使用反射并不多。因此这也就引出了，大部分时候做业务的我们为什么要学习反射原理的原因：为了更加深刻地理解我们所用的工具和框架，了解了反射原理，我们能够在使用框架时优化出更好的性能，遇到问题能及时定位排错，这些都是很重要的。

类的相关信息保存在以下类中，通过特定方法获取其对象能够知道这个类的信息。

- Class 类：类
- Constructor 类：类的构造方法
- Field 类：类的属性
- Method 类：类的方法


```java
public class Reflection {
    public static void main(String[] args) {

        /************************** 获取 Class 对象 **************************/

        // 第一种方式 返回对象的类 【已有对象，获取类无意义】
        Student stu = new Student();
        Class stuClass = stu.getClass();

        // 第二种方式 获取数据类型的静态 class 属性 【需要导入类包】
        Class stuClass = Student.class;

        // 第三种方式 返回路径下的类 【常用】
        Class stuClass = Class.forName("Reflection.Student");

        /************************** 获取 Class 信息 **************************/

        // 获取类名
        String name = stuClass.getName());   

        // 获取类的公有构造方法
        Constructor[] conArray = stuClass.getConstructors();
        // 获取类的全部构造方法
        Constructor[] conArray = stuClass.getDeclaredConstructors();
        // 获取类的指定构造方法（参数）
        Constructor con = stuClass.getConstructor(null);
        Constructor con = stuClass.getDeclaredConstructor(char.class);

        // 获取类的公有属性
        Field[] fieldArray = stuClass.getFields(); 
        // 获取类的全部属性
        Field[] fieldArray = stuClass.getDeclaredFields();
        // 获取类的指定属性（属性名）
        Field f = stuClass.getField("name");    

        // 获取类的公有方法
        Method[] methodArray = stuClass.getMethods(); 
        // 获取类的全部方法                
        Method[] methodArray = stuClass.getDeclaredMethods();
        // 获取类的指定方法（方法名+形参类型）                  
        Method m = stuClass.getMethod("main", String.class);   

        /************************** 在对象中使用 **************************/

        Object obj = con.newInstance();   // 调用公有无参构造方法创建对象
        f.set(obj, "X-man");              // 为对象的公有属性赋值
        m.invoke(obj, "X-man");           // 调用对象的公有方法

    }
```

**泛型**在编译时检查类型安全，编译过后泛型被擦除、实际类型才确定。反射是在编译期模拟 java 运行时的环境读取和调用程序，因此不能获得泛型的实际类型。但可以通过反射越过泛型检查：

> 在 String 泛型的集合中，你甚至可以添加一个 Integer 类型的值。

```java
public class Demo {
    public static void main(String[] args) throws Exception{
        ArrayList<String> strList = new ArrayList<>();    
        Class listClass = strList.getClass(); 
        Method m = listClass.getMethod("add", Object.class);
        m.invoke(strList, 100);
    }
}
```

## 类和接口
### 对象Object
java 是面向对象的语言：对象包含了状态和行为，用户通过调用对象的方法、改变对象的属性来实现 java 程序的功能。

```java
Car myCar = new Car("BMW");                          // 创建对象       
me.brand = "Benz";                                   // 修改对象变量                   
me.go("London");                                     // 调用对象方法
```

在 java 程序中我们通过类和接口来定义对象的性质：每个 java 文件都是一个定义好的 public 类 / 接口，且类名 / 接口名与文件名相同。

java 文件可以含有多个类 / 接口，但只能有一个 public 类 / 接口供**外部访问。**

### 类 Class
对象的类型：定义对象含有的变量和方法。

```java
public class Car {     
    // 变量
    String brand;
    String description = "this is a car";
    // static 变量 
    static int number_of_car;  
    // 构造方法
    public car(String brand){        
        this.brand = brand;
    } 
    // 方法  
    public void go(String loc){
        System.out.print("go to" + loc);
    }   
    // static 方法
    void static showNum(){            
        System.out.print(number_of_car);
    }
    // 初始化块
    {       
        number_of_car;                                      
    }
    // static 初始化块
    static{                                                              
        number_of_car = 0;
    }
    // 内部类
    public class Warranty{
        public void repair(){
            System.out.print("repair");
        }    
    }
}
```

- 变量
    对象中存储的数据。

- 方法
    调用时执行的代码。

- 初始化块
    创建对象前自动执行的代码。

- 内部类
    定义在类中的类。

- 构造方法
    在创建对象时自动执行，不返回任何参数（先执行初始化块，再执行构造方法）。

- 未定义任何构造方法时，系统会自动添加无参构造方法。

#### 终态声明
- final 常量： 只能赋值一次，不可更改。
- final 类： 不可被继承。
- final 方法：（弃用）不可被继承。现在所有的 private 方法都隐式地指定为 final。

对于 final 常量，如果编译时就可以确定值，编译器会在编译时直接把这个变量替换成它的值。

#### 静态声明
- static 变量：该变量由该类的所有对象共享，不需要创建对象也可使用。
- static 方法：允许直接访问，不需要创建对象也可被调用。如 main 方法。
- static 初始化块：在创建类的第一个对象前自动执行（先执行静态初始化块，再执行初始化块）。
- static 内部类：外部类对象共享，只能访问外部类的静态成员。

#### 权限声明
- public： 允许所有访问。
- protected： 只允许本类、同包和子类访问。
- [default]： 允许本类和同包访问。
- private： 只允许本类访问。

### 接口 Interface
类的规范：只规定应含有哪些方法，而不负责具体实现。

```java
public interface Move{  
    // abstract 方法                   
    public void go(String loc);
    // default 方法                                 
    default void stop() {      
        System.out.print("stop");
    };                  
}
```

1. 声明接口：必须且默认为 static final，通常为 public 。
2. 只允许声明静态常量：必须且默认为 public static final 。
3. 声明抽象方法：必须且默认为 abstract ，可以为 static。

#### 抽象声明

- abstract 方法：只有声明，而没有方法的具体实现。
- abstract 类：类的模板，**不能实例化对象**。必须由其他类继承才能使用。

```java
public abstract class Vehicle {
    // 声明变量
    String brand;
    // 声明并实现方法
    public void go(String loc){
        System.out.print("go to" + loc);
    }   
}
```

接口和抽象类的区别:

- 接口不能实现普通方法，抽象类可以实现具体的方法、也可以不实现。
- 接口只能定义静态常量，抽象类可以定义非静态变量。
- 一个实体类可以实现多个接口，但只能继承一个抽象类。

#### 更新声明
- default 方法：更新接口时添加的新方法，允许旧类实现接口而不实现该方法。

    - 可以直接在接口内实现，供没有定义的旧类直接使用。若类中实现了该方法则覆盖。

    - 如果类实现了多个接口且拥有同名 default 方法：

        1. 两个接口若存在继承关系，调用时优先使用子类方法。
        2. 否则，必须重写子类 default 方法，通过 super 关键字明确实现哪个接口：

```java
class Plane implements Move, Fly{
    ...
    void go(){
        Fly.super.go();                 // 实现选定 default 方法
    }
}
```

### 包 Package
命名空间，表示 java 文件的存储路径。其路径记录在每个 java 文件首。

`package com.company.project.module;                    // 声明存储路径`

#### 导入 import
在 java 文件中，如果要调用其他 java 文件中定义的类 / 接口，就需要进行导入：

- 同一存储路径（包）下的 java 文件不需要导入，可以直接调用。

- 已默认导入 java.lang 路径下所有 java 文件，包含 System、String、Object、Math 等常用类。

- 如果没有导入对应 java 文件，或者导入了多个同名 java 文件，在调用类 / 接口时需要标明路径。

```java
package com.company.project.module;  

import java.util.Scanner;                             // 导入 java 文件，但不包括内部 static 变量和方法
import java.net.*;                                    // 导入路径下所有 java 文件，但不包括下属文件夹
import static java.lang.Math.PI;                      // 导入 java 文件中的 static 变量或方法

public class Test{
    public void main(String[] args){
        java.io.InputStream in = new java.io.InputStream(System.in);    // 未导入类，调用时需要标明路径
        Scanner sc = new Scanner(in);                                   // 已导入类，可直接调用
        Integer n = sc.nextInt();                                       // 默认导入类，可直接调用
        sc.close();           
    }
}
```

## 方法调用
### 参数传递
值传递：在 Java 方法中传递参数，形参本质是实参的副本。

1. 参数是基础数据类型：对形参的改变不会影响实参。

2. 参数是指向对象的引用（包括数组、字符串）：对对象数据进行更改会影响实参，但改变引用指向的对象不会影响实参。

```java
public class Test{
    public static void main(){
        int i = 0;
        int[] arr = {0};
        test(i, arr);
        System.out.print(i);            // 输出为 0
        System.out.print(arr[0]);       // 输出为 1
    }

    public void test(int i, int[] arr){
        i++;                            // 实参不改变
        arr[0]++;                       // 实参指向的对象改变
        arr = new int[]{2};             // 实参不改变
        return;
    }
}
```
### Lambda 表达式
JDK 1.8 新增。

## 数值比较和排序的常用方法
### 等值判断

Object 类实现了 equals 方法 ，用于比较两个数据元素是否相等。

浮点类型由于精度丢失问题，进行等值判断常出现错误。如果有需求推荐使用 BigDecimal 类。

```java
int a = 20 - 10;
int b = 10;
System.out.println(a.equals(b));         // true

double a = 20.0 - 10.0;
double b = 10.0;
System.out.println(a.equals(b));         // false
```

### 和 == 的区别

- 对于基本类型，两者等价：判断数据是否相等。

- 对于对象（如 String 类）：

    - ==：比较两个元素内存地址是否相等，即是否是同一个元素。
    - equals 方法：比较两个元素内容是否一致。


```java
System.out.println(s1 == s2);                 // 判断两个引用指向的内存地址是否相等  
System.out.println(s1.equals(s2));            // 判断两个引用指向的内存地址是否相等（s1 为空抛出空指针异常）
System.out.println(Objects.equals(s1,s2));    // 判断两个引用指向的元素是否一致（推荐）
```

### 重写 equals 方法

对于用户自定义类，正常使用 equals 方法需要进行重写。重写 equals 方法必须重写 hashcode 方法：以保证相同对象拥有相同的哈希地址。这样才能正常地把该类对象放入 HashSet/HashMap 等集合框架中查找。

> Object 类的 hashcode 方法是本地方法（底层用 c/c++ 实现），直接返回对象的内存地址。

```java
public class User{
    int ID;
    String name;

    ......

    @Override
    public boolean equals(Object obj) {
        if(this == obj)  return true;

        if(obj == null) return false;

        if(obj instanceof User){
            User other = (User) obj;
            if(equals(this.ID, other.ID) && equals(this.name, other.name)){
                return true;
            }
        }

        return false;
    }

    @Override
    public int hashCode() {
        int result = 17;
        result = 31 * result + (ID == null ? 0 : ID.hashCode());
        result = 31 * result + (name == null ? 0 : name.hashCode());
        return result;
    }
}
```

### 数值比较

Comparator 接口和 Comparable 接口都用于比较两个元素的大小：

1. Comparable 接口位于 java.lang 包内，定义在要比较的实体类内部：包含 compareTo 方法。

2. Comparator 接口位于 java.util 包内，实现在类的外部：包含 compare 方法和 equals 方法。

> Comparator 接口的 equals 方法和 Object 类的 equals 方法不同， Object 类的 equals 方法实现在实体类的内部。

#### compareTo 方法
Java 自带数据类型均已实现 Comparable 接口并重写 compareTo 方法，默认情况下

- 如果 s1 等于 s2，则返回 0；
- 如果 s1 小于 s2，则返回小于 0 的值；
- 如果 s1 大于 s2，则返回大于 0 的值。

```java
Integer s1 = 100;
Integer s2 = 90;
System.out.println(s1.compareTo(s2));   
```

#### compare 方法
Arrays/Collections 类定义了 sort 方法对数组或者集合元素进行排列，数值的比较通过调用 Comparator 接口的 compare 方法实现。

执行 sort 方法时如果没有重写 compare 方法，默认调用的 compare 方法将会直接调用数据类型的 compareTo 方法，使数据从小到大排列。如果是自定义数据类型且未实现 compareTo 方法，则必须重写 compare 方法。

```java
Arrays.sort(students);                      // 对数组排序
Collections.sort(students);                 // 对集合元素排序
```

开发者可以通过重写 compare 方法，实现自定义排列顺序。但要注意，如果数组中保存的是基础类型数据则无法自定义排序。

```java
Arrays.sort(students, new Comparator<Student>() {          
    @Override
    public int compare(Student s1, Student s2) {
        return s1.getID() - s2.getID();
    }            
});

Collections.sort(students, (s1, s2) ->  s1.getID() - s2.getID());     // 使用 Lamdba 表达式简写
```

### 数据排序
Arrays/Collections 类定义了 sort 方法对数组或者集合元素进行排列，数值的比较通过调用 Comparator 接口的 compare 方法实现。