import { media } from '@kit.MediaKit'
import { GlobalMusic } from '../models/globalMusic'
import { SongItemType } from '../models/music'
import { AppStorageV2 } from '@kit.ArkUI'

class AvPlayerManager{
  //属性和方法
  player:media.AVPlayer|null = null
  isInit:boolean = false

  //共享播放数据
  currentSong:GlobalMusic = AppStorageV2.connect(GlobalMusic,'SONG_KEY',()=> new GlobalMusic())!

  //定义方法，播放器建立和坚挺

  async  init(){
    if(!this.player){
      this.player =await media.createAVPlayer()
    }
    this.player.on('stateChange',(state)=>{
      if (state=='initialized') {
        this.player?.prepare()//准备资源

      }else if(state=='prepared'){
        this.player?.play()//非null
        this.currentSong.isPlay = true
      }else if(state=='completed'){
        this.nextPlay(true)//自动下一首
      }

    })
    //时间变化
    this.player.on('durationUpdate',(duration)=>{
      this.currentSong.duration = duration
    })
    this.player.on('timeUpdate',(time)=>{
      this.currentSong.time = time
    })
  }

  singPlay(song:SongItemType){
    //是否在列表 ->some 至少一个符合条件
   const inList = this.currentSong.playList.some(item =>item.id===song.id)
    if(inList){
       if(this.currentSong.url==song.url){
         this.player?.play()
         this.currentSong.isPlay = true

       }else{
        //
         this.currentSong.playIndex = this.currentSong.playList.findIndex(item=>item.id==song.id)
         this.changeSong()

      }
    }else {//切割
      this.currentSong.playList.unshift(song)//加歌到列表，切割
      this.currentSong.playIndex = 0
      //
      this.changeSong()

    }
  }
  // //接收url地址,有歌
  // async  singPlay(song:SongItemType){
  //   await this.init()
  //
  //   this.player!.url =song.url
  //   this.currentSong.img = song.img
  //   this.currentSong.name = song.name
  //   this.currentSong.author = song.author
  //
  // }

  //切割
 async  changeSong(){
   await this.player?.reset()

   this.currentSong.duration=0
   this.currentSong.time = 0
   this.currentSong.img =this.currentSong.playList[this.currentSong.playIndex].img
   this.currentSong.author =this.currentSong.playList[this.currentSong.playIndex].author
   this.currentSong.name =this.currentSong.playList[this.currentSong.playIndex].name
   this.currentSong.url =this.currentSong.playList[this.currentSong.playIndex].url
   this.player!.url = this.currentSong.url//?

  }

  //跳转进度
  seekPlay(value:number){
    this.player?.seek(value)
  }

  //暂停
  pause(){
    this.player?.pause()
    this.currentSong.isPlay = false
  }
  //上
  prevPlay(){
    if(this.currentSong.playMode=='random'){
      this.currentSong.playIndex = Math.floor(Math.random()*this.currentSong.playList.length)//随机小数
    }else {
    this.currentSong.playIndex--
    if(this.currentSong.playIndex<0){
      this.currentSong.playIndex = this.currentSong.playList.length-1
    }}
    this.singPlay(this.currentSong.playList[this.currentSong.playIndex])
  }
  //下
  //播放模式不同也会影响1.repeat重复自动下一首,2.romdom索引,3.auto++即可
  nextPlay(autoNextPlay?:boolean){//客串可不穿
    if(this.currentSong.playMode=='repeat'&&autoNextPlay){//真的重复
      this.currentSong.playIndex = this.currentSong.playIndex
    }
    else if(this.currentSong.playMode=='random'){
      this.currentSong.playIndex = Math.floor(Math.random()*this.currentSong.playList.length)//随机小数
    }
    else{
      this.currentSong.playIndex++
      if(this.currentSong.playIndex>=this.currentSong.playList.length){
        this.currentSong.playIndex = 0
      }}

    this.singPlay(this.currentSong.playList[this.currentSong.playIndex])


  }
}

export const  playerManager:  AvPlayerManager=new AvPlayerManager()//存对象，有用导出