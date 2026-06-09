@Builder
export function StartBuilder() {
  Start()
}

@Component
struct Start {
  pathStack: NavPathStack = new NavPathStack()//跳对象控制
  aboutToAppear(): void {
    setTimeout(() => {
      this.pathStack.replacePathByName("layout",null,false)//不允许返回

    },3000)
  }

  build() {
    NavDestination() {
      Stack({alignContent:Alignment.TopEnd}){
        Image($r('app.media.ad'))
          .width('100%')
          .height('100%')
          .expandSafeArea([SafeAreaType.SYSTEM],[SafeAreaEdge.TOP,SafeAreaEdge.BOTTOM])
      Button('跳过').fontColor(Color.Black)
        .margin(15)
        .backgroundColor(Color.White)
        .onClick(()=>{
              this.pathStack.replacePathByName("layout",null,false)//不允许返回

        })

      }
      // Text('广告')
      // Button('点击跳转布局页')
      //   .onClick(()=>{
      //     this.pathStack.pushPathByName("Layout",null,false)
      //   })
    }

    .onReady((context: NavDestinationContext) => {
      this.pathStack = context.pathStack
    })
  }
}