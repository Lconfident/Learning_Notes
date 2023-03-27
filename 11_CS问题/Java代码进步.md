### 2023/1/8

可以设计一个静态内部类，用来输出特定的结果。

而把算法设计在一个公共方法中。

```java
class ArrayAlg
{
	public static class Pair
    {
        ...
	}
    ...
    public static Pair minmax(double[] values)
    {
        ...
        return new Pair(min,max);
    }
}
```

第八行必须将`Pair类`声明为`static`，否则编译器将会报错，指出没有可用的隐式`ArrayAlg`类型对象来初始化内部类对象。

### 2023/1/15

抽奖系统：

随机数  0 - (n-1)	`int r = (int) (Math.random() * n);`

将要抽取的数字`1 2 ... n`放入一个初始数组`nummber[n]`中，将要输出的随机数放入另一个数组中`result[k]`；

随机数指定索引`r`，数值存入：`result[i] = numbers[r];`

避免抽取相同数字，将已存入的数值替换为末尾的数值，并且删除末尾的数值：`numbers[r] = numbers[n-1]; n--;`

附源码：

```java
package LotteryDrawing;

import java.util.*;
/**
 * @author lyf
 */
public class LotteryDrawing {
    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);

        System.out.print("How many numbers do you need to draw? ");
        int k = in.nextInt();

        System.out.print("What is the highest number you can draw? ");
        int n = in.nextInt();

        // fill an array with numbers 1 2 3 ... n
        int[] numbers = new int[n];
        for (int i = 0; i < numbers.length; i++)
        {
            numbers[i] = i + 1;
        }

        // draw k numbers and put them into a second array
        int[] result = new int[k];
        for (int i = 0; i < result.length; i++)
        {
            // make a random number between 0 and n - 1
            int r = (int) (Math.random() * n);

            // pick the element at the random location
            result[i] = numbers[r];

            // move the last element into the random location
            numbers[r] = numbers[n-1];
            n--;
        }

        Arrays.sort(result);
        System.out.println("Bet the following combination.It'll make you rich!");
        for (int number:result)
        {
            System.out.println(number);
        }
    }
}
```

