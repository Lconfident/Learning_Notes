| title                          | publish |
| --- | ------- |
| 01-CSS属性：字体属性和文本属性 | true    |



## 本文重要内容

- CSS的单位
- 字体属性
- 文本属性
- 定位属性：position、float、overflow等

## CSS的单位

HTML中只有一种单位，那就是px（像素），所以单位可以省略，但是CSS不一样。**CSS的单位必须要写**，因为它没有默认单位。

### 绝对单位

1`in`=2.54`cm`=25.4`mm`=72`pt`=6`pc`

各单位含义：

- `in`：英寸Inches（1英寸=2.54厘米）
- `cm`：厘米Centimeters
- `mm`：毫米Millimeters
- `pt`：点Points，或者叫英镑（1点=1/72英镑）
- `pc`：皮卡Picas（1皮卡=12点）

### 相对单位

- `px`：像素
- `em`：印刷单位相当于12个点
- `%`：百分比，相对于周围文字的大小

为什么说像素px是一个相对单位呢，这也很好理解。比如说，电脑屏幕的的尺寸是不变的，但是我们可以让其显示不同的分辨率，在不同的分辨率下，单个像素的长度肯定是不一样的。

百分比`%`这个相对单位要怎么用呢？这里也举个例子：

![img](https://camo.githubusercontent.com/74a73d2885f5427f0c329a49ba25f4f2f096e468bedc294bf13e0d102ae5bc11/687474703a2f2f696d672e736d79687661652e636f6d2f323031352d31302d30332d6373732d31372e706e67)

## font字体属性

CSS有很多**非布局样式**，包括：字体、行高、颜色、大小、背景、边框、滚动、换行、装饰性属性（粗体、斜体和下划线）等。

我们先讲字体属性。

css常见的字体属性有以下几种：

```css
p{
    font-size:50px;/*字体大小*/
    line-height:30px;/*行高*/
    font-family:幼圆,黑体;/*字体类型，如果没有幼圆就用黑体，没有黑体就显示默认*/
    font-style:italic;/*italic表示斜体，normal表示不倾斜*/
    font-weight:bold; /*相当于700的粗体*/
    font-variant:small-caps;/*小写变大写*/
}
```

### 行高

CSS中，所有的行，都有行高。盒子模型的padding，绝对不是直接作用在文字上的，而是作用在“行”上的。

![img](https://camo.githubusercontent.com/e7a2d02ed5506b3903bcb8ecf150d303be63405c75c226b9123a5df91c13cfe4/687474703a2f2f696d672e736d79687661652e636f6d2f32303137303830385f323231362e706e67)

设置行高为30px，30px * 5 = 150px，通过查看审查元素，这个p标签的高度果然为150px。而且发现，我们并没有给这个p标签设置高度，显然是内容将其撑高的。

垂直方向来看，文字在自己的行里是居中的。比如，文字是14px，行高是24px，那么padding就是5px：

![img](https://camo.githubusercontent.com/3077e45aae61cf20addf86692e56e7ff4f6ca04a5783262a413afabcf6d1d9db/687474703a2f2f696d672e736d79687661652e636f6d2f32303137303830385f323232302e706e67)

为了严格保证字在行里面居中，工程师有一个约定： **行高、字号，一般都是偶数**。这样可以保证，它们的差一定偶数，就能够被2整除。

### 如何让单行文本垂直居中

小技巧：如果一段文本只有一行，如果此时设置**行高 = 盒子高**，就可以保证单行文本垂直居中。这个很好理解。

上面这个小技巧，只适用于单行文本垂直居中，不适用于多行。如果想让多行文本垂直居中，还需要计算盒子的padding。计算方式如下：

[![img](https://camo.githubusercontent.com/44f8c20e6a9617ff2efd06fe916de1210992e47aa1e869bcc7e3c58bc7387dfa/687474703a2f2f696d672e736d79687661652e636f6d2f32303137303830385f323234302e706e67)](https://camo.githubusercontent.com/44f8c20e6a9617ff2efd06fe916de1210992e47aa1e869bcc7e3c58bc7387dfa/687474703a2f2f696d672e736d79687661652e636f6d2f32303137303830385f323234302e706e67)

### `vertical-align: middle;` 属性

`vertical-align`属性可用于指定**行内元素**（inline）、**行内块元素**（inline-block）、**表格的单元格**（table-cell）的垂直对齐方式。主要是用于图片、表格、文本的对齐。

代码举例：

```
vertical-align: middle; /*指定行级元素的垂直对齐方式。*/
```

关于这一点，连 MDN 上都没讲详细。MDN上的原话是 “vertical-align 用来指定行内元素（inline）或表格单元格（table-cell）元素的垂直对齐方式。” MDN上的这种描述是不完整的，漏掉了行内块元素（inline-block）。（可能它认为行内元素包括行内块元素）

### 字号、行高、字体三大属性

（1）字号：

```
	font-size:14px;
```

（2）行高：

```
	line-height:24px;
```

（3）字体：（font-family就是“字体”，family是“家庭”的意思）

```
	font-family:"宋体";
```

是否加粗属性以及上面这三个属性，我们可以连写：（是否加粗、字号 font-size、行高 line-height、字体 font-family）

格式：

```
	font: 加粗 字号/行高/ 字体
```

举例：

```
	font: 400 14px/24px "宋体";
```

PS：400是nomal，700是bold。

上面这几个属性可以连写，但是有一个要求，font属性连写至少要有**字号和字体**，否则连写是不生效的（相当于没有这一行代码）。

**2、字体属性的说明：**

（1）网页中不是所有字体都能用，因为这个字体要看用户的电脑里面装没装，比如你设置：

```
	font-family: "华文彩云";
```

上方代码中，如果用户的 Windows 电脑里面没有这个字体，那么就会变成宋体。

页面中，中文我们一般使用：微软雅黑、宋体、黑体。英文使用：Arial、Times New Roman。页面中如果需要其他的字体，就需要单独安装字体，或者切图。

（2）为了防止用户电脑里，没有微软雅黑这个字体。就要用英语的逗号，提供备选字体。如下：（可以备选多个）

```
	font-family: "微软雅黑","宋体";
```

上方代码表示：如果用户电脑里没有安装微软雅黑字体，那么就是宋体。

（3）我们须将英语字体放在最前面，这样所有的中文，就不能匹配英语字体，就自动的变为后面的中文字体：

```
	font-family: "Times New Roman","微软雅黑","宋体";
```

上方代码的意思是，英文会采用Times New Roman字体，而中文会采用微软雅黑字体（因为美国人设计的Times New Roman字体并不针对中文，所以中文会采用后面的微软雅黑）。比如说，对于`smyhvae哈哈哈`这段文字，`smyhvae`会采用Times New Roman字体，而`哈哈哈`会采用微软雅黑字体。

可是，如果我们把中文字体写在前面：(错误写法)

```
	font-family: "微软雅黑","Times New Roman","宋体";
```

上方代码会导致，中文和英文都会采用微软雅黑字体。

（4）所有的中文字体，都有英语别名。

微软雅黑的英语别名：

```
	font-family: "Microsoft YaHei";
```

宋体的英语别名：

```
	font-family: "SimSun";
```

于是，当我们把字号、行高、字体这三个属性合二为一时，也可以写成：

```
	font:12px/30px  "Times New Roman","Microsoft YaHei","SimSun";
```

（5）行高可以用百分比，表示字号的百分之多少。

一般来说，百分比都是大于100%的，因为行高一定要大于字号。

比如说， `font:12px/200% “宋体”`等价于`font:12px/24px “宋体”`。`200%`可以理解成word里面的2倍行高。

反过来， `font:16px/48px “宋体”;`等价于`font:16px/300% “宋体”`。

### 字体加粗属性

```css
.div {
	font-weight: normal; /*正常*/
	font-weight: bold;  /*加粗*/
	font-weight: 100;
	font-weight: 200;
	font-weight: 900;
}
```

在设置字体是否加粗时，属性值既可以填写`normal`、`bold`这样的加粗字体，也可以直接填写 100至900 这样的数字。`normal`的值相当于400，`bold`的值相当于700。

## 文本属性

CSS样式中，常见的文本属性有以下几种：

- `letter-spacing: 0.5cm ;` 单个字母之间的间距
- `word-spacing: 1cm;` 单词之间的间距
- `text-decoration: none;` 字体修饰：none 去掉下划线、**underline 下划线**、line-through 中划线、overline 上划线
- `color:red;` 字体颜色
- `text-align: center;` 在当前容器中的对齐方式。属性值可以是：left、right、center（**在当前容器的中间**）、justify
- `text-transform: lowercase;` 单词的字体大小写。属性值可以是：`uppercase`（单词大写）、`lowercase`（单词小写）、`capitalize`（每个单词的首字母大写）

这里来一张表格的图片吧，一览无遗：

![img](https://camo.githubusercontent.com/46bfc3f2035d6da6b5e28e129d208a18571507c95e5d3e7f1f7f5a07b18c2678/687474703a2f2f696d672e736d79687661652e636f6d2f323031352d31302d30332d6373732d31382e706e67)

## 列表属性

```
ul li{
	list-style-image:url(images/2.gif) ;  /*列表项前设置为图片*/
	margin-left:80px;  /*公有属性*/
}
```

另外还有一个简写属性叫做`list-style`，它的作用是：将上面的多个属性写在一个声明中。

我们来看一下`list-style-image`属性的效果：

[![img](https://camo.githubusercontent.com/702d18f4081cd07fee5df774325e8feed8873dfdcdfad9016f712f5f40a8cc50/687474703a2f2f696d672e736d79687661652e636f6d2f323031352d31302d30332d6373732d32332e706e67)](https://camo.githubusercontent.com/702d18f4081cd07fee5df774325e8feed8873dfdcdfad9016f712f5f40a8cc50/687474703a2f2f696d672e736d79687661652e636f6d2f323031352d31302d30332d6373732d32332e706e67)

给列表前面的图片加个边距吧，不然显示不完整：

[![img](https://camo.githubusercontent.com/a787d5b4e09c1a0ebac641d0144cafa324ebea1f03051c54030edb8275f260b3/687474703a2f2f696d672e736d79687661652e636f6d2f323031352d31302d30332d6373732d32345f322e706e67)](https://camo.githubusercontent.com/a787d5b4e09c1a0ebac641d0144cafa324ebea1f03051c54030edb8275f260b3/687474703a2f2f696d672e736d79687661652e636f6d2f323031352d31302d30332d6373732d32345f322e706e67)

这里来一张表格的图片吧，一览无遗：

![img](https://camo.githubusercontent.com/dd4da87a1bb691e1364da3ffa646a752be770ca2f9eec4f94564b660a732ef8f/687474703a2f2f696d672e736d79687661652e636f6d2f323031352d31302d30332d6373732d32362e706e67)

## overflow属性：超出范围的内容要怎么处理

`overflow`属性的属性值可以是：

- `visible`：默认值。多余的内容不剪切也不添加滚动条，会全部显示出来。
- `hidden`：不显示超过对象尺寸的内容。
- `auto`：如果内容不超出，则不显示滚动条；如果内容超出，则显示滚动条。
- `scroll`：Windows 平台下，无论内容是否超出，总是显示滚动条。Mac 平台下，和 `auto` 属性相同。

针对上面的不同的属性值，我们来看一下效果： 举例：

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
			background-color: #00cc66;
			margin-right: 100px;
			float: left;
		}

		#div1{
			overflow: auto;/*超出的部分让浏览器自行解决*/
		}
		#div2{
			overflow: visible;/*超出的部分会显示出来*/
		}

		#div3{
			overflow: hidden;/*超出的部分将剪切掉*/
		}

	</style>

 </head>

 <body>

	<div id="div1">其实很简单 其实很自然 两个人的爱由两人分担 其实并不难 是你太悲观 隔着一道墙不跟谁分享 不想让你为难 你不再需要给我个答案</div>
	<div id="div2">其实很简单 其实很自然 两个人的爱由两人分担 其实并不难 是你太悲观 隔着一道墙不跟谁分享 不想让你为难 你不再需要给我个答案</div>
	<div id="div3">其实很简单 其实很自然 两个人的爱由两人分担 其实并不难 是你太悲观 隔着一道墙不跟谁分享 不想让你为难 你不再需要给我个答案</div>
 </body>

</html>
```

![img](https://camo.githubusercontent.com/7dceddcb0517a9a31d445052dfa1b32bb830f3a99f4f96fffc6a9be782316b02/687474703a2f2f696d672e736d79687661652e636f6d2f323031352d31302d30332d6373732d33312e706e67)

## 鼠标的属性 cursor

鼠标的属性`cursor`有以下几个属性值：

- `auto`：默认值。浏览器根据当前情况自动确定鼠标光标类型。
- `pointer`：IE6.0，竖起一只手指的手形光标。就像通常用户将光标移到超链接上时那样。
- `hand`：和`pointer`的作用一样：竖起一只手指的手形光标。就像通常用户将光标移到超链接上时那样。

比如说，我想让鼠标放在那个标签上时，光标显示手状，代码如下：

```css
p:hover{
	cursor: pointer;
}
```

另外还有以下的属性：（不用记，需要的时候查一下就行了）

- all-scroll :　 IE6.0 有上下左右四个箭头，中间有一个圆点的光标。用于标示页面可以向上下左右任何方向滚动。

- col-resize :　 IE6.0 有左右两个箭头，中间由竖线分隔开的光标。用于标示项目或标题栏可以被水平改变尺寸。

- crosshair :　 简单的十字线光标。

- default :　 客户端平台的默认光标。通常是一个箭头。

- hand :　 竖起一只手指的手形光标。就像通常用户将光标移到超链接上时那样。

- move :　 十字箭头光标。用于标示对象可被移动。

- help :　 带有问号标记的箭头。用于标示有帮助信息存在。

- no-drop :　 IE6.0 带有一个被斜线贯穿的圆圈的手形光标。用于标示被拖起的对象不允许在光标的当前位置被放下。

- not-allowed :　 IE6.0 禁止标记(一个被斜线贯穿的圆圈)光标。用于标示请求的操作不允许被执行。

- progress :　 IE6.0 带有沙漏标记的箭头光标。用于标示一个进程正在后台运行。

- row-resize :　 IE6.0 有上下两个箭头，中间由横线分隔开的光标。用于标示项目或标题栏可以被垂直改变尺寸。

- text :　 用于标示可编辑的水平文本的光标。通常是大写字母 I 的形状。

- vertical-text :　 IE6.0 用于标示可编辑的垂直文本的光标。通常是大写字母 I 旋转90度的形状。

- wait :　 用于标示程序忙用户需要等待的光标。通常是沙漏或手表的形状。

- *-resize :　 用于标示对象可被改变尺寸方向的箭头光标。

- ```
         w-resize | s-resize | n-resize | e-resize | ne-resize | sw-resize | se-resize | nw-resize
     ```
  ```

- url ( url ) :　 IE6.0 用户自定义光标。使用绝对或相对 url 地址指定光标文件(后缀为 .cur 或者 .ani )。

## 滤镜

这里只举一个滤镜的例子吧。比如说让图片变成灰度图的效果，可以这样设置滤镜：

  ```
	<img src="3.jpg" style="filter:gray()">
```

举例代码：

​```html
 <body>
	<table>
		<tr>
			<td>原始图片</td>
			<td>图片加入黑白效果</td>
		</tr>
	<tr>
		<td><img src="3.jpg"></td>
		<td><img src="3.jpg" style="filter:gray()"></td> /*滤镜：设置图片为灰白效果*/
	</tr>
	</table>
 </body>
```

效果如下：

[![img](https://camo.githubusercontent.com/4561b8831b81ec040921043701b22167346d701c4dda708093e937ed99f52481/687474703a2f2f696d672e736d79687661652e636f6d2f323031352d31302d30332d6373732d33362e706e67)](https://camo.githubusercontent.com/4561b8831b81ec040921043701b22167346d701c4dda708093e937ed99f52481/687474703a2f2f696d672e736d79687661652e636f6d2f323031352d31302d30332d6373732d33362e706e67)

**延伸：** 滤镜本身是平面设计中的知识。如果你懂一点PS的话···打开PS看看吧：

[![img](https://camo.githubusercontent.com/97d40dddb1363c9f857c2840264972b5d2eaa5e69809333b891623b5ecf3322c/687474703a2f2f696d672e736d79687661652e636f6d2f323031352d31302d30332d6373732d33382e706e67)](https://camo.githubusercontent.com/97d40dddb1363c9f857c2840264972b5d2eaa5e69809333b891623b5ecf3322c/687474703a2f2f696d672e736d79687661652e636f6d2f323031352d31302d30332d6373732d33382e706e67)



## 导航栏的制作（本段内容为随笔）

现在，我们利用float浮动属性来把无序列表做成一个简单的导航栏吧，效果如下：

[![img](https://camo.githubusercontent.com/1d2da51b081a4e667e7ff6d440d72dadb04107465519a838249b05b0efddea9e/687474703a2f2f696d672e736d79687661652e636f6d2f323031352d31302d30332d6373732d33342e706e67)](https://camo.githubusercontent.com/1d2da51b081a4e667e7ff6d440d72dadb04107465519a838249b05b0efddea9e/687474703a2f2f696d672e736d79687661652e636f6d2f323031352d31302d30332d6373732d33342e706e67)

代码：

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
		ul{
			list-style: none;/*去掉列表前面的圆点*/
			width: 420px;
			height: 60px;
			background-color: black;/*设置整个导航栏的背景为灰色*/
		}

		li{
			float: left;/*平铺*/
			margin-right: 30px;
			margin-top: 16px;
		}

		a{
			text-decoration: none;/*去掉超链的下划线*/
			font-size: 20px;
			color: #BBBBBB;/*设置超链的字体为黑色*/
			font-family:微软雅黑;
		}

	</style>

 </head>
 <body>
	<ul>
		<li><a href="">博客园</a></li>
		<li><a href="">新随笔</a></li>
		<li><a href="">联系</a></li>
		<li><a href="">订阅</a></li>
		<li><a href="">管理</a></li>

	</ul>
 </body>
</html>
```

实现效果如下：

[![img](https://camo.githubusercontent.com/c217f173ec8dff54fa87e5e72ef5ebcc785565ceb0667e89b9efea40ba36e408/687474703a2f2f696d672e736d79687661652e636f6d2f323031352d31302d30332d6373732d33352e706e67)](https://camo.githubusercontent.com/c217f173ec8dff54fa87e5e72ef5ebcc785565ceb0667e89b9efea40ba36e408/687474703a2f2f696d672e736d79687661652e636f6d2f323031352d31302d30332d6373732d33352e706e67)

