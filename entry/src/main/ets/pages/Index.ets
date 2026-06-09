import {AppStorageV2 }from '@kit.ArkUI'
// Index.ets
@Entry
@ComponentV2
struct NavigationExample {
  pathStack: NavPathStack = AppStorageV2.connect(NavPathStack,'navStack',() => new NavPathStack())!
  //!非空

  // pathStack: NavPathStack = new NavPathStack();

  build() {
    Navigation(this.pathStack) {

    }.title('广告')
    .onAppear(()=>{
      this.pathStack.pushPathByName("Start",null,false)
    })
    .hideNavBar(true)//隐藏导航条 返回的时候不去导航页
  }
}