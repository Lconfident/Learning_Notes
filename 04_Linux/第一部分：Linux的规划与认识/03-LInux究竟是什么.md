# 什么是Linux

Linux是在计算机上运行的，所以在学习Linux之前，也需要了解一下计算机这玩意儿。首先，到底有哪些种类的计算机呢？其次，Linux可以在哪些种类的计算机上运行？最后，Linux源自哪里？这些我们都值得先谈一谈！

### 计算机：计算的辅助工具

这个现代产业的标志——计算机，当初在开发的时候，只是希望可以辅助与简化人们进行大量的运算工作，后来才发展成为一些特殊用途。但万变不离其宗，计算机的基本功能就是：⌈**接受使用者输入的命令，经由CPU的数学与逻辑单元处理后，以产生或存储有用的信息**⌋

为了达到这个目标，计算机就必须要：

- 输入单元：例如鼠标、键盘等等
- 中央处理器（CPU）：含有算术逻辑、控制、记忆等单元
- 输出单元：例如屏幕、打印机等等

如果你拆过计算机的话，那么上面的东西其实就是组成计算机的主要组件了，而为了连结各个组件，因此有了主机板，所以，主机里面就包含了主机板以及CPU，还有各种需要的适配卡。而屏幕、鼠标、键盘则透过与主机的连结，就构成一部可以运行的计算机了。另外，由于计算机只认识0/1，主要通过二进制的方式来计算的，因此计算机的的记忆/存储单位都是以byte/bits为基本单位，他们的单位是这样的：

- 1 Bytes = 8 bits
- 1 KB = 1024 Bytes
- 1 MB = 1024 KB
- 1 GB = 1024 MB

而计算机也因为它的复杂度，而分成了数种等级：

- 超级计算机（Supercomputer）<br/>超级计算机是运行速度最快的计算机，但是它的维护、操作费用也最高！主要用于需要有高速计算的计划中。例如：国防军事、气象侦测、太空科技（全世界仅500大超级计算机）
- 大型计算机(Mainframe Computer)<br/>大型计算机通常也具有数个高速的CPU，功能上虽不及超级计算机，但也可用来处理大量资料与复杂运算。例如：大型企业的主机、全国性的证券交易所等每天需要数以百万笔数据的企业机构，或者是大型企业的数据库服务器等等
- 迷你计算机(Minicomputer)<br/>迷你计算机兼有同时支持多使用者的特性，但是主机可以放在一般作业场所，不像前两个大型计算机需要特殊的空调场所。通常用来作为科学研究、工程分析与工厂的流程管理等等。
- 微电脑（Microcomputer)<br/>又可以称为个人计算机，也是我们主要的探讨目标，体积最小、价格最低，但功能丰富，大致有可以分为桌面型、笔记型等等。

虽然在目前个人计算机使用广泛，但在1990年以前，个人计算机标胶不受重视，因为它的运算速度实在很差，而且当时很有名的操作系统也没有对个人计算机支持，所以才流行不起来。提到操作系统了，下面就说说操作系统！

### 什么是操作系统？

什么是操作系统（Operation System，OS）呢？我们先想一下，如何在计算机上看VCD？你需要

1. 有影音数据的VCD
2. 可读取光盘片的光驱
3. 可转换影音数据输出的CPU
4. 有显示影像的显卡
5. 可以传输声音的声卡
6. 可以输出影像的屏幕
7. 能发声音的喇叭

没错，所有工作的东西都是硬件！

那么问题来了，现在我们知道，计算机所进行的工作都是计算机硬件帮我们达成的，但是，为什么硬件怎么知道如何正确播放VCD呢？这当然是因为有某个东西在控制硬件的工作了，这个东东就是：操作系统。

操作系统可以管理整部计算机的硬件，可以控制CPU进行正确的运算，他可以分辨硬盘里面的数据并进行读取，他还必须要能认识所有的适配卡，这样才能将所有的硬件用起来，不然没有操作系统，计算机硬件就是一堆废铁而已

但即便操作系统掌握完整的硬件资源，这对于使用者来说还是不够的！沟通是必要的，就像上面的VCD，虽然系统可以控制硬件播放VCD，但使用者没有办法控制何时要播出VCD的话，我们还是看不了VCD的。

所以说，一个**完整的操作系统**，应该包含**两个东西**，一个是**核心与其提供的接口工具**、一个是**利用核心提供的接口工具所开发出来的软件**。以最常见的Windows计算机来打个比方，Windows计算机里有个档案总管，当你开启档案总管的时候，他就会显示你硬盘里的数据，这个**显示硬盘里面的数据，就是核心帮你做的**，但是，**你要核心去显示硬盘哪个目录下的数据，则是由档案总管这个工具帮你达成的**！

那么核心有没有做不到的事？答案是有的，举例来说，如果你安装了最新的显示卡在计算机上，常常Windows计算机会告知你：**找不到合适的驱动程序来显示**的问题吧，也就是说，就算你有最新的显卡安装在计算机上，而且也有播放VCD的程序，但是核心操控不了这个最新的显卡，所以就显示不了VCD。没错！你的整个硬件就是由核心来管理的。

核心就是**Kernel**，他是一个操作系统的最底层的东西，由他来掌握整个硬件资源的工作状态，而每个操作系统都有自己的核心，所以说当有新的硬件加入到你的系统的时候，若你的Kernel不认识他，这个硬件就不能工作。

一般来说，Kernel为了达成使用者所需要的正确运算结果，他必须要管理的事项有：

- 系统呼叫接口（System call interface）：为了方便程序开发者可以轻易地透过与Kernel的沟通，将硬件资源进一步利用，于是就需要这个简易的接口来方便程序开发者
- 行程管理（Process control）：听过多任务环境吗？一台计算机可能同时有很多的工作跑到CPU等待运算处理，Kernel要有能力控制这些工作，让CPU的资源有效的分配才行
- 内存管理（Memory management）：控制整个系统的内存处理，若内存不足，Kernel最好还能提供虚拟内存的功能
- 档案系统管理（File system management）：档案系统的管理，例如数据的输入/输出（I/O）等等的工作，还有不同档案格式的支持，如果核心不认识某个档案系统，那么就无法实用该档案系统的档案啦，例如Windows 98 就不认识NTDFS档案格式的硬盘
- 装置的驱动（Device drivers)：硬件的管理是Kernel的主要工作之一，装置的驱动程序就是核心需要做的事情。好在目前有**可加载模块**功能，可以将驱动程序编辑成模块，就不需要重新编辑核心了

所以，所有的硬件都是Kernel来管理的！至于我们要达成一些工作，除了核心本身提供的功能之外（例如上面的档案总管），还可以由其他应用软件来达成！

>   举个例子来说，你要看VCD影片是吧！那么除了Windows提供的默认媒体播放程序之外，你也可以自行安装VCD播放程序来播放VCD。这个播放程序就是应用程序，这个应用程序可以帮你控制核心来工作。
> 
>   因此，我们可以这样说：**核心是控制整个硬件支持的东东，也是一个操作系统的最底层**。然而，要让整个系统更完备的话，就还需要含有相当丰富的核心提供的工具，以及核心相关的应用软件来支持。

OK！提到这里，你知道什么是Linux吧，其实就是一个操作系统，这个操作系统里头包含最主要的kernel以及kernel提供的工具了！他提供了一个完整的操作系统当中最底层的硬件控制与资源管理的完整架构，这个架构是沿袭Unix良好的传统来的，所以相当的稳定而功能强大！

### Linux之前：Unix的统治时代

Torvalds在写出Linux的时候，其实该核心仅能<u>驱动386所有的硬件</u>而已，所谓的<u>让386计算机开始运作，并且等待使用者指令输入</u>而已。

硬件是由核心控制的。而每种操作系统都有它自己的核心，早期硬件的开发者所开发的硬件架构或多或少都不相同。

>   举例来说，2006年之前的麦金塔是请IBM公司开发自己的硬件与操作系统，Windows则是开发在x86架构上的操作系统之一，那么Windows是否可以在麦金塔上面跑？答案是不可行的！不过，2006年之后，麦金塔转而请Inter设计其硬件架构，也就是说其硬件架构已经转为x86系统，因此在2006年以后的麦金塔若实用x86架构时，其硬件可能可以安装Windows系统了。
> 
>   因为Windows操作系统本来就是针对个人计算机x86架构的硬件去设计的，所以他啊当然只能在x86 的个人计算机上运行，在其他不同的平台上，当然就无法运行了。

总结来说就是，每种操作系统都是它专门的机器上面运行的！这点要先明白。不过，Linux由于时Open Source的操作系统，所以它的程序代码就可以被修改，在各种机器上面运行都毫无障碍。换句话讲，**Linux具有可移植性**，这是个很重要的功能！

早在Linux出现之前的二十年（大约是1970年），就有一个稳定且成熟的操作系统存在了！那就是老大哥Unix！那他们两个有什么纠缠呢？众所周知，Linus Torvalds在1991年开发出来Linux，并且丢到网络上提供大家下载，后来大家觉得这个小东西（Linux Kernel）相当小而精巧，就慢慢的有很多朋友投入这个小东西的研究领域去了！

- 1969年以前：一个没有完成的梦想：Bell，MIT与GE的【Multics】系统
  早期的个人计算机很不友好，除非是军事或者科研用途，否则很难接触到。而且早期的计算机架构也很难使用，除了运行速度令人不爽之外，系统接口也很困扰的！因为程序设计者必须要将程序相关的信息在读卡纸上面打洞，然后再将读卡纸插入卡片阅读机来将信息读入主机中运算。光这就已经很麻烦了，如果再有个小失误，重新打卡就很惨，加上主机少，人多，光是等待，就已经很费时间了。
  在之后，操作系统改良，键盘进行信息的输入/输出。不过一个学校里面，主机毕竟可能只有一部，如果多人等待使用，怎么办？好在1960年代初期麻省理工学院（MIT）法阵所谓的：**兼容分时系统（Compatble Time-Sharing System,CTSS）**，它可以让大型主机透过提供数个终端机（terminal）以联机进入主机，来利用主机的资源进行运算工作。这样一来，无论主机在哪里，只要在终端机前面进行输入/输出的作业，就能利用主机提供的功能了。不过，终端机也就只有输入/输出这一个功能，本身完全不具任何运行或软件安装的能力。而且比较先进的主机也只能提供30个不到的终端机而已。
  为了更加强大的主机系统，1965年前后，由贝尔实验室（Bell），麻省理工学院（MIT）及奇异公司（GE）共同发起了Multics的计划，目标是想要大型主机可以达成提供300个以上的终端机使用。但到1969年前后，计划进度落后，资金也短缺，所以该计划就宣告失败...（注：Multics有复杂、多数的意思存在）

- 1969年：Ken Thompson的小型file server system
  在认为Multics计划的不可能性之后，贝尔研究室就退出了该计划。不过，原本参与计划的人员中，已经从该计划中获得一些点子，Ken Thompson就是其中一位！他因为自己的需要，希望开发一个小小的操作系统。在开发时，有一部DEC（Digital Equipment Corporation）的PDP-7没人使用，于是他就准备针对这部主机进行操作系统核心程序的撰写。经过4个星期的奋斗，他终于以组译语言（Assembler）写出了一个核心程序，同时包括一些核心工具程序，以及一个小小的档案系统。那个系统就是Unix的原型！Thompson的这个档案系统有两个重要的概念：1. 所有的程序或系统装置都是档案 2.不管建构编辑器还是附属档案，所写的程序只有一个目的，且要有效地完成目标。这些概念对Linux的发展也有重要影响

- 1973年：Unix的正式诞生
  Ritchie等人以C语言写出了第一个正式的Unix核心，由于Thompson写的那个操作系统实在太好用了，所以在贝尔实验室内部广为流传，并且经过数次改版。由于贝尔实验室隶属于AT&T的，只是AT&T当时忙于其他的商业活动，所以对于Unix采取比较开放的态度，此外Unix在这个时期的发展着都是贝尔实验室的工程师，一般人不容易接受Unix！此外，由于Unix是以比较高阶的C语言写的，相对于编译语言需要与硬件有密切的配合，C语言和硬件的相关性就没有那么大了！这个改变导致Unix很容易被移植到不同的机器上！

- 1977年：重要的Unix分支：BSD的诞生
  前面说，Unix具有可移植性，于是1973年以后，Unix便得以与学术界合作开发！最重要的接触就是与加州柏克莱（Berkeley）大学合作，柏克莱大学的Bill Joy在取得Unix的源码之后，着手修改成适合自己机器的版本，并且新增了很多的工具软件与编译程序，最终将它命名为Berkeley Software Distribution（BSD）。Bill Joy也是Sun公司的创业者！Sun即以BSD发展的核心进行自己的商业Unix版本

- 1979年：一个措手不及的版权宣告
  
  由于Unix的高度可移植性与强大的效能，加上当时并没有版权的纠纷，所以让很多商业公司开始了对Unix操作系统的发展，例如AT&T自家的System V、IBM的AIX以及HP与DEC等公司，都推出自家的主机搭配自己的Unix操作系统。但是操作系统的Kernel必须要跟硬件配合，而早期所有的公司还没有所谓的协议的概念，所以每个计算机公司出产的硬件自然就不一样了！早期的Unix在架构上大同小异，也就是说早期Unix的作用只能与服务器（Server）或者大型工作站（Workstation）划上等号
  但这个高度开放的Unix系统在1979年有了重大转折~因为AT&T公司要收回版权

- 1984年：x86架构的Minix诞生
  关于1979年的版权声明中，影响最大的就是学校教Unix相关学问的老师了，细想一下，连核心源码都没有，这怎么教？聪明的人还是有的，Tanenbaum（谭宁邦）教授想既然1979年的Unix第7版可以在Intel的x86架构上面进行移植，那么理论上来说，就可以将Unix改写并移植到x86上面。于是他自己动手写了个Minix这个Unix Like的核心程序！为了避免纠纷，他完全不看Unix的核心源码！并且强调他的Minix必须能够与Unix兼容才行！他从1984年开始撰写核心程序，到了1986年终于完成。这个Minix版本有意思的是，他并不是完全免费的，无法在网络上下载！必须透过磁盘/磁带购买才行！

### 关于GNU计划

- 1984年：GNU与FSF计划的成立
  Richard Mathew Stallman（史托曼）在1984年发起的GNU计划，对现今的自由软件风潮，有不可磨灭的地位。这人从小就聪明，1971年的时候就进入黑客圈相当出名的人工智能实验室（AI Lab），这个时期的黑客是指计算机功力很强的人，而非专门破坏计算机的人。当时的黑客圈对于软件的着眼点都是分享，所以没有专利方面的困扰！不过后来他发现自己使用的Lisp操作系统，是麻省理工学院的专利，是无法共享的，这对于一个想成立一个开放团体（目的还是开发新的程序和软件）的史托曼来说是个障碍。于是他放弃了Lisp系统，接触了Unix系统之后，发现这玩意好哇，还能移植。后来就把他原本的软件移植到Unix上面，而且他将所有他发展的软件均撰写为可移植的型态！
  1984年，史托曼开始了GNU计划，目的是，想要建立一个自由的开放的Unix操作系统。但建立一个操作系统谈何容易啊！而且当时的GNU是仅有自己一个人单打独斗的史托曼~这太麻烦，但又不能放弃。于是他又聪明了一回，反其道而行~既然操作系统太复杂，我就先写可以在Unix上面运行的小程序，这总可以吧？这个想法上，史托曼开始了程序的创作。在写作的期间，为了不吃官司，他绝对不看专利软件的源码。为了这个伟大的计划，他开始使用原本的Unix上面跑的软件，并自行撰写功能与Unix原有专利软件相仿的软件。
  但不论是什么软件，都得要进行编译成为二进制档案（binary file）后才能执行，因此他便开始撰写C语言的编译器，那就是现在赫赫有名的GNU C（gcc）！
- 1988年：图形接口XFree86计划
  有鉴于图形使用者接口（Graphical User Interface，GUI）的需求日益加重，在1984年由MIT与其他厂商共同发表了X Window System ，并且在1988年成立了非营利性的XFree86这个组织。所谓的XFree86其实是X Window System + Free + x86 的整合名称，而这个XFree86的GUI界面更在Linux的核心1.0版于1994年释出！
- 1991年：芬兰大学生Linus Torvalds 的一则简讯
  到了1991年，芬兰的赫尔辛基大学的Linus Torvalds 在BBS上贴了一则消息，宣称他以bash、gcc等工具写了一个小小的核心程序，这个核心程序可以在Intel的386机器上面运行，这让很多人感兴趣！从此开始了Linux的不平凡之路！
  为什么叫GNU呢？其实是GNU's Not Unix嘛！写过程序的都知道，GNU = GNU's Not Unix可是无穷循环呐~毕竟GNU一直以来缺乏核心程序，导致他们的自由软件只能在其他的Unix上面跑，目前的Linux就完美契合GNU，一套完整的Linux操作系统搞定了！

### Linux的优缺点

Linux做主机，有以下的优点：

- 稳定的系统
  Linux本来就是基于Unix概念发展出来的操作系统，因此，Linux具有与Unix系统类似的程序接口和操作方式，当然继承了Unix稳定且高效的优点。常听到安装Linux的主机连续运行一年以上都不宕机、不必关机都是小事。
- 免费或少许费用
  由于Linux事GNU下的产物，因此任何人都可以自由取得Linux，至于一些安装套件的发行者，他们发行的安装光盘也仅需u要少许费用即可获得！不同于Unix需要负担庞大的版权费用，当然也不像微软需要一而再、再而三的更新系统，并且缴纳大量费用！
- 安全性、漏洞的快速修补
  常玩主机的人都知道一句话，没有绝对安全的主机。没错！不过Linux由于支持者众多，随时可以获取最新的安全信息，还是相当安全的！
- 多任务、多使用者
  与Windows系统不同的，Linux主机上可以允许多人上线来工作，并且资源分配较公平，笔Windows的单人假多任务系统要稳定的多咯！这是个相当好的功能！怎么说呢？你可以在一部Linux主机上面规划出不同等级的使用者，而且每个使用者登入系统时的工作环境都可以不相同，此外，还可以允许不同的使用者在同一个时间登入主机，以同时使用主机的资源。
- 使用者与群组的规划
  在Linux的机器中，档案的属性可以分为【可读、可写、可执行】等参数来定义一个档案的适用性，此外，这些属性还可以分为三个种类，分别是【档案拥有者、档案所属群组、其他非拥有者与群组者】。这对于项目计划或其他计划开发者具有相当良好的系统保密性。
- 相对比较不耗资源的系统
  Linux只要一步p-100以上等级的计算机就可以安装并且快乐使用了，目前市面上任何一台计算机都可以达到这个要求。
- 适合小核心程序的嵌入式系统
  由于Linux只要几百K不到的程序代码就可以完成一个完整的操作系统，因此非常适合目前家电或小电子用品的操作系统，手机、数字相机、家电~

反正Linux的好处说不完！但他有个致命缺陷，就是Linux需要以指令列的终端机模式进行系统的管理！

- 没有特定的支持厂商
  由于是非营利性的团体来开发的，那有问题，该如何是好？目前在中国台湾比较著名的Red Hat与SuSE均有设立服务点。、
- 图形接口做的不够好
  虽然有X Window架构，但他还不是核心部分，有没有他对Linux的服务器执行都没有影响！

### Linux的应用

- 网络服务器（Server）：提供Internet一种以上的网络服务的主机，目前一部Linux上面就可以假设多个服务器软件，是个强项
- 工作站计算机（Workstation）：基本上，工作站可以视为仅提供一群特定人士，作为数值分析、科学用途的机器。他和服务器不一样的地方就是网络服务，工作站不应该提供Internet的服务的（LAN内的服务可行）
- 终端机（Terminal）：简单来说，就是你面前的计算机，一般称为Desktop的系统，平时也就做这些工作：
  - 上网浏览
  - 文本处理
  - 网络接口之公文处理系统
  - 办公室软件处理数据
  - 收发电子邮件

### 常见的授权模式与定义

- Open Source：Open source表示软件释出是，一定会随着源码的释出
  
  GNU General Public License：这个主要定义在自由软件上面，任何挂上GPL授权的软件，需要公布其源码，大致有几个方向：
  
  1. 任何个人或公司均可释出自由软件（free software）
  2. 任何释出自由软件的个人或公司，均可有自己的服务来收取适当的费用
  3. 该软件的源码需随软件附上，并且是可公开发表的
  4. 任何人均可透过任何正常管道取得此一自由软件，且均可取得此以授权模式

- BSD：与GPL类似

- Close Source：有专人维护，但是灵活度低

- Freeware：不同于【Free software】，Freeware为【免费软件】，而不是【自由软件】，虽然是免费的，但不见得必须要公布源码，所以【来路不明的软件请勿安装】

- Shareware：共享软件，这个很有意思，使用初期，它是免费的，但到了所谓的【试用期限】你就必须选择【付费或继续使用】或者【将它移除】的宿命。通常这类软件会自行撰写失效程序，让你在试用期限之后就无法使用该软件

### 学习的建议

1. 先理解一下基础的硬件知识，不一定要全听懂，但至少【听过、有概念】即可
2. 先了解一下Linux的基础知识，这些包括【使用者、群组的概念】、【权限的概念】、【程序的定义】等等
3. 必需学会的文本编辑器【vi】
4. 实际操作Linux时，必定学习的【Shell】，最好【Shell scripts】也能够了解
5. 如果上面都懂了，网络的基础就是下一阶段的东东，这部分包含【IP概念】【路由概念】【TCP/IP】等等
6. 如果连网络基础都搞懂了，那么网站的架设对你来说，简直不要【太简单】了

### 注意事项

X Window与Command Line

X Window只是一个软件，并不是一套【操作系统】，有相当多的问题，最大的问题来自于【系统资源的有效应用】，一开X Window，你的内存就几乎被X-Window吃光了！剩下的可怜一丁点资源能做什么呢？

- X-Window
  如果你对于Linux的要求时【桌面型计算机】，而且不架设网站的话，那么学习X-Window绝对是需要的！至于指令列模式就不是那么必要了！但如果你时【服务器与工作站】的话，X-Window就不那么需要了。

- 服务器端
  开个账号进去远程控制时最简单且迅速的方法！

- 发生问题怎么处理？
  
  1. **在自己的主机/网路数据库上查询How-To或FAQ**
     其实，在Linux主机及网路上面已经有相当多的FAQ整理出来了！所以，当你发生任何问题的时候，除了自己检查， 或者到上述的实作网站上面查询一下是否有设定错误的问题之外，最重要的当然就是到各大FAQ的网站上查询罗！ 以下列出一些有用的FAQ与How-To网站给您参考一下：
     
     Linux自己的文件数据： /usr/share/doc (在你的Linux系统中)
     
     The Linux Documentation Project：http://www.tldp.org/](http://www.tldp.org/)
  
  2. 注意讯息输出，自行解决疑难杂症：
      一般而言，Linux在下达指令的过程当中，或者是log file里头就可以自己查得错误资讯了，举个例子来说，当你下达：
     
     ```Shell
     [root@linux ~]# ls -l /vbird
     ```
     
     由于系统并没有 /vbird 这个目录，所以会在荧幕前面显示：
     
     ```shell
     ls: /vbird: No such file or directory
     ```
     
     这个错误讯息够明确了吧！系统很完整的告诉您『查无该资料』！请注意，发生错误的时候，请先自行以萤幕前面的资讯来进行 debug(除错)的动作，然后，如果是网路服务的问题时，请到/var/log/这个目录里头去查阅一下 log file(登录档)，这样可以几乎解决大部分的问题了！

- Netman大大给的建议：
  
  此外，Netman 兄提供的一些学习的基本方针，提供给大家参考：
  
  - 在Windows里面，程式有问题时，如果可能的话先将所有其它程式保存并结束，然后尝试按救命三键 (Ctrl+Alt+Delete)，将有问题的程式(不要选错了程式哦)『结束工作』，看看能不能恢复系统。不要动不动就直接关机或reset。
  - 有系统地设计文件目录，不要随便到处保存文件以至以后不知道放哪里了， 或找到文件也不知道为何物。
  - 养成一个做记录的习惯。尤其是发现问题的时候， 把错误信息和引发状况以及解决方法记录清楚，同时最后归类及定期整理。别以为您还年轻，等你再弄多几年计算机了， 您将会非常庆幸您有此一习惯。
  - 如果看在网路上看到任何好文章，可以为自己留一份copy，同时定好题目，归类存档。(鸟哥注：需要注意智慧财产权！)
  - 作为一个使用者，人要迁就机器；做为一个开发者，要机器迁就人。
  - 学写 script 的确没设定 server 那么好玩，不过以我自己的感觉是：关键是会得『偷』， 偷了会得改，改了会得变，变则通矣。
  - 在Windows里面，设定不好设备，您可以骂它；在Linux里面，如果设定好设备了，您得要感激它！