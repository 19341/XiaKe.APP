/**
 * Created on 2025/5/5
 */
package ohos_app_cangjie_entry
import ohos.base.*
import ohos.component.*
import ohos.state_manage.*
import ohos.state_macro_manage.*
import ohos.router.*
import ohos.base.*
import ohos.component.*
import ohos.state_manage.*
import ohos.state_macro_manage.*
import ohos.image.Image as MultiImage
import ohos.image.Component as ImageComponent
import ohos.image.InitializationOptions
import ohos.image.PixelMapFormat
import ohos.image.PixelMap
import ohos.image.createPixelMap
import ohos.image.Size as UniqueImageSize
import ohos.state_macro_manage.*
import ohos.router.*
internal import ohos.state_manage.*
internal import ohos.base.*
internal import ohos.component.*
import ohos.webview.*
internal import ohos.base.LengthProp
internal import ohos.component.Column
internal import ohos.component.Row
internal import ohos.component.Button
internal import ohos.component.Text
internal import ohos.component.CustomView
internal import ohos.component.CJEntry
internal import ohos.component.loadNativeView
internal import ohos.state_manage.SubscriberManager
internal import ohos.state_manage.ObservedProperty
internal import ohos.state_manage.LocalStorage
import ohos.state_macro_manage.Entry
import ohos.state_macro_manage.Component
import ohos.state_macro_manage.State
import ohos.state_macro_manage.r
import ohos.base.*
import ohos.component.*
import ohos.state_manage.*
import ohos.state_macro_manage.*


@Entry
@Component
class Tab3 {
     var textTimerController: TextTimerController = TextTimerController()
    @State var format: String = 'mm:ss.SS'
     @State
    var webUrl: String = "about:blank";
    var webController: WebviewController = WebviewController();

    // 打开网页方法
    func loadPage(url: String) {
        this.webUrl = url
        webController.loadUrl(url)
    }
    func build() {
//         Stack(Alignment.BottomStart) {
//            Column(){
//            Web(src: @rawfile("map.html"), controller: this.webController )
//             .onPageBegin({evt =>
//                AppLog.info("page begin url: ${evt.url}")
//            })
//            .onPageEnd({evt =>
//                AppLog.info("page end url: ${evt.url}")
//            })
//            }
//        .width(100.percent)
//        .height(100.percent)
//    Column() {
//      Image(@r(app.media.map3))
//        .width(100.percent)
//        .height(100.percent)
//        .margin(top: 10, bottom: 60 )
//    }
    Stack(Alignment.Bottom) {
//             Column(){
//            Web(src: @rawfile("map.html"), controller: this.webController )
//             .onPageBegin({evt =>
//                AppLog.info("page begin url: ${evt.url}")
//            })
//            .onPageEnd({evt =>
//                AppLog.info("page end url: ${evt.url}")
//            })
//            }
            Column(){
            Web(src: @rawfile("map.html"), controller: this.webController )
             .onPageBegin({evt =>
                AppLog.info("page begin url: ${evt.url}")
            })
            .onPageEnd({evt =>
                AppLog.info("page end url: ${evt.url}")
            })
            }
        .width(100.percent)
        .height(100.percent)
        Column {
             Row(){
                Button(){
                    Image(@r(app.media.back1))
                    .width(70.percent)
                }.shape(ShapeType.CircleType)
                .backgroundColor(0xffffff)
                .height(40).width(40)
            }.width(100.percent)
             .margin(left:10,bottom:470)
                .align(Alignment.Top)
//                Rect()
//                .width(100.percent)
//                .height(200)
//                .radius(20)
//                .fill(0xfafafa)
            Column(){
                    Row(){
                        Rect()
                .width(10.percent)
                .height(6)
                .radius(10)
                .margin(top:10)
                .fill(0xf2f2f2)
                //.stroke(Color.TRANSPARENT)
                    }.width(100.percent)
                    .justifyContent(FlexAlign.Center)
                 Row(){
                     Text("时间: ")
                    .fontSize(17)
                    .fontColor(0x8C8C8C)
                        .fontWeight(W600)
                    .margin(top:22)
                    TextTimer(isCountDown: false, count: 30000, controller: this.textTimerController)
                .format(this.format)
                .fontColor(0x363636)
                .fontSize(26)
                    .margin(top:20)
                .onTimer({utc, elapsedTime =>
                    AppLog.info("time has been changed")
                })
                    Text("距离:")
                   .fontSize(17)
                    .fontColor(0x8C8C8C)
                    .fontWeight(W600)
                    .margin(left:50,top:22)
                    Text("0.00")
                    .fontSize(26)
                    .fontColor(0x363636)
                    .margin(left:10,top:20)
                        Text("km")
                        .fontSize(16)
                        .fontColor(0x363636)
                        .fontWeight(W600)
                        .margin(top:24)
                  }.width(100.percent)
                    .justifyContent(FlexAlign.Center)
                Row(){
                    Text("速度:")
                    .fontSize(17)
                    .fontColor(0x8C8C8C)
                        .fontWeight(W600)
                    .margin(top:17)
                    Text("0.00")
                    .fontSize(26)
                    .fontColor(0x363636)
                    .margin(left:10,top:15)
                        Text("km/h")
                        .fontSize(16)
                        .fontColor(0x363636)
                        .fontWeight(W600)
                        .margin(top:19)
                     Text("消耗:")
                    .fontSize(17)
                    .fontColor(0x8C8C8C)
                        .fontWeight(W600)
                    .margin(left:50,top:17)
                    Text("0.00")
                    .fontSize(26)
                    .fontColor(0x363636)
                    .margin(left:10,top:15)
                        Text("kal")
                        .fontSize(16)
                        .fontColor(0x363636)
                        .fontWeight(W600)
                        .margin(top:19)
                }.width(100.percent)
                    .justifyContent(FlexAlign.Center)

                 Divider()
                    .strokeWidth(1)
                    .color(0xf7f7f7)
                    .margin(top:10)

                Row() {
                Button(){
                    Text("添加路线")
                     .fontSize(18)
                    .fontColor(0x363636)
                    .fontWeight(W600)
                }
                .onClick({=>
                  this.textTimerController.pause()
                }) .shape(ShapeType.Normal)
                .height(45)
                .width(170)
                //.margin(left:10)
                .borderRadius(40)
                .backgroundColor(0xf2f2f2)

                Button(){
                    Text("开始记录")
                     .fontSize(18)
                    .fontColor(0xffffff)
                    .fontWeight(W600)
                }
                .onClick({=>
                  this.textTimerController.start()
                })
                .shape(ShapeType.Normal)
                .height(45)
                .width(170)
                .margin(left:15)
                .borderRadius(40)
                .backgroundColor(0x85CC16)
               // Button("reset").onClick({=>
               //    this.textTimerController.reset()
              //  })
            }.justifyContent(FlexAlign.Center)
                .width(100.percent)
                .margin(top:15,bottom:150)
            }
                .justifyContent(FlexAlign.End)
                .backgroundColor(0xfcfcfc)
                .borderRadius(20)

                }
    }
        .height(100.percent)
        .width(100.percent)
}
}