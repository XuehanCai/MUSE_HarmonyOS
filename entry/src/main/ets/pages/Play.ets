import { GlobalMusic } from "../models/globalMusic"
import { SongItemType } from "../models/music"
import { AppStorageV2 } from "@kit.ArkUI"
import { playerManager } from "../utils/AvPlayerManager"

// 跳转页面入口函数
@Builder
export function PlayBuilder() {
  Play()
}

@ComponentV2
struct Play {
  @Local panelHeight: string = '0%'//播放列表
  @Local panelOpacity: number = 0
  pathStack : NavPathStack = new NavPathStack();

  songs:SongItemType[]=[

    {
      img: 'https://img2.kuwo.cn/star/albumcover/300/60/29/927119208.jpg',
      name: '明天，你好',
      author: '牛奶咖啡',
      url: 'file:///Users/chuchen/Downloads/2225332648.mp3',
      id: '000'
    },

    {
      img: 'https://img4.kuwo.cn/star/albumcover/500/62/23/789477357.jpg',
      name: '爱爱爱',
      author: '方大同',
      url: 'file:///Users/chuchen/Downloads/M800003TYEbK05gkAo.mp3',
      id: '001'
    },

    {
      img: 'https://img1.kuwo.cn/star/albumcover/500/s3s57/83/3148775323.jpg',
      name: '后来',
      author: '刘若英',
      url: 'file:///Users/chuchen/Downloads/M800000gIZOH1tq8pT.mp3',
      id: '002'
    },

    {
      img: 'https://img2.kuwo.cn/star/albumcover/300/18/30/4145997874.jpg',
      name: '百年孤寂',
      author: '王菲',
      url: 'file:///Users/chuchen/Downloads/2844609484.mp3',
      id: '003'
    },

    {
      img: 'https://img2.kuwo.cn/star/albumcover/300/68/72/2753879731.jpg',
      name: '爱人错过',
      author: '告五人',
      url: 'file:///Users/chuchen/Downloads/M800003yLOE5425rTa.mp3',
      id: '004'
    },
    {
      img: 'https://img2.kuwo.cn/star/albumcover/300/13/96/2012123181.jpg',
      name: '是风动',
      author: '银临',
      url: 'file:///Users/chuchen/Downloads/M800001gH5Ib2tlFDh.mp3',
      id: '005'
    },

    {
      img: 'https://img2.kuwo.cn/star/albumcover/300/61/37/2297132086.jpg',
      name: '身骑白马',
      author: '徐佳莹',
      url: 'file:///Users/chuchen/Downloads/M8000031mx9F4YRRPR.mp3',
      id: '006'
    },
    {
      img: 'https://img2.kuwo.cn/star/albumcover/300/s3s77/92/3131515073.jpg',
      name: '麦恩莉',
      author: '方大同',
      url: 'file:///Users/chuchen/Downloads/M800000rXuqf1LUumT.mp3',
      id: '007'
    },
    {
      img: 'https://img2.kuwo.cn/star/starheads/500/s4s72/70/1501767509.jpg',
      name: 'One Last Kiss',
      author: '宇多田ヒカル',
      url: 'file:///Users/chuchen/Downloads/M80000415j4k2zUAYB.mp3',
      id: '008'
    },
    {
      img: 'https://img3.kuwo.cn/star/albumcover/500/13/73/1786326054.jpg',
      name: '爱如潮水',
      author: '张信哲',
      url: 'https://car-bj.kuwo.cn/9d236d9a88776dcd4c86f8bc294ab4f1/6a2430db/lx/resource/n1/79/48/288144712.mp3?from=vip',
      id: '009'
    },
    {
      img: 'https://img2.kuwo.cn/star/albumcover/300/88/97/1904385487.jpg',
      name: '允许部分艺术家富起来',
      author: '二手玫瑰乐队',
      url: 'file:///Users/chuchen/Downloads/M800002IN2Zv0Y3tQt.mp3',
      id: '010'
    },
    {
      img: 'http://img4.kuwo.cn/star/albumcover/500/12/28/3566390289.jpg',
      name: '小半',
      author: '陈粒',
      url: 'https://car-bj.kuwo.cn/3239c8afb11ed146d3257f8aae89a236/6a243186/rh/resource/n3/34/49/2566671236.mp3?from=vip',
      id: '011'
    }

  ]
  // 当前播放的歌曲
  @Local
  // playState:SongItemType = this.songs[0]
  playState:GlobalMusic =AppStorageV2.connect(GlobalMusic,'SONG_KEY',()=>new GlobalMusic())!
  number2time(number: number) {
    // 毫秒 → 秒 → 分+秒; 先判断是否大于1分钟
    if (number > 60 * 1000) {
      const s = Math.floor(number/1000%60)
      const m = Math.floor(number/1000/60)
      const second = s.toString().padStart(2, '0')
      const minute = m.toString().padStart(2, '0')
      return minute + ':' + second
    } else {
      const s = Math.floor(number/1000%60)
      const second = s.toString().padStart(2, '0')
      return '00:' + second
    }
  }

  build() {
    NavDestination() {
      Stack({ alignContent: Alignment.Bottom }){
        // 播放
        Stack() {
          // 变色背景
          Image(this.playState.img)
            .width('100%')
            .height('100%')
            .blur(1000)
            .expandSafeArea([SafeAreaType.SYSTEM], [SafeAreaEdge.TOP, SafeAreaEdge.BOTTOM])

          // 内容
          Column(){
            Column(){


              //唱片
              Stack({alignContent:Alignment.Top}){//重叠
                //CD,封面
                Row(){
                  Row(){
                    Image(this.playState.img)
                      .width('70%')
                      .borderRadius(400)

                      // .backgroundImage($r('app.media.ic_cd'))
                  }
                  .backgroundImage($r('app.media.ic_cd'))
                  .backgroundImageSize(ImageSize.Cover)//铺满
                    .justifyContent(FlexAlign.Center)
                    .width('100%')
                    .borderRadius(400)//圆角大
                    .clip(true)//裁剪剩下的
                    .aspectRatio(1)//1:1

                }
                .margin({top:50})

              }
              //歌名作者
              Column({ space: 8 }) {
                Text(this.playState.name)
                  .fontSize(28)
                  .fontWeight(FontWeight.Bold)
                  .fontColor(Color.White)
                Text(this.playState.author)
                  .fontSize(18)
                  .fontColor(Color.White)
              }
              .justifyContent(FlexAlign.Center)
              .layoutWeight(1)

              //点赞,评论，下载，转发
              Row(){
                Badge({value:'99+',style:{badgeSize:9,badgeColor: '#a8ff3131'}}){
                  Image($r('app.media.like'))
                    .width(24)
                    .fillColor(Color.Gray)
                }
                Badge({value:'99+',style:{badgeSize:9,badgeColor: '#a8ff3131'}}){
                  Image($r('app.media.pinglun'))
                    .width(24)
                    .fillColor(Color.Gray)
                }
                Badge({value:'',style:{badgeSize:5,badgeColor: '#a8ff3131'}}){
                  Image($r('app.media.xiazai'))
                    .width(24)
                    .fillColor(Color.Gray)
                }
                Badge({value:'',style:{badgeSize:5,badgeColor: '#a8ff3131'}}){
                  Image($r('app.media.zhuanfa'))
                    .width(24)
                    .fillColor(Color.Gray)
                }


              }
              .width('100%')
              .justifyContent(FlexAlign.SpaceAround)

              //进度条
              Column(){
                Row(){
                  Text(this.number2time(this.playState.time))
                    .fontSize(12)
                    .fontColor(Color.White)
                  Slider({
                    min:0,
                    max:this.playState.duration,
                    value:this.playState.time
                  })
                    .layoutWeight(1)
                    .selectedColor(Color.White)
                    .trackColor('#ccc5c5c5')//播完
                    .trackThickness(1)//线条
                    .blockColor(Color.Gray)
                    .onChange((value)=>{
                      playerManager.seekPlay(value)

                    })//滑
                  Text(this.number2time(this.playState.duration))
                    .fontSize(12)
                    .fontColor(Color.White)

                }
                .margin({left:10,right:10})

                Row(){
                  if(this.playState.playMode=='auto'){
                    Image($r('app.media.xunhuan'))
                      .width(30)
                      .colorFilter(Color.White)
                      .onClick(()=>{
                        this.playState.playMode='random'
                      })
                  }
                  else if(this.playState.playMode=='random'){
                    Image($r('app.media.suijibofang'))
                      .width(30)
                      .colorFilter(Color.White)
                      .onClick(()=>{
                        this.playState.playMode='repeat'
                      })
                  }else{
                    Image($r('app.media.danquxunhuan'))
                      .width(30)
                      .colorFilter(Color.White)
                      .onClick(()=>{
                        this.playState.playMode='auto'
                      })
                  }

                  Image($r('app.media.shangyishou'))
                    .width(30)
                    .colorFilter(Color.White)
                    .onClick(()=>{
                      playerManager.prevPlay()
                    })
                  //播放
                  // Image($r('app.media.bofang'))
                    Image(this.playState.isPlay ? $r('app.media.bofang'):$r('app.media.zanting'))
                    .width(50)
                    .colorFilter(Color.White)
                      .onClick(()=>{//三元表达式？：
                        this.playState.isPlay?playerManager.pause():playerManager.singPlay(this.playState.playList[this.playState.playIndex])
                      })


                  Image($r('app.media.xiayishou'))
                    .width(30)
                    .colorFilter(Color.White)
                    .onClick(()=>{
                      playerManager.nextPlay()
                    })

                  Image($r('app.media.liebiao'))
                    .width(30)
                    .colorFilter(Color.White)
                    .onClick(()=>{
                      this.panelHeight = '50%'
                      this.panelOpacity = 1
                    })

                }

                .justifyContent(FlexAlign.SpaceAround)
                .width("100%")
                .padding({bottom:24})
              }

            }
          }
          .height('100%')


          }
          //播放列表
          Column() {
            Column() {

            }
            .width('100%')
            .layoutWeight(1)
            .backgroundColor('#66000000')
            .onClick(() => {
              this.panelHeight = '0%'
              this.panelOpacity = 0
            })

            Column() {
              Row() {
                Image($r('app.media.bofang'))
                  .fillColor('#008080')
                  .width(30)

                Text(`播放列表 (${this.songs.length})`)
                  .layoutWeight(1)
                  .margin({ left: 10 })
                  .fontSize(18)
                  .fontColor('#F5F5F5')

                Image($r('app.media.shouqi'))
                  .width(20)
                  .fillColor('#A8A8A8')
                  .onClick(() => {
                    this.panelHeight = '0%'
                    this.panelOpacity = 0
                  })
              }
              .backgroundColor('#F02B2B2B')
              .width('100%')
              .padding(12)

              List() {
                ForEach(this.playState.playList, (item: SongItemType, index: number) => {
                  ListItem() {
                    Row({ space: 14 }) {
                      Image(item.img)
                        .width(58)
                        .height(58)
                        .borderRadius(8)

                      Column({ space: 4 }) {
                        Text(item.name)
                          .fontSize(16)
                          .fontWeight(FontWeight.Medium)
                          .fontColor('#F5F5F5')
                          .maxLines(1)
                          .textOverflow({ overflow: TextOverflow.Ellipsis })

                        Text(item.author)
                          .fontSize(13)
                          .fontColor('#A8A8A8')
                          .maxLines(1)
                          .textOverflow({ overflow: TextOverflow.Ellipsis })
                      }
                      .layoutWeight(1)
                      .alignItems(HorizontalAlign.Start)
                      .justifyContent(FlexAlign.Center)

                      Image($r('app.media.more'))
                        .width(22)
                        .fillColor('#8A8A8A')
                    }
                    .width('100%')
                    .height(76)
                    .padding({ left: 16, right: 16 })
                    .backgroundColor('#D91F1F1F')
                  }
                })
              }
              .layoutWeight(1)
              .backgroundColor('#F01F1F1F')
            }
            .height(430)
            .width('100%')
            .backgroundColor('#F01F1F1F')
            .borderRadius({
              topLeft: 18,
              topRight: 18
            })
            .clip(true)
          }
          .height(this.panelHeight)
          .opacity(this.panelOpacity)
          .expandSafeArea([SafeAreaType.SYSTEM], [SafeAreaEdge.BOTTOM])
          .backgroundColor('#E6252525')
          .animation({
            duration: 300
          })
        }
        .width('100%')
        .height('100%')
        .backgroundColor(Color.Transparent)


        // 列表


    }
    .onReady((context: NavDestinationContext) => {
      this.pathStack = context.pathStack
    })
    .hideTitleBar(true)  // 隐藏标题栏
  }
}
