import { Find } from "./find"
import { Recommend } from "./Recommend"//导入

interface TabClass{
  text : string,
  icon : ResourceStr
}
@Builder
export function layoutBuilder() {
  Layout()
}//传递



@ComponentV2
struct Layout {
  @Local currentIndex:number = 0 //初始状态为0
  pathStack: NavPathStack = new NavPathStack()//跳对象控制
  tabData : TabClass[] = [
    {text:'推荐',icon : $r('app.media.yinle')},
    {text:'发现',icon : $r('app.media.faxian')}
  ]
  @Builder//封装复用传递
   tabBuilder(item : TabClass,index:number) {
    Column({space : 5}){
    Image(item.icon)
      .width(24)
      .fillColor(this.currentIndex==index?Color.White:Color.Black)//菜单索引
    Text(item.text)
      .fontSize(this.currentIndex==index?Color.White:Color.Black)


  }
  .padding(13)

}

  build() {
    NavDestination() {
      Tabs({barPosition:BarPosition.End}){
        ForEach(this.tabData,(item : TabClass,index : number)=>{//index在这
          TabContent(){
            if (this.currentIndex==0){//条件渲染
              Recommend()
            }else if(this.currentIndex==1){
              Find()
            }
          }
          .background(Color.White)
          .tabBar(this.tabBuilder(item,index))

          //菜单 自定义导航栏 @builder定义
        })

      }.backgroundColor('#008080')
      .onChange((index:number)=>{
        this.currentIndex = index
      })//点击or滑动切换当前Index !!!!!!!!!!!


    }
    // .title('布局')
    .expandSafeArea([SafeAreaType.SYSTEM],[SafeAreaEdge.TOP,SafeAreaEdge.BOTTOM])
    
    .onReady((context: NavDestinationContext) => {
      this.pathStack = context.pathStack
    })

  }
}