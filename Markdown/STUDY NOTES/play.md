可以按最外层到最内层看：

**第 1 层：页面容器**

```ts
NavDestination() {
  ...
}
```

这是整个播放页面的根容器。

里面设置了：

```ts
.hideTitleBar(true)
.onReady(...)
```

作用是隐藏标题栏，并拿到导航栈 `pathStack`。

---

**第 2 层：底部对齐的 Stack**

```ts
Stack({ alignContent: Alignment.Bottom }) {
  ...
}
```

这是页面主体容器。

因为设置了 `Alignment.Bottom`，所以里面后面写的播放列表弹层会贴在底部。

这一层里面主要放了两个大块：

1. 播放主界面
2. 底部播放列表弹层

---

**第 3 层：播放主界面**

```ts
Stack() {
  Image(this.playState.img) // 背景
  Column() { ... }          // 内容
}
```

播放主界面也是一个 `Stack`，它有两层：

第一层：模糊背景图

```ts
Image(this.playState.img)
  .width('100%')
  .height('100%')
  .blur(1000)
```

使用当前歌曲封面作为全屏背景。

第二层：真正的播放器内容

```ts
Column() {
  Column() {
    ...
  }
}
```

里面包含唱片、歌名、操作按钮、进度条、播放控制。

---

**第 4 层：播放器内容**

播放器内容这个 `Column` 里从上到下是：

1. 唱片区域
2. 歌曲信息区域
3. 操作按钮区域
4. 播放进度和控制按钮区域

对应代码：

```ts
Column() {
  Stack() { ... }  // 唱片 + 唱针
  Stack() { ... }  // 歌名 + 作者
  Row() { ... }    // 点赞、评论、铃铛、下载
  Column() { ... } // 进度条 + 播放控制按钮
}
```

---

**第 5 层：唱片区域**

```ts
Stack({ alignContent: Alignment.Top }) {
  Row() { ... }      // CD 和封面
  Image(...)         // 唱针
}
```

这一层用 `Stack` 是为了让唱针压在唱片上面。

里面有两层：

第一层：CD 唱片

```ts
Row() {
  Row() {
    Image(this.playState.img)
  }
  .backgroundImage($r('app.media.ic_cd'))
}
```

`ic_cd` 是唱片底图，当前歌曲封面放在中间。

第二层：唱针

```ts
Image($r('app.media.ic_stylus'))
  .rotate({ angle: -55 })
```

唱针图片叠在唱片上方。

---

**第 6 层：歌曲信息区域**

```ts
Stack() {
  Column() { 蓝色文字 }
  Column() { 粉色文字 }
  Column() { 白色文字 }
}
```

这里叠了三份相同的歌名和作者。

分别是：

```ts
#4bb0c4
#ec5c87
Color.White
```

因为第三层白色文字 `zIndex(3)` 最大，所以白色在最上面。

前两层可能是为了做重影、霓虹、动画效果，但现在没有设置偏移，所以基本会被白色文字盖住。

---

**第 7 层：操作按钮区域**

```ts
Row() {
  Badge(...) { Image(ic_like) }
  Badge(...) { Image(ic_comment_o) }
  Badge(...) { Image(ic_bells_o) }
  Badge(...) { Image(ic_download_o) }
}
```

这是点赞、评论、铃铛、下载四个按钮。

每个按钮外面包了一个 `Badge`，用来显示角标：

```ts
99+
10W
hot
vip
```

---

**第 8 层：播放控制区域**

```ts
Column() {
  Row() { 进度条 }
  Row() { 播放按钮 }
}
```

第一行是进度条：

```ts
Text("00:00")
Slider(...)
Text("00:00")
```

第二行是控制按钮：

```ts
ic_auto
ic_prev
ic_paused
ic_next
ic_song_list
```

点击 `ic_song_list` 会打开底部播放列表：

```ts
this.panelHeight = '50%'
this.panelOpacity = 1
```

---

**第 9 层：底部播放列表弹层**

```ts
Column() {
  Column() { 遮罩区域 }
  Column() { 播放列表内容 }
}
```

这个弹层受两个状态控制：

```ts
.height(this.panelHeight)
.opacity(this.panelOpacity)
```

默认：

```ts
panelHeight = '0%'
panelOpacity = 0
```

所以看不见。

打开后：

```ts
panelHeight = '50%'
panelOpacity = 1
```

显示在页面底部。

---

**第 10 层：播放列表内容**

播放列表内容分为两部分：

第一部分：标题栏

```ts
Row() {
  Image(ic_play)
  Text(`播放列表 (0)`)
  Image(ic_close)
}
```

关闭按钮点击后收起列表。

第二部分：歌曲列表

```ts
List() {
  ForEach(this.songs, ...)
}
```

每首歌是一个 `ListItem`。

---

**第 11 层：每一首歌的列表项**

```ts
ListItem() {
  Row() {
    Text(index + 1)
    Column() {
      Text(item.name)
      Text(item.author)
    }
    Image(ic_more)
  }
}
```

每行显示：

1. 歌曲序号
2. 歌曲名
3. 作者
4. 更多按钮

并且支持滑动删除：

```ts
.swipeAction({
  end: this.deleteButton(index)
})
```

滑动后右侧会出现：

```ts
Button('删除')
```

不过现在这个按钮还没有写删除逻辑。