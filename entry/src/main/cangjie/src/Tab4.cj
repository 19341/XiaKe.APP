/**
 * Created on 2025/5/5
 */
package ohos_app_cangjie_entry
import ohos.base.*
import ohos.component.*
import ohos.state_manage.*
import ohos.state_macro_manage.*
import ohos.router.*
import cj_res_entry.app
import ohos.prompt_action.*



@Entry
@Component
class Tab4 {
    @StorageLink["Name"] var name: String = "";
    @StorageLink["Account"] var account: String = "";
    @State
    var isShow: Bool = true;
    @State
    var hide: CJResource = @r(app.media.app_icon)
    @State
    var show: CJResource = @r(app.media.app_icon)
    @State
    var property: String = '99999'


 var scroller: Scroller = Scroller();
    @Provide
    var opacityValue: Float64 = 0.0;
    private var yOffset: Float64 = 0.0;
    @StorageLink["isLogin"]
    var isLoginCheck: Bool = false;

    protected override func aboutToAppear() {
        AppLog.info("home aboutToAppear")
    }




    func jumpToLogin() {
        Router.push(url: 'EntryView')
        AppLog.info('push finish')
    }

//    func onScrollAction() {
//        this.yOffset = this.scroller.currentOffset().yOffset
//        if (this.yOffset > Float64(100)) {
//            this.opacityValue = 1.0
//        } else {
//            this.opacityValue = this.yOffset / Float64(100)
//        }
//    }

    @Builder
    func profileBanner() {
        Column() {
            Row() {
                Image(@r(app.media.app_icon)).width(64).height(64).borderRadius(24).onClick {
                    evt => Router.push(url: "EntryView")}
                Column(){
                    Text(name).fontSize(24).fontWeight(W600).margin(left: 24, bottom: 10)
                    Row(){
                        Text("ID:").fontSize(15)
                        Text(account).fontSize(15)
                    }.margin(left: 24, bottom: 20)
                }.alignItems(HorizontalAlign.Start).height(70.percent)
            }.width(100.percent).height(64).margin(left: 64, top: 70)
            Blank().height(1.percent)
        }.height(30.percent)
    }

    @Builder
    func profilefollow() {
        Row() {
            Column(){
                Text("3").fontSize(25).fontWeight(W600)
                Text("粉丝").fontSize(18).fontColor(0x6e6e6e)
            }.alignItems(HorizontalAlign.Start)
            Divider().vertical(true).height(28).color(0x182431).opacity(0.6).margin(left:30,right:30)
            Column(){
                Text("9").fontSize(25).fontWeight(W600)
                Text("关注").fontSize(18).fontColor(0x6e6e6e)
            }.alignItems(HorizontalAlign.Start)

       }.padding(top: 2, left: 12, bottom: 12, right: 12).width(90.percent)


    }



    @Builder
    func profileState() {
        Column(){

            Text("运动记录").width(100).fontSize(22).margin(left:10,top:15).textAlign(TextAlign.Start).fontWeight(FontWeight.W600)
            .width(90.percent)

       Row() {
            Column(){
                Text("3").fontSize(30).fontWeight(W600)
                Text("活动").fontSize(20).fontColor(0x6e6e6e)
            }.alignItems(HorizontalAlign.Start).margin(left:10,right:60)
            Divider().vertical(true).height(40).color(0x182431).opacity(0.6).margin(25)
            Column(){
                Text("9").fontSize(30).fontWeight(W600)
                Text("发布").fontSize(20).fontColor(0x6e6e6e)
            }.alignItems(HorizontalAlign.Start).margin(right:30)

       }.width(90.percent).padding(top: 12, bottom: 12, right: 12).justifyContent(FlexAlign.Start)

        }.backgroundColor(0xf2f2f2).borderRadius(10).width(90.percent)
    }


@Builder
    func profileState1() {
        Column(){

            Text("运动收藏").width(100).fontSize(22).margin(left:10,top:15).textAlign(TextAlign.Start).fontWeight(FontWeight.W600)
            .width(90.percent)

       Row() {
            Column(){
                Text("30").fontSize(30).fontWeight(W600)
                Text("线路").fontSize(20).fontColor(0x6e6e6e)
            }.alignItems(HorizontalAlign.Start).margin(left:10,right:60)
            Divider().vertical(true).height(40).color(0x182431).opacity(0.6).margin(25)
            Column(){
                Text("60").fontSize(30).fontWeight(W600)
                Text("打卡点").fontSize(20).fontColor(0x6e6e6e)
            }.alignItems(HorizontalAlign.Start).margin(right:30)

       }.width(90.percent).padding(top: 12, bottom: 12, right: 12).justifyContent(FlexAlign.Start)

        }.backgroundColor(0xf2f2f2).borderRadius(10).width(90.percent).margin(top:30)
    }

    @Builder
    func profileState2() {
        Column(){

            Text("运动消耗").width(100).fontSize(22).margin(left:10,top:15).textAlign(TextAlign.Start).fontWeight(FontWeight.W600)
            .width(90.percent)

       Row() {
            Column(){
                Text("1500").fontSize(30).fontWeight(W600)
                Text(" Kcal").fontSize(20).fontColor(0x6e6e6e)
            }.alignItems(HorizontalAlign.Start).margin(left:10,right:40)
            Divider().vertical(true).height(40).color(0x182431).opacity(0.6).margin(25)
            Column(){
                Text("12").fontSize(30).fontWeight(W600)
                Text(" km").fontSize(20).fontColor(0x6e6e6e)
            }.alignItems(HorizontalAlign.Start).margin(right:30)

       }.width(90.percent).padding(top: 12, bottom: 12, right: 12).justifyContent(FlexAlign.Start)

        }.backgroundColor(0xf2f2f2).borderRadius(10).width(90.percent).margin(top:30)
    }






//    func build() {
//        Stack(Alignment.Top) {
//            Column() {
//                Scroll(this.scroller) {
//                    Column() {
//                        Text("hello1")
//                        Text("hello2")
//                        Text("hello3")
//                        Button("登录").onClick {
//                    evt => Router.push(url: "LoginPage")
//                                }.fontSize(30).width(180).height(50).margin(top: 20)
//                    }.zIndex(1)
//                }.onScroll({
//                    offset => this.onScrollAction()
//                })
//            }
//        }
//    }
         func build() {

            Column() {
                Scroll(this.scroller) {
                    Column() {
                        this.profileBanner()
                        this.profilefollow()
                    Line().width(90.percent).backgroundColor(0x33182431).height(1).margin(top:30,bottom:30)
                        this.profileState()
                    this.profileState1()
                        this.profileState2()

                        Blank().height(70)
                        Button('退出登录').backgroundColor(0x85CC16).shape(ShapeType.Normal).width(90.percent).borderRadius(5).onClick {
                    evt => Router.push(url: "EntryView")
                                }
                    }.zIndex(1)
                }
//            .onScroll({
////                    offset => this.onScrollAction()
//                })



            }


    }
    }