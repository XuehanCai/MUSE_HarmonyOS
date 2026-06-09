import { SongItemType } from "./music"

@ObservedV2

export class GlobalMusic{
 @Trace img:string = ''
 @Trace name:string = ''
 @Trace author:string = ''
 @Trace url:string = ''
 @Trace time:number = 0//播放时间
 @Trace duration:number = 0//播放总时长

  //歌曲列表
  @Trace playIndex :number= 0//当前索引
  @Trace playList :SongItemType[] =[]//播放列表

  //播放暂停
  @Trace isPlay:boolean = false //bofang

  //播放模式
  @Trace playMode:'auto'|'random'|'repeat' = 'auto'

}