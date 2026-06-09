interface recommendDailyType {
  img:string,//图
  title:string,//简介字
  type:string,//标题
  top:string,//标题背景色
  bottom:string//简介北京色
}
interface  recommendListType{
  img:string,
  title:string,
  count:string
}


@Component
//export 导出组件
export  struct Recommend {
//轮播图数据
  swiperList: string[]=[
    "https://img95.699pic.com/photo/40025/1089.jpg_wh300.jpg",
    "https://ts3.tc.mm.bing.net/th/id/OIP-C.XIXj0aGjekgz4nLE2Zv47QHaFj?rs=1&pid=ImgDetMain&o=7&rm=3",
    "https://socialbeta.oss-cn-hangzhou.aliyuncs.com/upload/4317-1584011279.png",
    "https://ts2.tc.mm.bing.net/th/id/OIP-C.eXOhfqZpNPkR6pt-6BOToAHaD0?rs=1&pid=ImgDetMain&o=7&rm=3",
    "https://ts4.tc.mm.bing.net/th/id/OIP-C.a_qT-OABcoke6doisyV5BQHaFj?rs=1&pid=ImgDetMain&o=7&rm=3"
]
  //每日推荐
  dailyRecommend:recommendDailyType[]=[
    {
    img:'https://template.canva.cn/EAGaQ2opHM4/1/0/1600w-eWjLFbRHW1s.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAUMDQBKPSGUHCALC4%2F20260607%2Fcn-north-1%2Fs3%2Faws4_request&X-Amz-Date=20260607T115546Z&X-Amz-Expires=31839&X-Amz-Signature=2528ad19f29e59b5380b5620fd927619a1283f0dec25313a170fb0f36eba4769&X-Amz-SignedHeaders=host%3Bx-amz-expected-bucket-owner&response-expires=Sun%2C%2007%20Jun%202026%2020%3A46%3A25%20GMT',
    title:'每日推荐｜今天从句号听起｜私人雷达',
    type:'每日推荐',
      top:'#152E63',
      bottom:'#FFF0C7'
  },
  {
img:'https://template.canva.cn/EAHJtHLIx70/1/0/1131w-pLSHu3fCJwM.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAUMDQBKPSGUHCALC4%2F20260606%2Fcn-north-1%2Fs3%2Faws4_request&X-Amz-Date=20260606T210805Z&X-Amz-Expires=85858&X-Amz-Signature=7be95ffce4a3c2411a41babeedb7e72b612c630fec4f1d188f7960a5f17f288e&X-Amz-SignedHeaders=host%3Bx-amz-expected-bucket-owner&response-expires=Sun%2C%2007%20Jun%202026%2020%3A59%3A03%20GMT',
    title:'每日推荐｜今天从句号听起｜私人雷达',
  type:'每日推荐',
  top:'#0B6F83',
  bottom:'#DFF6F8'
},
    {
      img:'https://template.canva.cn/EAGm1ZhJZSA/2/0/1197w-JNlPsxtzBWY.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAUMDQBKPSGUHCALC4%2F20260606%2Fcn-north-1%2Fs3%2Faws4_request&X-Amz-Date=20260606T220945Z&X-Amz-Expires=81976&X-Amz-Signature=56f6cfdf1a9d2a3a415c04708d6389b0ba2fdf1c3cf43629ed076fbbaea11a4d&X-Amz-SignedHeaders=host%3Bx-amz-expected-bucket-owner&response-expires=Sun%2C%2007%20Jun%202026%2020%3A56%3A01%20GMT',
      title:'每日推荐｜今天从句号听起｜私人雷达',
      type:'每日推荐',
      top:'#9A5A4F',
      bottom:'#F6E3DC'
    },
  {
    img:'https://template.canva.cn/EAGs1C41UCI/1/0/900w-JOUf9n4FWFM.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAUMDQBKPSGUHCALC4%2F20260607%2Fcn-north-1%2Fs3%2Faws4_request&X-Amz-Date=20260607T060258Z&X-Amz-Expires=50946&X-Amz-Signature=708a25e2f9a769cb8423785891c07ddb9819d067778290e092ba954704a619ec&X-Amz-SignedHeaders=host%3Bx-amz-expected-bucket-owner&response-expires=Sun%2C%2007%20Jun%202026%2020%3A12%3A04%20GMT',
    title:'每日推荐｜今天从句号听起｜私人雷达',
    type:'每日推荐',
    top:'#6A9F80',
    bottom:'#FFF3C9'
}
  ]
  ListRecommend:recommendListType[]=[
    {
    img:'https://template.canva.cn/EAHC-YKKf2E/1/0/1600w-67LmqCmGFc0.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAUMDQBKPSGUHCALC4%2F20260607%2Fcn-north-1%2Fs3%2Faws4_request&X-Amz-Date=20260607T144215Z&X-Amz-Expires=20454&X-Amz-Signature=195f0494cb3f3d98e5ac5f158652d27728d51af26dea7415baf09faeeb7cc505&X-Amz-SignedHeaders=host%3Bx-amz-expected-bucket-owner&response-expires=Sun%2C%2007%20Jun%202026%2020%3A23%3A09%20GMT',
    title:'春日',
    count:'22w'
  },
  {
    img:'https://template.canva.cn/EAHKYVM_Zcs/1/0/900w-g4UXyiKscx8.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAUMDQBKPSGUHCALC4%2F20260607%2Fcn-north-1%2Fs3%2Faws4_request&X-Amz-Date=20260607T065951Z&X-Amz-Expires=49058&X-Amz-Signature=11e018ad6dfb8e67932b9cd1f14abf855e8fb2193740f9c29b7da12d16dbead6&X-Amz-SignedHeaders=host%3Bx-amz-expected-bucket-owner&response-expires=Sun%2C%2007%20Jun%202026%2020%3A37%3A29%20GMT',
    title:'夏日慢也',
    count:'22w'
},
    {
      img:'https://template.canva.cn/EAG4pkpLXhE/1/0/1600w-uF5A05Hdcx8.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAUMDQBKPSGUHCALC4%2F20260607%2Fcn-north-1%2Fs3%2Faws4_request&X-Amz-Date=20260607T071015Z&X-Amz-Expires=49874&X-Amz-Signature=8c72478633d35565e42bf71c0bbb79639c5307267c61d61b8a6a300d2366bdcc&X-Amz-SignedHeaders=host%3Bx-amz-expected-bucket-owner&response-expires=Sun%2C%2007%20Jun%202026%2021%3A01%3A29%20GMT',
      title:'追忆似水流年',
      count:'22w'
    },
  {
    img:'https://template.canva.cn/EAELx0ZL4e4/2/0/1600w-BCE9NdwNnKQ.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAUMDQBKPSGUHCALC4%2F20260606%2Fcn-north-1%2Fs3%2Faws4_request&X-Amz-Date=20260606T223516Z&X-Amz-Expires=79853&X-Amz-Signature=27f2fee60f0facf577c0fe7b7fa9000d911d0c9c6c4ae08156f422779590b381&X-Amz-SignedHeaders=host%3Bx-amz-expected-bucket-owner&response-expires=Sun%2C%2007%20Jun%202026%2020%3A46%3A09%20GMT',
    title:'卿卿',
    count:'22w'
}
  ]
  @Builder  titleBuilder(title:string){
    Row(){
      Text(title)
        .fontColor('#008080')
        .fontWeight(700)
        .layoutWeight(1)
      Image($r('app.media.more'))
        .width(22)
        .fillColor('#008080')
    }
    .width('100%')
    .height(40)
  }


  build() {
    Column({space:10}){
      //搜素
      Row(){
        Image($r('app.media.fangdajing'))
          .width(22)
          .fillColor('#008080')


        TextInput({placeholder:'听啥🩷❤ 🟢️🎵'})
          .placeholderColor('#008080')
          .padding({left:5})
          .layoutWeight(1)

        Image($r('app.media.saomiao'))
          .width(22)
          .fillColor('#008080')
        //搜素




      }
      .width('100%')
      // .backgroundColor('#008080')
      .border({radius:20})
      .padding({left:8,right:8})
//轮播
      Swiper(){
        ForEach(this.swiperList,(item:string)=>{
          Image(item)
            .width('100%')
            .height(160)
            .objectFit(ImageFit.Cover)
            .border({radius:10})
        })
        //内容
      }
      .autoPlay(true)
      //每日推荐
      this.titleBuilder('每日推荐')
      List(){
        ForEach(this.dailyRecommend,(item:recommendDailyType)=>{
          ListItem(){
            Column(){
              Text(item.title)
                .width('100%')
                .height(40)
                .backgroundColor(item.top)
                .padding(5)
                .fontSize(14)
                .fontColor('#FFFFFF')
                // .backgroundColor(item.bottom)
              Image(item.img)
                .width('100%')
                .height(140)
                .objectFit(ImageFit.Cover)

            }
            .width(150)
            .height(200)
            .backgroundColor(item.bottom)
            .border({radius:10})
            .margin({right:10})
            .clip(true)
          }
        })
      }
      .height(230)
      .listDirection(Axis.Horizontal)//横向
      .scrollBar(BarState.Off)

      //爆火歌单
      this.titleBuilder('爆火歌单')
      List(){
        ForEach(this.ListRecommend,(item:recommendListType)=>{
          ListItem(){
            Column(){
              Stack({ alignContent: Alignment.TopEnd }){
                Image(item.img)
                  .width("100%")
                  .height("100%")
                  .objectFit(ImageFit.Cover)
                  .border({radius:10})

                Text(item.count)
                  .fontColor(Color.Black)
                  .fontSize(14)
              }
.padding(5)
              .border({radius:10})
              .width(100)
              .height(100)

              Text(item.title)
                .fontColor('#008080')
                .fontSize(14)
            }

          }

        })
      }
      .height(120)
      .scrollBar(BarState.Off)
      .listDirection(Axis.Horizontal)
    }
    .width('100%')
    .height('100%')
    .padding({left:10,right:10,top:5,bottom:5})

  }
}