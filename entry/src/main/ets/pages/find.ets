import { SongItemType } from "../models/music";
import { AppStorageV2 } from "@kit.ArkUI";//全局共享
import { playerManager } from "../utils/AvPlayerManager";
import { GlobalMusic } from "../models/globalMusic";

@ComponentV2
  //export 导出组件

export  struct Find {
  songs:SongItemType[]=[

    {
      img: 'https://img2.kuwo.cn/star/albumcover/300/60/29/927119208.jpg',
      name: '明天，你好',
      author: '牛奶咖啡',
      url: 'https://videotourl.com/audio/1780838202666-7bdaa707-7d5f-4ef1-98be-faf329ee631e.mp3',
      id: '000'
    },

    {
      img: 'https://img4.kuwo.cn/star/albumcover/500/62/23/789477357.jpg',
      name: '爱爱爱',
      author: '方大同',
      url: 'https://videotourl.com/audio/1780841017948-245dc7c4-a1b4-42dc-8842-e76aef90c113.mp3',
      id: '001'
    },

    {
      img: 'https://img1.kuwo.cn/star/albumcover/500/s3s57/83/3148775323.jpg',
      name: '后来',
      author: '刘若英',
      url: 'https://videotourl.com/audio/1780841237609-e05bf2ed-2144-4d20-8cb2-7ec25dccdbab.mp3',
      id: '002'
    },

    {
      img: 'https://img2.kuwo.cn/star/albumcover/300/18/30/4145997874.jpg',
      name: '百年孤寂',
      author: '王菲',
      url: 'https://videotourl.com/audio/1780841502280-fa89d44d-93b8-4579-a9f6-116bf5b70570.mp3',
      id: '003'
    },

    {
      img: 'https://img2.kuwo.cn/star/albumcover/300/68/72/2753879731.jpg',
      name: '爱人错过',
      author: '告五人',
      url: 'https://videotourl.com/audio/1780841525408-cbe06262-6541-413e-ad82-7e6b0bff43c1.mp3',
      id: '004'
    },
    {
      img: 'https://img2.kuwo.cn/star/albumcover/300/13/96/2012123181.jpg',
      name: '是风动',
      author: '银临',
      url: 'https://videotourl.com/audio/1780841569638-295f3a5b-2b36-4b3d-81be-4828377904ab.mp3',
      id: '005'
    },

    {
      img: 'https://img2.kuwo.cn/star/albumcover/300/61/37/2297132086.jpg',
      name: '身骑白马',
      author: '徐佳莹',
      url: 'https://videotourl.com/audio/1780841590281-e4ae1a86-89d0-4e78-b6b1-41c6ff469150.mp3',
      id: '006'
    },
    {
      img: 'https://img2.kuwo.cn/star/albumcover/300/s3s77/92/3131515073.jpg',
      name: '麦恩莉',
      author: '方大同',
      url: 'https://videotourl.com/audio/1780841547081-00b58d83-7a02-4770-b99f-691b5edac9eb.mp3',
      id: '007'
    },
    {
      img: 'https://img2.kuwo.cn/star/starheads/500/s4s72/70/1501767509.jpg',
      name: '最后一吻',
      author: '宇多田ヒカル',
      url: 'https://videotourl.com/audio/1780841637016-512c296b-59ed-4d69-b74d-94c2bd55c290.mp3',
      id: '008'
    },
    {
      img: 'https://img3.kuwo.cn/star/albumcover/500/13/73/1786326054.jpg',
      name: '爱如潮水',
      author: '张信哲',
      url: 'https://videotourl.com/audio/1780841658381-ab70f870-1bcf-49ec-9fc4-a20364cf82b7.mp3',
      id: '009'
    },
    {
      img: 'https://img2.kuwo.cn/star/albumcover/300/88/97/1904385487.jpg',
      name: '允许部分艺术家先富起来',
      author: '二手玫瑰乐队',
      url: 'https://videotourl.com/audio/1780841686780-7b104bfc-5e3b-46c0-b877-35d757ab7417.mp3',
      id: '010'
    },
    {
      img: 'https://videotourl.com/audio/1780841705106-76e39e3e-9f76-4e1c-9d2a-0e01864fab75.mp3',
      name: '小半',
      author: '陈粒',
      url: 'https://car-bj.kuwo.cn/9d73bf1864391a07a15a9656b3787a8c/6a21511d/rh/resource/n3/34/49/2566671236.mp3',
      id: '011'
    }

  ]
  pathStack: NavPathStack = AppStorageV2.connect(NavPathStack,'navStack',() => new NavPathStack())!

  @Local
  // playState:SongItemType = this.songs[0]
  playState:GlobalMusic =AppStorageV2.connect(GlobalMusic,'SONG_KEY',()=>new GlobalMusic())!

  build() {
    Column() {
      Text('猜你喜欢')
        .fontColor('#fff')
        .width('100%')
        .margin({ bottom: 10 })

      List() {
        ForEach(this.songs,(item:SongItemType,index:number)=>{
          ListItem() {
            Row() {
              //图片+stack
              Stack() {
                Image(item.img)
                  .width(80)
                  .border({ radius: 5 })
                  .margin({ right: 10 })
                  .onClick(async ()=>{
                    await playerManager.singPlay(item)
                    this.pathStack.pushPathByName('Play',null,false)

                  })
                // Image($r('app.media.wave'))
                //   .width(24)
                //条件渲染 从全局拿currentsong url和isplay
                if(this.playState.url==item.url && this.playState.isPlay){
                  Image($r('app.media.wave'))
                    .width(24)
                }
              }

              Column() {
                Text(item.name)
                  .fontColor('#FEFEFE')
                  .fontSize(20)
                  .fontWeight(700)
                  .margin({ bottom: 10 })

                Row() {
                  Text('VIP')
                    .fontColor('#9A8E28')
                    .border({ width: 1, color: '#9A8E28', radius: 12 })
                    .padding({
                      left: 5,
                      right: 5,
                      top: 5,
                      bottom: 5
                    })
                    .margin({ right: 15 })

                  Text(item.author)
                    .fontColor('#696969')
                }
              }
              .alignItems(HorizontalAlign.Start)
              .layoutWeight(1) //填充

              Image($r('app.media.more'))
                .width(24)
                .fillColor('#FEFEFE')
            }
            .width('100%')
            .height(80)
            .backgroundColor(Color.Black)
            .margin({ bottom: 15 })

            // .onClick(()=>{
            //   this.playIndex =Index//点谁谁为Index，然后播放
          // })
          }
        })

      }
      .scrollBar(BarState.Off)
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#131313')
    .padding({ left: 5, right: 10 })
    .expandSafeArea([SafeAreaType.SYSTEM],[SafeAreaEdge.TOP,SafeAreaEdge.BOTTOM])


  }

}