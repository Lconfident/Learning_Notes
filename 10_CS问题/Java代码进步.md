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