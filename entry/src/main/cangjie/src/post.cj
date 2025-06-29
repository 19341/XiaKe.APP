/**
 * Created on 2025/5/6
 */
package ohos_app_cangjie_entry
import cj_res_entry.app
internal import ohos.base.*
internal import ohos.component.*
internal import ohos.state_manage.*
import ohos.state_macro_manage.*
import ohos.hiappevent.Event
import ohos.router.*
import std.collection.ArrayList
import ohos_app_cangjie_entry.component.*

@CustomDialog
class MyDialog1 {
    var controller: Option<CustomDialogController> = Option.None
    func build() {
         Row(60) {
            List(space:20){
                ListItem(){
                    Image(@r(app.media.app_icon)).width(15.percent)
                }
                ListItem(){
                    Image(@r(app.media.app_icon)).width(15.percent)
                }
                ListItem(){
                    Image(@r(app.media.app_icon)).width(15.percent)
                }
                ListItem(){
                    Image(@r(app.media.app_icon)).width(15.percent)
                }
            }.listDirection(Axis.Horizontal).alignListItem(ListItemAlign.Center)
        }.height(500.px)
    }
}

@Entry
@Component
class post{
    var scroller: Scroller = Scroller()
    var dialogController: CustomDialogController = CustomDialogController(CustomDialogControllerOptions(builder: MyDialog2()))
    @Builder
    public func Avatar(src!: CJResource, size!: Int64 = 50) {
    Image(src).width(size).height(size).borderRadius(size / 2)
}
    //一条评论
    @Builder
    func comment(
          src!: CJResource,
          name!: String,
          msg!: String,
          time!: String

        )
    {
        Row() {
      Avatar(src: src, size: 40)

      Column() {
        Row() {
          Text(name).fontSize(18).textOverflow(TextOverflow.Ellipsis)
          .maxLines(1).layoutWeight(1)

          Text(time).fontSize(12)
          .width(80).textAlign(TextAlign.End)
        }.justifyContent(FlexAlign.Center).alignItems(VerticalAlign.Bottom)
        .margin(bottom: 5)
        Row() {
          Text(msg).fontSize(14)
          .textOverflow(TextOverflow.Ellipsis)
          .maxLines(1).layoutWeight(1)

//          MBadge(count: count)
        }.justifyContent(FlexAlign.Center).alignItems(VerticalAlign.Center)
      }.layoutWeight(1).margin(left: 10)
    }.width(92.percent).padding(top: 10, bottom: 10)
    .margin(top: 5)

    }
    //评论列表
    @Builder
    func comments(){
        List(space:5) {
                ListItem() {this.comment(src:@r(app.media.app_icon),name:"Robert",msg:"下次带朋友去",time:"8:31")}
                ListItem() {this.comment(src:@r(app.media.post2),name:"Jenny",msg:"好玩设施齐全",time:"7:31")}
                ListItem() {this.comment(src:@r(app.media.app_icon),name:"猪猪侠",msg:"good!",time:"6:31")}
                ListItem() {this.comment(src:@r(app.media.app_icon),name:"fcc",msg:"lalala",time:"0:31")}
                ListItem() {this.comment(src:@r(app.media.app_icon),name:"fcc",msg:"lalala",time:"0:31")}
                ListItem() {this.comment(src:@r(app.media.app_icon),name:"fcc",msg:"lalala",time:"0:31")}
                ListItem() {this.comment(src:@r(app.media.app_icon),name:"fcc",msg:"lalala",time:"0:31")}


        }.width(95.percent)
    }

    func build(){
        Column(){
            Scroll(this.scroller){
                    Column(){
                    Row(){
                        Image(@r(app.media.back))
                        .height(5.percent)
                        .margin(right:250)
                        .width(10.percent)
                        .onClick {evt => Router.back()}
                        Image(@r(app.media.export))
                        .height(4.percent)
                        .width(8.percent)
                        .margin(right:10)
                        .onClick {evt => dialogController.`open`()}
                    }
                    swiper1()

                    Column(){
                        Text("迷人的爱妮岛").fontSize(32).fontWeight(W600)
                        Text("菲律宾,巴拉望省·⭐ 4.5/5").fontSize(16).margin(top:15,bottom:5)
                        Text("4条线路 · 10个打卡点").fontSize(16).margin(bottom:10)

                    }.width(90.percent).alignItems(HorizontalAlign.Start)
                    Line().height(1).width(100.percent).backgroundColor(0x9f9f9f).opacity(0.1).margin(top:15,bottom:20)
                        Row(){
                            Column(){
                                Text(){
                                    Span("13.7").fontSize(30).fontWeight(W600)
                                    Span("km").fontSize(16).fontWeight(W600)
                                }
                                Text(" 总距离").fontSize(16).margin(top:5)
                            }.alignItems(HorizontalAlign.Start).margin(right:40)

                            Column(){
                                Text(){
                                    Span("291").fontSize(30).fontWeight(W600)
                                    Span("m").fontSize(16).fontWeight(W600)
                                }
                                Text("高度上升").fontSize(16).margin(top:5)
                            }.alignItems(HorizontalAlign.Start).margin(right:70)
                        }.justifyContent(FlexAlign.Start).width(90.percent).margin(bottom:25)

                        Text("爱妮岛位于菲律宾巴拉望省西北部，距马尼拉约430公里。游客可从马尼拉飞往公主港，再转车前往爱妮岛。岛上有45个岛屿，以清澈海水和石灰岩岛屿闻名。旅游线路有A、B、C、D四条，A线包括大小泻湖和清水岛，C线有直升机岛和神秘海滩。爱妮岛属热带气候，全年温暖，11月至次年4月是旅游旺季。")
                        .width(88.percent).fontSize(16).lineHeight(28)
                        Line().height(1).width(100.percent).backgroundColor(0x9f9f9f).opacity(0.1).margin(top:25,bottom:20)
                    Column(){
                        Text(){
                            Span("评论").fontSize(25).fontWeight(W400)
                            Span("(50)").fontSize(16)
                        }
                        this.comments()
                    }.alignItems(HorizontalAlign.Start).margin(left:10)
                }




}

        }
    }
}
