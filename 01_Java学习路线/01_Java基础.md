**Java编程基础**

## 大纲

**JavaSE**
- Java特性
- 环境搭建
- Java基本语法
  - 数据类型
  - 流程控制
- 数组
- 面向对象
  - 方法
  - 重载
  - 封装
  - 继承
  - 多态
- 抽象类
- 接口
- 枚举
- 常用类
  - String
  - 日期时间
- 集合类
- 泛型
- 注解
- 异常处理
- 多线程
- IO流
- 反射

**Java8**
- Stream API
- Lamdba表达式
- 新日期时间API
- 接口默认方法

# JavaSE

## Java特性

1. 跨平台/可移植性
2. 安全性
3. 面向对象
4. 简单性
5. 高性能
6. 分布式
7. 多线程
8. 健壮性

## 环境搭建

- JDK：Java Development Kit，Java开发工具包，包含JRE
- JRE：Java Runtime Environment，Java运行时环境，包含JVM
- JVM：Java Virtual Machine，Java虚拟机
- JDK开发Java程序，JRE运行Java程序
- JDK=JRE+开发工具
- JRE=JVM+核心类库

> JDK的`bin`目录
>
> - java：这个可执行程序其实就是JVM，运行Java程序，就是启动JVM，然后让JVM执行指定的编译后的代码；
> - javac：这是Java的编译器，它用于把Java源码文件（以`.java`后缀结尾）编译为Java字节码文件（以`.class`后缀结尾）；
> - jar：用于把一组`.class`文件打包成一个`.jar`文件，便于发布；
> - javadoc：用于从Java源码中自动提取注释并生成文档；
> - jdb：Java调试器，用于开发阶段的运行调试。

> Hello World
>
> ```java
> public class Hello {
>     public static void main(String[] args) {
>         System.out.println("Hello World!");
>     }
> }
> ```
>
> 
>
> - 一个Java源码只能定义一个`public`类型的class，并且class名称和文件名要完全一致；
> - 使用`javac`可以将`.java`源码编译成`.class`字节码；
> - 使用`java`可以运行一个已编译的Java程序，参数是类名。

## Java 基本语法

### Java程序基本结构

一个完整的Java程序，

```java
/**
 * 可以用来自动创建文档的注释
 */
public class Hello {
    public static void main(String[] args) {
        // 向屏幕输出文本:
        System.out.println("Hello, world!");
        /* 多行注释开始
        注释内容
        注释结束 */
    }
} // class定义结束
```

一个程序的基本单位是`class`，这里是`Hello`

类名要求：

- 类名必须以英文字母开头，后接字母，数字和下划线的组合
- 习惯以大写字母开头

要注意遵守命名习惯，好的类命名：

- Hello
- NoteBook
- VRPlayer

不好的类命名：

- hello
- Good123
- Note_Book
- _World

注意到`public`是访问修饰符，表示该`class`是公开的。

不写`public`，也能正确编译，但是这个类将无法从命令行执行。

在`class`内部，可以定义若干方法（method）：

```java
public class Hello {
    public static void main(String[] args) { // 方法名是main
        // 方法代码...
    } // 方法定义结束
}
```

方法定义了一组执行语句，方法内部的代码将会被依次顺序执行。

这里的方法名是`main`，返回值是`void`，表示没有任何返回值。

我们注意到`public`除了可以修饰`class`外，也可以修饰方法。而关键字`static`是另一个修饰符，它表示静态方法，后面我们会讲解方法的类型，目前，我们只需要知道，Java入口程序规定的方法必须是静态方法，方法名必须为`main`，括号内的参数必须是String数组。

方法名也有命名规则，命名和`class`一样，但是首字母小写：

好的方法命名：

- main
- goodMorning
- playVR

不好的方法命名：

- Main
- good123
- good_morning
- _playVR

在方法内部，语句才是真正的执行代码。Java的每一行语句必须以分号结束： 

```java
public class Hello {
    public static void main(String[] args) {
        System.out.println("Hello, world!"); // 语句
    }
}
```

在Java程序中，注释是一种给人阅读的文本，不是程序的一部分，所以编译器会自动忽略注释。 

> 单行注释：`//这是注释`
>
> 多行注释：
>
> ```java
> /*
> 这是注释
> */
> ```
>
> 文档注释：
>
> ```java
> /**
> *用来自动创建文档的注释
> *@auther liu
> */
> ```

  **驼峰命名法**是指多个单词组合在一起标识一个特定的含义时，第一个单词全部小写，第二个以及之后的单词首字母大写其余小写的命名规则，其中分为小驼峰法与大驼峰法。我们以Java为例，讲一下大小驼峰的使用方式。

**小驼峰**

- 第一个单词首字母小写，其他单词首字母大写，如`getMyName`
- 一般用于变量名和方法名

**大驼峰**

- 全部单词首字母大写，如`CheckName`
- 主要用于接口名和类名

### 数据类型

**变量**

Java中变量分为两种：基本类型变量和引用类型变量

基本类型变量：

- 先定义后使用
- 可以重新赋值
- 可以赋值给其他变量

基本数据类型（CPU可直接进行运算的类型）：

- 整数类型：byte、short、int、long
- 浮点数类型：float、double
- 字符类型：char
- 布尔类型：boolean

[这些基本数据类型的区别](https://www.liaoxuefeng.com/wiki/1252599548343744/1255883729079552)

对于`float`类型，需要加上`f`后缀。 `float f1 = 3.14f;`

注意`char`类型使用单引号`'`，且仅有一个字符，要和双引号`"`的字符串类型区分开。 

**引用类型**

除了上述基本类型的变量，剩下的都是引用类型。例如，引用类型最常用的就是`String`字符串：

```java
String s = "hello";
```

引用类型的变量类似于C语言的指针，它内部存储一个“地址”，指向某个对象在内存的位置，后续我们介绍类的概念时会详细讨论。 

**常量**

定义变量的时候，如果加上`final`修饰符，这个变量就变成了常量： 

```java
final double PI = 3.14; // PI是一个常量
double r = 5.0;
double area = PI * r * r;
PI = 300; // compile error!
```

常量在定义时进行初始化后就不可再次赋值，再次赋值会导致编译错误。

常量的作用是用有意义的变量名来避免魔术数字（Magic number），例如，不要在代码中到处写`3.14`，而是定义一个常量。如果将来需要提高计算精度，我们只需要在常量的定义处修改，例如，改成`3.1416`，而不必在所有地方替换`3.14`。

根据习惯，常量名通常全部大写。

**var关键字**

有些时候，类型的名字太长，写起来比较麻烦。例如： 

```java
StringBuilder sb = new StringBuilder();
```

这个时候，如果想省略变量类型，可以使用`var`关键字： 

```java
var sb = new StringBuilder();
```

 编译器会根据赋值语句自动推断出变量`sb`的类型是`StringBuilder`。

```java
# 对编译器来说，语句:
var sb = new StringBuilder();
# 实际上会自动变成：
StringBuilder sb = new StringBuilder();
```

因此，使用`var`定义变量，仅仅是少写了变量类型而已。 

**整数运算**

要特别注意，整数由于存在范围限制，如果计算结果超出了范围，就会产生溢出，而溢出*不会出错*，却会得到一个奇怪的结果。

注意`++`写在前面和后面计算结果是不同的，`++n`表示先加1再引用n，`n++`表示先引用n再加1。不建议把`++`运算混入到常规运算中，容易自己把自己搞懵了。 

**移位运算**

对`byte`和`short`类型进行移位时，会首先转换为`int`再进行位移。

仔细观察可发现，左移实际上就是不断地×2，右移实际上就是不断地÷2。

**位运算**

位运算是按位进行与、或、非和异或的运算。

类型自动提升与强制转型

在运算过程中，如果参与运算的两个数类型不一致，那么计算结果为较大类型的整型。例如，`short`和`int`计算，结果总是`int`，原因是`short`首先自动被转型为`int`。

**浮点数运算**

浮点数运算和整数运算相比，只能进行加减乘除这些数值计算，不能做位运算和移位运算。

在计算机中，浮点数虽然表示的范围大，但是，浮点数有个非常重要的特点，就是浮点数常常无法精确表示。

举个栗子：

浮点数`0.1`在计算机中就无法精确表示，因为十进制的`0.1`换算成二进制是一个无限循环小数，很显然，无论使用`float`还是`double`，都只能存储一个`0.1`的近似值。但是，`0.5`这个浮点数又可以精确地表示。

由于浮点数存在运算误差，所以比较两个浮点数是否相等常常会出现错误的结果。正确的比较方法是判断两个浮点数之差的绝对值是否小于一个很小的数： 

```java
// 比较x和y是否相等，先计算其差的绝对值:
double r = Math.abs(x - y);
// 再判断绝对值是否足够小:
if (r < 0.00001) {
    // 可以认为相等
} else {
    // 不相等
}
```

如果参与运算的两个数其中一个是整型，那么整型可以自动提升到浮点型。

**溢出**

整数运算在除数为`0`时会报错，而浮点数运算在除数为`0`时，不会报错，但会返回几个特殊值：

- `NaN`表示Not a Number
- `Infinity`表示无穷大
- `-Infinity`表示负无穷大

```java
double d1 = 0.0 / 0; // NaN
double d2 = 1.0 / 0; // Infinity
double d3 = -1.0 / 0; // -Infinity
```

**强制转型**

可以将浮点数强制转型为整数。在转型时，浮点数的小数部分会被丢掉。如果转型后超过了整型能表示的最大范围，将返回整型的最大值。例如：

```java
int n1 = (int) 12.3; // 12
int n2 = (int) 12.7; // 12
int n2 = (int) -12.7; // -12
int n3 = (int) (12.7 + 0.5); // 13
int n4 = (int) 1.2e20; // 2147483647
```

如果要进行四舍五入，可以对浮点数加上0.5再强制转型：

```java
public class Main {
    public static void main(String[] args) {
        double d = 2.6;
        int n = (int) (d + 0.5);
        System.out.println(n);
    }
}
```

**布尔运算**

永远只有`true`和`false`两个值 

布尔运算是一种关系运算，包括以下几类：

- 比较运算符：`>`，`>=`，`<`，`<=`，`==`，`!=`
- 与运算 `&&`
- 或运算 `||`
- 非运算 `!`

 布尔运算的一个重要特点是**短路运算**。如果一个布尔运算的表达式能提前确定结果，则后续的计算不再执行，直接返回结果。

因为`false && x`的结果总是`false`，无论`x`是`true`还是`false`，因此，与运算在确定第一个值为`false`后，不再继续计算，而是直接返回`false`。

三元运算符`b ? x : y`，它根据第一个布尔表达式的结果，分别返回后续两个表达式之一的计算结果。

 **字符和字符串**

字符类型`char`是基本类型，它是`character`的缩写。一个`char`保存一个Unicode字符： 

```java
char c1 = 'A';
char c2 = '中';
```

因为Java在内存中总是使用Unicode表示字符，所以，一个英文字符和一个中文字符都用一个`char`类型表示，它们都占用两个字节。要显示一个字符的Unicode编码，只需将`char`类型直接赋值给`int`类型即可： 

```java
int n1 = 'A'; // 字母“A”的Unicodde编码是65
int n2 = '中'; // 汉字“中”的Unicode编码是20013
```

还可以直接用转义字符`\u`+Unicode编码来表示一个字符：

```java
// 注意是十六进制:
char c3 = '\u0041'; // 'A'，因为十六进制0041 = 十进制65
char c4 = '\u4e2d'; // '中'，因为十六进制4e2d = 十进制20013
```

字符串类型`String`是引用类型，我们用双引号`"..."`表示字符串。一个字符串可以存储0个到任意个字符： 

```java
String s = ""; // 空字符串，包含0个字符
String s1 = "A"; // 包含一个字符
String s2 = "ABC"; // 包含3个字符
String s3 = "中文 ABC"; // 包含6个字符，其中有一个空格
```

因为字符串使用双引号`"..."`表示开始和结束，那如果字符串本身恰好包含一个`"`字符怎么表示？例如，`"abc"xyz"`，编译器就无法判断中间的引号究竟是字符串的一部分还是表示字符串结束。这个时候，我们需要借助转义字符`\`：

```java
String s = "abc\"xyz"; // 包含7个字符: a, b, c, ", x, y, z
```

因为`\`是转义字符，所以，两个`\\`表示一个`\`字符：

```java
String s = "abc\\xyz"; // 包含7个字符: a, b, c, \, x, y, z
```

常见的转义字符包括：

- `\"` 表示字符`"`
- `\'` 表示字符`'`
- `\\` 表示字符`\`
- `\n` 表示换行符
- `\r` 表示回车符
- `\t` 表示Tab
- `\u####` 表示一个Unicode编码的字符

**字符串连接**

Java的编译器对字符串做了特殊照顾，可以使用`+`连接任意字符串和其他数据类型，这样极大地方便了字符串的处理。

 如果用`+`连接字符串和其他数据类型，会将其他数据类型先自动转型为字符串，再连接。

```java
public class Main {
    public static void main(String[] args) {
        int age = 25;
        String s = "age is " + age;
        System.out.println(s);
    }
}
```

**多行字符串**

如果我们要表示多行字符串，使用+号连接会非常不方便：

```java
String s = "first line \n"
         + "second line \n"
         + "end";
```

从Java 13开始，字符串可以用`"""..."""`表示多行字符串（Text Blocks）了。举个例子： 

```java
// 多行语句
public class Main {
    public static void main(String[] args) {
        String s = """
                   SELECT * FROM
                     users
                   WHERE id > 100
                   ORDER BY name DESC
                   """;
        System.out.println(s);
    }
}

```

上述多行字符串实际上是5行，在最后一个`DESC`后面还有一个`\n`。如果我们不想在字符串末尾加一个`\n`，就需要这么写：

```java
String s = """ 
           SELECT * FROM
             users
           WHERE id > 100
           ORDER BY name DESC""";
```

还需要注意到，多行字符串前面共同的空格会被去掉，即：

```java
String s = """
...........SELECT * FROM
...........  users
...........WHERE id > 100
...........ORDER BY name DESC
...........""";
```

用`.`标注的空格都会被去掉。

如果多行字符串的排版不规则，那么，去掉的空格就会变成这样：

```java
String s = """
.........  SELECT * FROM
.........    users
.........WHERE id > 100
.........  ORDER BY name DESC
.........  """;
```

即总是以最短的行首空格为基准。

字符串的不可变是指字符串内容不可变。至于变量，可以一会指向字符串`"hello"`，一会指向字符串`"world"`。 

**空值null**

引用类型的变量可以指向一个空值`null`，它表示不存在，即该变量不指向任何对象。

注意要区分空值`null`和空字符串`""`，空字符串是一个有效的字符串对象，它不等于`null`。 

### 流程控制

**输出**

`println`是print line的缩写，表示输出并换行。因此，如果输出后不想换行，可以用`print()。`

**格式化输出**

使用`System.out.printf()`，通过使用占位符`%?`，`printf()`可以把后面的参数格式化成指定格式：

```java
public class Printf {
    public static void main(String[] args) {
        float d = 3.15935f;
        System.out.printf("%.2f\n",d);
    }
}
```

| 占位符 | 说明                             |
| ------ | -------------------------------- |
| %d     | 格式化输出整数                   |
| %x     | 格式化输出十六进制整数           |
| %f     | 格式化输出浮点数                 |
| %e     | 格式化输出科学计数法表示的浮点数 |
| %s     | 格式化字符串                     |

**输入**

和输出相比，Java的输入就要复杂得多。 

我们先看一个从控制台读取一个字符串和一个整数的例子：

```java
import java.util.Scanner;

public class Scanf {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.print("Please input your name:");
        String name = sc.nextLine();
        System.out.print("Please input your age:");
        int age = sc.nextInt();
        System.out.printf("Hi, %s,you are %d\n", name ,age);
    }
}
```

 首先，我们通过`import`语句导入`java.util.Scanner`，`import`是导入某个类的语句，必须放到Java源代码的开头，后面我们在Java的`package`中会详细讲解如何使用`import。`

然后，创建`Scanner`对象并传入`System.in`。`System.out`代表标准输出流，而`System.in`代表标准输入流。直接使用`System.in`读取用户输入虽然是可以的，但需要更复杂的代码，而通过`Scanner`就可以简化后续的代码。 

有了`Scanner`对象后，要读取用户输入的字符串，使用`scanner.nextLine()`，要读取用户输入的整数，使用`scanner.nextInt()`。`Scanner`会自动转换数据类型，因此不必手动转换。 

> 练习：请帮小明同学设计一个程序，输入上次考试成绩（int）和本次考试成绩（int），然后输出成绩提高的百分比，保留两位小数位（例如，21.75%）。
>
> ```java
> package javase.hello;
> 
> import java.util.Scanner;
> 
> public class Scanf {
>     public static void main(String[] args) {
>         Scanner sc = new Scanner(System.in);
>         System.out.print("Input your last grade:");
>         int lastGrade = sc.nextInt();
>         System.out.print("Input your this grade:");
>         int thisGrade = sc.nextInt();
>         float percentage = (float) lastGrade / thisGrade;
>         System.out.printf("成绩提高的百分比为：%.2f%%",percentage);
>     }
> }
> ```

**If判断**

判断引用类型相等

在Java中，判断值类型的变量是否相等，可以使用`==`运算符。但是，判断引用类型的变量是否相等，`==`表示“引用是否相等”，或者说，是否指向同一个对象。例如，下面的两个String类型，它们的内容是相同的，但是，分别指向不同的对象，用`==`判断，结果为`false`： 

```java
public class Main {
    public static void main(String[] args) {
        String s1 = "hello";
        String s2 = "HELLO".toLowerCase();
        System.out.println(s1);
        System.out.println(s2);
        if (s1 == s2) {
            System.out.println("s1 == s2");
        } else {
            System.out.println("s1 != s2");
        }
    }
}
```

要判断引用类型的变量内容是否相等，必须使用`equals()`方法： 

```java
public class Main {
    public static void main(String[] args) {
        String s1 = "hello";
        String s2 = "HELLO".toLowerCase();
        System.out.println(s1);
        System.out.println(s2);
        if (s1.equals(s2)) {
            System.out.println("s1 equals s2");
        } else {
            System.out.println("s1 not equals s2");
        }
    }
}
```

注意：执行语句`s1.equals(s2)`时，如果变量`s1`为`null`，会报`NullPointerException` 

```java
//要避免NullPointerException错误，可以利用短路运算符&&：
public class Main {
    public static void main(String[] args) {
        String s1 = null;
        if (s1 != null && s1.equals("hello")) {
            System.out.println("hello");
        }
    }
}
```

**switch多重选择**

一般写法：

```java
public class SwitchCase {
    public static void main(String[] args) {
        int option = 99;
        switch (option){
            case 0:
                System.out.println("Selected "+ 0);
                break;
            case 1:
                System.out.println("Selected "+ 1);
                break;
            case 99:
                System.out.println("Selected " + 99);
                break;
            default:
                System.out.println("default");
                break;
        }
    }
}
```

**switch表达式**

使用`switch`时，如果遗漏了`break`，就会造成严重的逻辑错误，而且不易在源代码中发现错误。从Java 12开始，`switch`语句升级为更简洁的表达式语法，使用类似模式匹配（Pattern Matching）的方法，保证只有一种路径会被执行，并且不需要`break`语句： 

```java
public class SwitchCase {
        public static void main(String[] args) {
            String fruit = "apple";
            switch (fruit) {
                case "apple" -> System.out.println("Selected apple");
                case "pear" -> System.out.println("Selected pear");
                case "mango" -> {
                    System.out.println("Selected mango");
                    System.out.println("Good choice!");
                }
                default -> System.out.println("No fruit selected");
            }
        }
}
```

注意新语法使用`->`，如果有多条语句，需要用`{}`括起来。不要写`break`语句，因为新语法只会执行匹配的语句，没有穿透效应。

很多时候，我们还可能用`switch`语句给某个变量赋值。例如：

```java
int opt;
switch (fruit) {
case "apple":
    opt = 1;
    break;
case "pear":
case "mango":
    opt = 2;
    break;
default:
    opt = 0;
    break;
}
```

使用新的`switch`语法，不但不需要`break`，还可以直接返回值。把上面的代码改写如下：

```java
public class Main {
    public static void main(String[] args) {
        String fruit = "apple";
        int opt = switch (fruit) {
            case "apple" -> 1;
            case "pear", "mango" -> 2;
            default -> 0;
        }; // 注意赋值语句要以;结束
        System.out.println("opt = " + opt);
    }
}
```

**yield**

大多数时候，在`switch`表达式内部，我们会返回简单的值。

但是，如果需要复杂的语句，我们也可以写很多语句，放到`{...}`里，然后，用`yield`返回一个值作为`switch`语句的返回值：

```java
public class Main {
    public static void main(String[] args) {
        String fruit = "orange";
        int opt = switch (fruit) {
            case "apple" -> 1;
            case "pear", "mango" -> 2;
            default -> {
                int code = fruit.hashCode();
                yield code; // switch语句返回值
            }
        };
        System.out.println("opt = " + opt);
    }
}
```

**while循环**

**do while循环**

**for循环**

`for`循环经常用来遍历数组，因为通过计数器可以根据索引来访问数组的每个元素： 

```java
int[] ns = { 1, 4, 9, 16, 25 };
for (int i=0; i<ns.length; i++) {
    System.out.println(ns[i]);
}
```

但是，很多时候，我们实际上真正想要访问的是数组每个元素的值。Java还提供了另一种`for each`循环，它可以更简单地遍历数组：

```java
public class Main {
    public static void main(String[] args) {
        int[] ns = { 1, 4, 9, 16, 25 };
        for (int n : ns) {
            System.out.println(n);
        }
    }
}
```

 和`for`循环相比，`for each`循环的变量n不再是计数器，而是直接对应到数组的每个元素。`for each`循环的写法也更简洁。但是，`for each`循环无法指定遍历顺序，也无法获取数组的索引。

除了数组外，`for each`循环能够遍历所有“可迭代”的数据类型，包括后面会介绍的`List`、`Map`等。

**break**

`break`语句通常都是配合`if`语句使用。要特别注意，`break`语句总是跳出自己所在的那一层循环。例如 :

```java
public class Main {
    public static void main(String[] args) {
        for (int i=1; i<=10; i++) {
            System.out.println("i = " + i);
            for (int j=1; j<=10; j++) {
                System.out.println("j = " + j);
                if (j >= i) {
                    break;
                }
            }
            // break跳到这里
            System.out.println("breaked");
        }
    }
}
```

上面的代码是两个`for`循环嵌套。因为`break`语句位于内层的`for`循环，因此，它会跳出内层`for`循环，但不会跳出外层`for`循环。 

**continue**

`break`会跳出当前循环，也就是整个循环都不会执行了。而`continue`则是提前结束本次循环，直接继续执行下次循环。我们看一个例子：

```java
public class Main {
    public static void main(String[] args) {
        int sum = 0;
        for (int i=1; i<=10; i++) {
            System.out.println("begin i = " + i);
            if (i % 2 == 0) {
                continue; // continue语句会结束本次循环
            }
            sum = sum + i;
            System.out.println("end i = " + i);
        }
        System.out.println(sum); // 25
    }
}
```

注意观察`continue`语句的效果。当`i`为奇数时，完整地执行了整个循环，因此，会打印`begin i=1`和`end i=1`。在i为偶数时，`continue`语句会提前结束本次循环，因此，会打印`begin i=2`但不会打印`end i = 2`。

在多层嵌套的循环中，`continue`语句同样是结束本次自己所在的循环。

## 数组

一组类型相同的变量

### 创建数组

定义一个数组类型的变量，使用数组类型“类型[]”，例如，`int[]`。和单个基本类型变量不同，数组变量初始化必须使用`new int[5]`表示创建一个可容纳5个`int`元素的数组。

> Java的数组有几个特点：
>
> - 数组所有元素初始化为默认值，整型都是`0`，浮点型是`0.0`，布尔型是`false`；
> - 数组一旦创建后，大小就不可改变。

- 要访问数组中的某一个元素，需要使用索引。数组索引从`0`开始，例如，5个元素的数组，索引范围是`0`~`4`。

- 可以修改数组中的某一个元素，使用赋值语句，例如，`ns[1] = 79;`。

- 可以用`数组变量.length`获取数组大小。

- 数组是引用类型，在使用索引访问数组元素时，如果索引超出范围，运行时将报错： 

- 也可以在定义数组时直接指定初始化的元素，这样就不必写出数组大小，而是由编译器自动推算数组大小。例如： 

  ```java
  public class Main {
      public static void main(String[] args) {
          // 5位同学的成绩:
          int[] ns = new int[] { 68, 79, 91, 85, 62 };
          System.out.println(ns.length); // 编译器自动推算数组大小为5
      }
  }
  ```

  注意数组是引用类型，并且数组大小不可变。 

**数组元素**可以是值类型（如int）或引用类型（如String），但**数组本身**是引用类型；

### 数组遍历

第一种是直接**for循环**

第二种是**for each**

```java
public class ForEach {
    public static void main(String[] args) {
        int[] ns = {1,3,5,7,8};
        for (int n: ns){
            System.out.println(n);
        }
    }
}
```

注意：在`for (int n : ns)`循环中，变量`n`直接拿到`ns`数组的**元素**，而不是索引。

显然`for each`循环更加简洁。但是，`for each`循环无法拿到数组的索引，因此，到底用哪一种`for`循环，取决于我们的需要。 

### 打印数组内容

直接打印数组变量，得到的是JVM中引用地址。

```java
int[] nn = {12,21,23};
System.out.println(nn);//类似于[I@1b6d3586这样
```

这并没有什么意义，因为我们希望打印的数组的元素内容。因此，使用`for each`循环来打印它： 

```java
int[] ns = { 1, 1, 2, 3, 5, 8 };
for (int n : ns) {
    System.out.print(n + ", ");
}
```

使用`for each`循环打印也很麻烦。幸好Java标准库提供了`Arrays.toString()`，可以快速打印数组内容： 

```java
import java.util.Arrays;

public class ForEach {
    public static void main(String[] args) {
        int[] ns = {1,3,5,7,8};
        System.out.println(Arrays.toString(ns));
    }
}
输出：
[1, 3, 5, 7, 8]
```

### 数组排序

**冒泡排序**

> 算法步骤：
>
> 1. 比较相邻的元素。如果第一个比第二个大，就交换他们两个。
> 2. 对每一对相邻元素作同样的工作，从开始第一对到结尾的最后一对。这步做完后，最后的元素会是最大的数。
> 3. 针对所有的元素重复以上的步骤，除了最后一个。
> 4. 持续每次对越来越少的元素重复上面的步骤，直到没有任何一对数字需要比较。

```java
import java.util.Arrays;

public class BubbleSort {
    public static void main(String[] args) {
        int[] arr = {1,98,23,2,43,89,56,18};
        System.out.println("排序之前：" + Arrays.toString(arr));
        //BubbleSort
        for (int i = 1; i < arr.length; i++) {
            //设定一个标记flag，如果此次循环没有进行交换，说明数组已经有序，排序完成
            boolean flag = true;
            for(int j = 0;j < arr.length-i; j++) {
                if (arr[j] > arr[j+1]) {
                    int temp = arr[j];
                    arr[j] = arr[j+1];
                    arr[j+1] = temp;
                    flag = false;
                }
            }
            if (flag) {break;}
        }
        System.out.println("排序之后：" + Arrays.toString(arr));
    }
}

输出：
排序之前：[1, 98, 23, 2, 43, 89, 56, 18]
排序之后：[1, 2, 18, 23, 43, 56, 89, 98]
```

Java的标准库已经内置了排序功能，我们只需要调用JDK提供的`Arrays.sort()`就可以排序： 

```java
package javase.hello;
import java.util.Arrays;
public class Test {
    public static void main(String[] args) {
        int[] arr= {12,98,27,33,92,123,9};
        Arrays.sort(arr);
        System.out.println(Arrays.toString(arr));
    }
}
输出：
[9, 12, 27, 33, 92, 98, 123]
```

必须注意，对数组排序实际上修改了数组本身 。原来的3个字符串在内存中均没有任何变化，但是`ns`数组的每个元素指向变化了。 

### 二维数组

二维数组就是数组的数组。定义一个二维数组如下： 

```java
public class Main {
    public static void main(String[] args) {
        int ns = {
            { 1, 2, 3, 4 },
            { 5, 6, 7, 8 },
            { 9, 10, 11, 12 }
        };
        System.out.println(ns.length); // 3
    }
}
```

访问二维数组的某个元素需要使用`array[row][col]` 

要打印一个二维数组，可以使用两层嵌套的for循环 ，或者使用Java标准库的`Arrays.deepToString()`： 

```java
import java.util.Arrays;

public class Main {
    public static void main(String[] args) {
        int[][] ns = {
            { 1, 2, 3, 4 },
            { 5, 6, 7, 8 },
            { 9, 10, 11, 12 }
        };
        System.out.println(Arrays.deepToString(ns));
    }
}
```

### 命令行参数

Java程序的入口是`main`方法，而`main`方法可以接受一个命令行参数，它是一个`String[]`数组。 

这个命令行参数由JVM接收用户输入并传给`main`方法： 

```java
public class Test {
    public static void main(String[] args) {
        for (String arg : args){
            System.out.println(arg);
        }
    }
}
```

我们可以利用接收到的命令行参数，根据不同的参数执行不同的代码。例如，实现一个`-version`参数，打印程序版本号： 

```java
public class Test {
    public static void main(String[] args) {
        for (String arg : args){
            if ("-version".equals(arg)){
                System.out.println("v 1.8 JDK8");
                break;
            }
        }
    }
}
```

小结：

命令行参数类型是`String[]`数组；

命令行参数由JVM接收用户输入并传给`main`方法；

如何解析命令行参数需要由程序自己实现。

## 面向对象

Java是一门面向对象的编程语言，面向对象编程，英文是Object-Oriented Programming，简称OOP。

 和面向对象编程不同的，是面向过程编程。面向过程编程，是把模型分解成一步一步的过程。

面向对象的基本概念，包括：

- 类
- 实例
- 方法

面向对象的实现方式，包括：

- 继承
- 多态

Java语言本身提供的机制，包括：

- package
- classpath
- jar

以及Java标准库提供的核心类，包括：

- 字符串
- 包装类型
- JavaBean
- 枚举
- 常用工具类

### 面向对象基础

“人”可以定义为一个类（class），而具体的人则是实例（instance）：

| 现实世界 | 计算机模型  | Java代码                   |
| -------- | ----------- | -------------------------- |
| 人       | 类 / class  | class Person { }           |
| 小明     | 实例 / ming | Person ming = new Person() |
| 小红     | 实例 / hong | Person hong = new Person() |
| 小军     | 实例 / jun  | Person jun = new Person()  |

class是一种对象模版，它定义了如何创建实例，因此，class本身就是一种数据类型。

而instance是对象实例，instance是根据class创建的实例，可以创建多个instance，每个instance类型相同，但各自属性可能不相同 。

**定义class**

在Java中，创建一个类，例如，给这个类命名为`Person`，就是定义一个`class`：

```java
class Person {
    public String name;
    public int age;
}
```

一个`class`可以包含多个字段（`field`），字段用来描述一个类的特征。上面的`Person`类，我们定义了两个字段，一个是`String`类型的字段，命名为`name`，一个是`int`类型的字段，命名为`age`。因此，通过`class`，把一组数据汇集到一个对象上，实现了数据封装。

`public`是用来修饰字段的，它表示这个字段可以被外部访问。

**创建实例**

定义了class，只是定义了对象模版，而要根据对象模版创建出真正的对象实例，必须用new操作符。

new操作符可以创建一个实例，然后，我们需要定义一个引用类型的变量来指向这个实例：

```java
Person ming = new Person();
```

上述代码创建了一个Person类型的实例，并通过变量`ming`指向它。

注意区分`Person ming`是定义`Person`类型的变量`ming`，而`new Person()`是创建`Person`实例。

有了指向这个实例的变量，我们就可以通过这个变量来操作实例。访问实例变量可以用`变量.字段`，例如：

```java
ming.name = "Xiao Ming"; // 对字段name赋值
ming.age = 12; // 对字段age赋值
System.out.println(ming.name); // 访问字段name

Person hong = new Person();
hong.name = "Xiao Hong";
hong.age = 15;
```

**小结**

在OOP中，`class`和`instance`是“模版”和“实例”的关系；

定义`class`就是定义了一种数据类型，对应的`instance`是这种数据类型的实例；

`class`定义的`field`，在每个`instance`都会拥有各自的`field`，且互不干扰；

通过`new`操作符创建新的`instance`，然后用变量指向它，即可通过变量来引用这个`instance`；

访问实例字段的方法是`变量名.字段名`；

指向`instance`的变量都是引用变量。

#### 方法



#### 构造方法

#### 方法重载

#### 继承

#### 多态

#### 抽象类

#### 接口



### Java核心类

