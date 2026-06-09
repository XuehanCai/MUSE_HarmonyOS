
# Tabs 底部导航栏

## 场景

一个 App 里有多个界面功能，比如：

- 推荐
- 发现
- 动态
- 我的

这时候可以用 `Tabs` 做底部菜单切换。

## 解决

使用 `Tabs` 菜单。

```ts
Tabs({ barPosition: BarPosition.End }) {
}
```

说明：

```text
barPosition: BarPosition.End = 菜单在底部
```

## 多个界面功能

每一个 `TabContent` 代表一个界面。

```ts
Tabs({ barPosition: BarPosition.End }) {
  TabContent() {
    Text('推荐内容')
  }
  .tabBar('推荐')

  TabContent() {
    Text('我的内容')
  }
  .tabBar('我的')
}
```

## 不写死 tabBar 文字

如果只写文字：

```ts
.tabBar('推荐')
```

只能显示简单文字。

如果想显示图片 + 文字，就需要自定义导航栏。

## 自定义导航栏

用 `@Builder` 封装菜单样式。

```ts
@Builder
tabBuilder(item: TabClass) {
  Column({ space: 5 }) {
    Image(item.icon)
      .width(24)

    Text(item.text)
      .fontSize(14)
  }
}
```

## 数据

先准备菜单数据：

```ts
interface TabClass {
  text: string
  icon: ResourceStr
}

tabData: TabClass[] = [
  { text: '推荐', icon: $r('app.media.yinle') },
  { text: '发现', icon: $r('app.media.faxian') },
  { text: '动态', icon: $r('app.media.dongtai') },
  { text: '我的', icon: $r('app.media.wode') }
]
```

## 融合使用

用 `ForEach` 循环数据，生成多个 `TabContent`。

```ts
Tabs({ barPosition: BarPosition.End }) {
  ForEach(this.tabData, (item: TabClass) => {
    TabContent() {
      Text('内容')
    }
    .tabBar(this.tabBuilder(item))
  })
}
```

## 完整结构

```ts
interface TabClass {
  text: string
  icon: ResourceStr
}

@Component
struct Layout {
  tabData: TabClass[] = [
    { text: '推荐', icon: $r('app.media.yinle') },
    { text: '发现', icon: $r('app.media.faxian') },
    { text: '动态', icon: $r('app.media.dongtai') },
    { text: '我的', icon: $r('app.media.wode') }
  ]

  @Builder
  tabBuilder(item: TabClass) {
    Column({ space: 5 }) {
      Image(item.icon)
        .width(24)

      Text(item.text)
        .fontSize(14)
    }
  }

  build() {
    NavDestination() {
      Tabs({ barPosition: BarPosition.End }) {
        ForEach(this.tabData, (item: TabClass) => {
          TabContent() {
            Text('内容')
          }
          .tabBar(this.tabBuilder(item))
        })
      }
    }
  }
}
```

## 记忆点

- 多个界面功能用 `Tabs`
- 一个 `TabContent` 代表一个界面
- `.tabBar()` 设置底部菜单
- 只写文字用 `.tabBar('推荐')`
- 图片 + 文字菜单用 `@Builder`
- 多个菜单不要写死，可以用 `ForEach`
- `tabData` 放数据
- `tabBuilder` 放菜单样式
