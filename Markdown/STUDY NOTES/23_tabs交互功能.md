索引靠

点击菜单会改颜色

v2组件-》local状态
菜单索引初始
0@Builder//封装复用传递
tabBuilder(item : TabClass,index:number) {
? : (条件表达式来更新状态)


Image(item.icon)
.width(24)
.fillColor(this.currentIndex==index?Color.Black:Color.White)//菜单索引
Text(item.text)
.fontSize(this.currentIndex==index?Color.Black:Color.White)

ets实现什么功能呢-》tab content的内容，渲染