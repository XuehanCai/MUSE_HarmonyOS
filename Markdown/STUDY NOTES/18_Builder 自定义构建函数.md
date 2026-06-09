重复使用的UI元素

@Builder
自定义构建函数名（参数列表）{
    要重复的组件结构
}
this.自定义构建函数名（数据列表1）
this.自定义构建函数名（数据列表2）
1
.layoutWeight(1)//不居中
2 builder 可以在组件里面




@Entry
@ComponentV2
struct Index {
@Builder titleBuilder (title:string){

    Row(){
      Text(title)
        .fontColor('#fff')
        .fontWeight(700)
        .layoutWeight(1)
      Image($r('app.media.more'))
        .width(22)
        .fillColor('#fff')

    }
    .width('100%')
    .height(50)
}


build() {
Column(){
this.titleBuilder('每日推荐')
this.titleBuilder('流行歌单')
}


    .width('100%')
    .height('100%')
    .backgroundColor('#131313')
    .padding({left:10,right:10})
}
}