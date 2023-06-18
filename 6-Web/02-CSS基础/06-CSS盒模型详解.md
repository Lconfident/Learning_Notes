| title            | publish |
| ---------------- | ------- |
| 06-CSS盒模型详解 | true    |



## 盒子模型

### 前言

盒子模型，英文即box model。无论是div、span、还是a都是盒子。

但是，图片、表单元素一律看作是文本，它们并不是盒子。这个很好理解，比如说，一张图片里并不能放东西，它自己就是自己的内容。

### 盒子中的区域

一个盒子中主要的属性就5个：width、height、padding、border、margin。如下：

- width和height：**内容**的宽度、高度（不是盒子的宽度、高度）。
- padding：内边距。
- border：边框。
- margin：外边距。

盒子模型的示意图：

[![img](https://camo.githubusercontent.com/105318f2425581b5959d37f68ce245732b4be04c1d44da106a8c832fbe0f6eaa/687474703a2f2f696d672e736d79687661652e636f6d2f32303137303732375f323132382e706e67)](https://camo.githubusercontent.com/105318f2425581b5959d37f68ce245732b4be04c1d44da106a8c832fbe0f6eaa/687474703a2f2f696d672e736d79687661652e636f6d2f32303137303732375f323132382e706e67)

代码演示：

[![img](https://camo.githubusercontent.com/9db87bcf0c73dcfc02e1b6c3c21e55c500e471074ff26b99bed657b42e2793f5/687474703a2f2f696d672e736d79687661652e636f6d2f32303137303732375f323332362e706e67)](https://camo.githubusercontent.com/9db87bcf0c73dcfc02e1b6c3c21e55c500e471074ff26b99bed657b42e2793f5/687474703a2f2f696d672e736d79687661652e636f6d2f32303137303732375f323332362e706e67)

上面这个盒子，width:200px; height:200px; 但是真实占有的宽高是302*302。 这是因为还要加上padding、border。

注意：**宽度和真实占有宽度，不是一个概念！**来看下面这例子。

### 标准盒模型和IE盒模型

> 我们目前所学习的知识中，以标准盒子模型为准。

标准盒子模型：

[![img](https://camo.githubusercontent.com/9354ddb1b4fd57a640f7499c8ab225e112fa85b923bfd2c56e35e69b076e2a45/687474703a2f2f696d672e736d79687661652e636f6d2f323031352d31302d30332d6373732d32372e6a7067)](https://camo.githubusercontent.com/9354ddb1b4fd57a640f7499c8ab225e112fa85b923bfd2c56e35e69b076e2a45/687474703a2f2f696d672e736d79687661652e636f6d2f323031352d31302d30332d6373732d32372e6a7067)

IE盒子模型：

[![img](https://camo.githubusercontent.com/7e3a407fe0cde86b612cfe989ca0f55a45396020e23f06897b4f6c1d81f5477a/687474703a2f2f696d672e736d79687661652e636f6d2f323031352d31302d30332d6373732d33302e6a7067)](https://camo.githubusercontent.com/7e3a407fe0cde86b612cfe989ca0f55a45396020e23f06897b4f6c1d81f5477a/687474703a2f2f696d672e736d79687661652e636f6d2f323031352d31302d30332d6373732d33302e6a7067)

上图显示：

在 CSS 盒子模型 (Box Model) 规定了元素处理元素的几种方式：

- width和height：**内容**的宽度、高度（不是盒子的宽度、高度）。
- padding：内边距。
- border：边框。
- margin：外边距。

CSS盒模型和IE盒模型的区别：

- 在 **标准盒子模型**中，**width 和 height 指的是内容区域**的宽度和高度。增加内边距、边框和外边距不会影响内容区域的尺寸，但是会增加元素框的总尺寸。
- **IE盒子模型**中，**width 和 height 指的是内容区域+border+padding**的宽度和高度。

注：Android中也有margin和padding的概念，意思是差不多的，如果你会一点Android，应该比较好理解吧。区别在于，Android中没有border这个东西，而且在Android中，margin并不是控件的一部分。

### `<body>`标签也有margin

`<body>`标签有必要强调一下。很多人以为`<body>`标签占据的是整个页面的全部区域，其实是错误的，正确的理解是这样的：整个网页最大的盒子是`<document>`，即浏览器。而`<body>`是`<document>`的儿子。浏览器给`<body>`默认的margin大小是8个像素，此时`<body>`占据了整个页面的一大部分区域，而不是全部区域。来看一段代码。

```html
<!doctype html>
<html lang="en">
 <head>
  <meta charset="UTF-8">
  <meta name="Generator" content="EditPlus®">
  <meta name="Author" content="">
  <meta name="Keywords" content="">
  <meta name="Description" content="">
  <title>Document</title>

	<style type="text/css">

		div{
			width: 100px;
			height: 100px;
			border: 1px solid red;
			padding: 20px;
			margin: 30px;
		}

	</style>

 </head>

 <body>

	<div>有生之年</div>
	<div>狭路相逢</div>

 </body>

</html>
```

上面的代码中，我们对div标签设置了边距等信息。打开google浏览器，按住F12，显示效果如下：

[![img](https://camo.githubusercontent.com/6cebf1dda7b494b4ebcf677924859dafcf49ae63ee133c9e44fb72ffd6bed1e0/687474703a2f2f696d672e736d79687661652e636f6d2f32303135313030335f32372e706e67)](https://camo.githubusercontent.com/6cebf1dda7b494b4ebcf677924859dafcf49ae63ee133c9e44fb72ffd6bed1e0/687474703a2f2f696d672e736d79687661652e636f6d2f32303135313030335f32372e706e67)

## 认识width、height

一定要知道，在前端开发工程师眼中，世界中的一切都是不同的。

比如说，丈量稿纸，前端开发工程师只会丈量内容宽度：

[![img](https://camo.githubusercontent.com/a6628f356e0085d3874dd4b1628fb53e951a0bfaf687efc3800c11f7103a5277/687474703a2f2f696d672e736d79687661652e636f6d2f32303137303732375f323332392e706e67)](https://camo.githubusercontent.com/a6628f356e0085d3874dd4b1628fb53e951a0bfaf687efc3800c11f7103a5277/687474703a2f2f696d672e736d79687661652e636f6d2f32303137303732375f323332392e706e67)

下面这两个盒子，真实占有宽高，都是302*302：

盒子1：

```css
.box1{
	width: 100px;
	height: 100px;
	padding: 100px;
	border: 1px solid red;
}
```

盒子2：

```css
.box2{
	width: 250px;
	height: 250px;
	padding: 25px;
	border: 1px solid red;
}
```

真实占有宽度 = 左border + 左padding + width + 右padding + 右border

上面这两个盒子的盒模型图如下：

[![img](https://camo.githubusercontent.com/0cd8d2b39ead1fadcf0eca3fd3d8344f1aa0ecb8d3d355ae7f2a64e69e1d8165/68747470733a2f2f696d672e736d79687661652e636f6d2f32303137303732385f303932352e706e67)](https://camo.githubusercontent.com/0cd8d2b39ead1fadcf0eca3fd3d8344f1aa0ecb8d3d355ae7f2a64e69e1d8165/68747470733a2f2f696d672e736d79687661652e636f6d2f32303137303732385f303932352e706e67)

**如果想保持一个盒子的真实占有宽度不变，那么加width的时候就要减padding。加padding的时候就要减width**。因为盒子变胖了是灾难性的，这会把别的盒子挤下去。

## 认识padding

### padding区域也有颜色

padding就是内边距。padding的区域有背景颜色，css2.1前提下，并且背景颜色一定和内容区域的相同。也就是说，background-color将填充**所有border以内的区域。**

效果如下：

[![img](https://camo.githubusercontent.com/e374882e9d0a6d2df1531f36c2148ab3f4fde90e2f821876c417ed6953179fde/687474703a2f2f696d672e736d79687661652e636f6d2f32303137303732385f313030352e706e67)](https://camo.githubusercontent.com/e374882e9d0a6d2df1531f36c2148ab3f4fde90e2f821876c417ed6953179fde/687474703a2f2f696d672e736d79687661652e636f6d2f32303137303732385f313030352e706e67)

### padding有四个方向

padding是4个方向的，所以我们能够分别描述4个方向的padding。

方法有两种，第一种写小属性；第二种写综合属性，用空格隔开。

小属性的写法：

```css
	padding-top: 30px;
	padding-right: 20px;
	padding-bottom: 40px;
	padding-left: 100px;
```

综合属性的写法：(上、右、下、左)（顺时针方向，用空格隔开。margin的道理也是一样的）

```css
padding:30px 20px 40px 100px;
```

如果写了四个值，则顺序为：上、右、下、左。

如果只写了三个值，则顺序为：上、右和左、下。

如果只写了两个值，则顺序为：上和下、左和右。

比如说：

```css
padding: 30px 40px;
```

则顺序等价于：30px 40px 30px 40px;

要懂得，**用小属性层叠大属性**。比如：

```css
padding: 20px;
padding-left: 30px;
```

上面的padding对应盒子模型为：

[![img](https://camo.githubusercontent.com/2316c1c1ec69d5dc925a69feee5bf1e45af08dc7d9c2288284d2c505b18875c5/687474703a2f2f696d672e736d79687661652e636f6d2f32303137303732385f313033392e706e67)](https://camo.githubusercontent.com/2316c1c1ec69d5dc925a69feee5bf1e45af08dc7d9c2288284d2c505b18875c5/687474703a2f2f696d672e736d79687661652e636f6d2f32303137303732385f313033392e706e67)

下面的写法：

```css
padding-left: 30px;
padding: 20px;
```

第一行的小属性无效，因为被第二行的大属性层叠掉了。

下面的题，会做了，说明你明白了。

### 一些题目

**题目1**：说出下面盒子真实占有宽高，并画出盒模型图。

```css
	div{
		width: 200px;
		height: 200px;
		padding: 10px 20px 30px;
		padding-right: 40px;
		border: 1px solid #000;
	}
```

答案：

[![img](https://camo.githubusercontent.com/44d139eed82962b275eae4b865e498979219c2d50773383423e54862cc05f7e5/687474703a2f2f696d672e736d79687661652e636f6d2f32303137303732385f313034382e706e67)](https://camo.githubusercontent.com/44d139eed82962b275eae4b865e498979219c2d50773383423e54862cc05f7e5/687474703a2f2f696d672e736d79687661652e636f6d2f32303137303732385f313034382e706e67)

**题目2**：说出下面盒子真实占有宽高，并画出盒模型图。

```css
	div{
		width: 200px;
		height: 200px;
		padding-left: 10px;
		padding-right: 20px;
		padding:40px 50px 60px;
		padding-bottom: 30px;
		border: 1px solid #000;
	}
```

答案：

`padding-left:10px；` 和`padding-right:20px;` 没用，因为后面的padding大属性，层叠掉了他们。

盒子模型如下：

[![img](https://camo.githubusercontent.com/dcbe7207cd2359d8f572a2a747be7fb4162c7db5137f8edf9b56ef0eb7021bc5/687474703a2f2f696d672e736d79687661652e636f6d2f32303137303732385f313130302e706e67)](https://camo.githubusercontent.com/dcbe7207cd2359d8f572a2a747be7fb4162c7db5137f8edf9b56ef0eb7021bc5/687474703a2f2f696d672e736d79687661652e636f6d2f32303137303732385f313130302e706e67)

**题目3**：现在给你一个盒子模型图，请写出代码，试着用最最简单的方法写。

[![img](https://camo.githubusercontent.com/37a8e08475a50bf9603658805f57cbda1fc826a52983bc6aa5daa8c9065130ae/687474703a2f2f696d672e736d79687661652e636f6d2f32303137303732385f313430312e706e67)](https://camo.githubusercontent.com/37a8e08475a50bf9603658805f57cbda1fc826a52983bc6aa5daa8c9065130ae/687474703a2f2f696d672e736d79687661652e636f6d2f32303137303732385f313430312e706e67)

答案：

```css
	width:123px;
	height:123px;
	padding:20px 40px;
	border:1px solid red;
```

**题目4**：现在给你一个盒子模型图，请写出代码，试着用最最简单的方法写。

[![img](https://camo.githubusercontent.com/1edc6a3500754e89a9cfc9b6ca10dfd9222e0ade4799fa471ed118045e946255/687474703a2f2f696d672e736d79687661652e636f6d2f32303137303732385f313430322e706e67)](https://camo.githubusercontent.com/1edc6a3500754e89a9cfc9b6ca10dfd9222e0ade4799fa471ed118045e946255/687474703a2f2f696d672e736d79687661652e636f6d2f32303137303732385f313430322e706e67)

答案：

```css
	width:123px;
	height:123px;
	padding:20px;
	padding-right:40px;
	border:1px solid red;
```

### 一些元素，默认带有padding

一些元素，默认带有`padding`，比如ul标签。如下：

[![img](https://camo.githubusercontent.com/ab1ad54070ee5bdef370426e927774f5e29e616f1cef9fe32f31e5e6ef80ef86/687474703a2f2f696d672e736d79687661652e636f6d2f32303137303732385f313431332e706e67)](https://camo.githubusercontent.com/ab1ad54070ee5bdef370426e927774f5e29e616f1cef9fe32f31e5e6ef80ef86/687474703a2f2f696d672e736d79687661652e636f6d2f32303137303732385f313431332e706e67)

上图显示，不加任何样式的ul，也是有40px的padding-left。

所以，我们做站的时候，为了便于控制，总是喜欢清除这个默认的padding。

可以使用`*`进行清除：

```css
		*{
			margin: 0;
			padding: 0;
		}
```

但是，`*`的效率不高，所以我们使用并集选择器，罗列所有的标签（不用背，有专业的清除默认样式的样式表，今后学习）：

```css
body,div,dl,dt,dd,ul,ol,li,h1,h2,h3,h4,h5,h6,pre,code,form,fieldset,legend,input,textarea,p,blockquote,th,td{
    margin:0;
    padding:0;
}
```

## 认识border

border就是边框。边框有三个要素：像素（粗细）、线型、颜色。

比如：

```
.div1{
	width: 10px;
	height: 10px;
	border: 2px solid red;
}
```

颜色如果不写，默认是黑色。另外两个属性如果不写，则无法显示边框。

### border-style

border的所有的线型如下：（我们可以通过查看`CSS参考手册`得到）

[![img](https://camo.githubusercontent.com/bffbc1ac00f28499553ddf6862e3999dfe3e006da661c8f9bf066209e0e9b23b/687474703a2f2f696d672e736d79687661652e636f6d2f32303137303732385f313433352e706e67)](https://camo.githubusercontent.com/bffbc1ac00f28499553ddf6862e3999dfe3e006da661c8f9bf066209e0e9b23b/687474703a2f2f696d672e736d79687661652e636f6d2f32303137303732385f313433352e706e67)

比如`border:10px ridge red;`这个属性，在chrome和firefox、IE中有细微差别：（因为可以显示出效果，因此并不是兼容性问题，只是有细微差别而已）

[![img](https://camo.githubusercontent.com/f7095b0ec0140d7a7740049d53d2d46836fbdbebd06951a6b612d0751126926d/687474703a2f2f696d672e736d79687661652e636f6d2f32303137303732385f313631392e706e67)](https://camo.githubusercontent.com/f7095b0ec0140d7a7740049d53d2d46836fbdbebd06951a6b612d0751126926d/687474703a2f2f696d672e736d79687661652e636f6d2f32303137303732385f313631392e706e67)

如果公司里面的设计师是处女座的，追求极高的**页面还原度**，那么不能使用css来制作边框。就要用到图片，就要切图了。

所以，比较稳定的border-style就几个：solid、dashed、dotted。

### border拆分

border是一个大综合属性。比如说：

```css
border:1px solid red;
```

就是把上下左右这四个方向的边框，都设置为 1px 宽度、线型实线、red颜色。

PS：小技巧：在sublime text中，为了快速输入`border:1px solid red;`这个属性，可以直接输入`bd`，然后选第二个后回车。

border属性是能够被拆开的，有两大种拆开的方式：

- （1）按三要素拆开：border-width、border-style、border-color。（一个border属性是由三个小属性综合而成的）
- （2）按方向拆开：border-top、border-right、border-bottom、border-left。

现在我们明白了：**一个border属性，是由三个小属性综合而成的**。如果某一个小属性后面是空格隔开的多个值，那么就是上右下左的顺序。举例如下：

```css
border-width:10px 20px;
border-style:solid dashed dotted;
border-color:red green blue yellow;
```

效果如下：

[![img](https://camo.githubusercontent.com/800c1e8542d8b64d1907155f668751e281cab03205e518f3439f682bc748fb25/687474703a2f2f696d672e736d79687661652e636f6d2f32303137303732385f313531362e706e67)](https://camo.githubusercontent.com/800c1e8542d8b64d1907155f668751e281cab03205e518f3439f682bc748fb25/687474703a2f2f696d672e736d79687661652e636f6d2f32303137303732385f313531362e706e67)

（1）按三要素拆：

```css
border-width:10px;    //边框宽度
border-style:solid;   //线型
border-color:red;     //颜色。
```

等价于：

```css
border:10px solid red;
```

(2)按方向来拆：

```css
border-top:10px solid red;
border-right:10px solid red;
border-bottom:10px solid red;
border-left:10px solid red;
```

等价于：

```css
border:10px solid red;
```

（3）按三要素和方向来拆：(就是把每个方向的，每个要素拆开。3*4 = 12)

```css
	border-top-width:10px;
	border-top-style:solid;
	border-top-color:red;
	border-right-width:10px;
	border-right-style:solid;
	border-right-color:red;
	border-bottom-width:10px;
	border-bottom-style:solid;
	border-bottom-color:red;
	border-left-width:10px;
	border-left-style:solid;
	border-left-color:red;
```

等价于：

```css
border:10px solid red;
```

工作中到底用什么？很简答：什么简单用什么。但要懂得，用小属性层叠大属性。举例如下：

[![img](https://camo.githubusercontent.com/d1d7f0b972d52c8d989056c850be3bfc537970250fc4f0d96dccc0c72c09c307/687474703a2f2f696d672e736d79687661652e636f6d2f32303137303732385f313630362e706e67)](https://camo.githubusercontent.com/d1d7f0b972d52c8d989056c850be3bfc537970250fc4f0d96dccc0c72c09c307/687474703a2f2f696d672e736d79687661652e636f6d2f32303137303732385f313630362e706e67)

为了实现上方效果，写法如下：

```css
border:10px solid red;
border-right-color:blue;
```

[![img](https://camo.githubusercontent.com/fc224af05e8f8fd986bd488d3b62418706958ff888113b04f0ca84f973685ff5/687474703a2f2f696d672e736d79687661652e636f6d2f32303137303732385f313630382e706e67)](https://camo.githubusercontent.com/fc224af05e8f8fd986bd488d3b62418706958ff888113b04f0ca84f973685ff5/687474703a2f2f696d672e736d79687661652e636f6d2f32303137303732385f313630382e706e67)

为了实现上方效果，写法如下：

```css
border:10px solid red;
border-style:solid dashed;
```

border可以没有：

```css
border:none;
```

可以某一条边没有：

```css
border-left: none;
```

也可以调整左边边框的宽度为0：

```css
border-left-width: 0;
```

### border-image 属性

比如：

```css
border-image: url(.img.png) 30 round;
```

这个属性在实际开发中用得不多，暂时忽略。

### 举例1：利用 border 属性画一个三角形（小技巧）

完整代码如下：

```css
div{
	width: 0;
	height: 0;
	border: 50px solid transparent;
	border-top-color: red;
	border-bottom: none;
}
```

步骤如下：

（1）当我们设置盒子的width和height为0时，此时效果如下：

[![img](https://camo.githubusercontent.com/13485d6fcf9d7cf68e9c62a0d7a27f0bb427b73b20cb41e9e818811fc9a7cb5f/687474703a2f2f696d672e736d79687661652e636f6d2f32303137303732385f313633392e706e67)](https://camo.githubusercontent.com/13485d6fcf9d7cf68e9c62a0d7a27f0bb427b73b20cb41e9e818811fc9a7cb5f/687474703a2f2f696d672e736d79687661652e636f6d2f32303137303732385f313633392e706e67)

（2）然后将border的底部取消：

[![img](https://camo.githubusercontent.com/54f9e4d0d512d0c6769ccba4696a85edbc1430211079e55db67cb254ab0fa943/687474703a2f2f696d672e736d79687661652e636f6d2f32303137303732385f313634352e706e67)](https://camo.githubusercontent.com/54f9e4d0d512d0c6769ccba4696a85edbc1430211079e55db67cb254ab0fa943/687474703a2f2f696d672e736d79687661652e636f6d2f32303137303732385f313634352e706e67)

（3）最后设置border的左边和右边为白色或者**透明**：

[![img](https://camo.githubusercontent.com/c345bc9cfe9ba79a03a71075e672c6a86bb3fd3d2fca21343005137aac9466b5/687474703a2f2f696d672e736d79687661652e636f6d2f32303137303732385f313634392e706e67)](https://camo.githubusercontent.com/c345bc9cfe9ba79a03a71075e672c6a86bb3fd3d2fca21343005137aac9466b5/687474703a2f2f696d672e736d79687661652e636f6d2f32303137303732385f313634392e706e67)

这样，一个三角形就画好了。

### 举例2：利用 border 属性画一个三角形（更推荐的技巧）

上面的例子1中，画出来的是直角三角形，可如果我想画等边三角形，要怎么做呢？

完整代码如下：（用 css 画等边三角形）

```css
.div1{
	width: 0;
	height: 0;
	border-top: 30px solid red;
	/* 通过改变 border-left 和 border-right 中的像素值，来改变三角形的形状 */
	border-left: 0px solid transparent;
	border-right: 20px solid transparent;
}
```

效果如下：

[![img](https://camo.githubusercontent.com/7b0a11ee8500a62f8b77592565df493b38d5711dc3f5c540526dabfc9a3fe05b/687474703a2f2f696d672e736d79687661652e636f6d2f32303139313030345f313833302e706e67)](https://camo.githubusercontent.com/7b0a11ee8500a62f8b77592565df493b38d5711dc3f5c540526dabfc9a3fe05b/687474703a2f2f696d672e736d79687661652e636f6d2f32303139313030345f313833302e706e67)

另外，我们在上方代码的基础之上，再加一个 `border-radus: 20px;` 就能画出一个扇形。