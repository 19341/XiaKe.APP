/**
 * Created on 2025/6/18
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
class str {
    @StorageLink["a"] var text1: String = "";
    @StorageLink["b"] var text2: String = "";
    @State var text: String = ''
    var controller: TextInputController = TextInputController()
    @State var format: String = 'mm:ss.SS'
     @State
    var webUrl: String = "about:blank";
    var webController: WebviewController = WebviewController();
    func build() {
         Stack(Alignment.Bottom) {
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
             .margin(left:10,bottom:200)
                .align(Alignment.Top)
                .onClick{
                    evt=>Router.push(url: "Home")
                }
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
                Column(){
                    Row(){
                     Text("第一天")
                    .fontSize(24)
                    .fontColor(0x2E731A)
                    .fontWeight(W600)
                    .margin(left:15,top:10)
                    Text("…")
                   .fontSize(25)
                    .fontColor(0x2E731A)
                    .fontWeight(W600)
                    .margin(left:240)
                  }.width(100.percent)
                    .justifyContent(FlexAlign.Start)
                        .margin(top:10)
                        Row(){
                                Image(@r(app.media.adds))
                                .width(8.percent)
                                .margin(left:10)
                            Row(){
                                Text(text1).fontSize(24).margin(left:10)
                            Text("到").fontSize(24).margin(left:10)
                            Text(text2).fontSize(24).margin(left:10)
                            }.width(100.percent).height(50)

//                                TextInput(text: this.text1, placeholder: '添加地点', controller: this.controller)
//                .width(100.percent)
//                .placeholderColor(0xcccccc)
//                .setType(InputType.Normal)
//                .height(50)
//                .placeholderFont(size: 19, weight: FontWeight.W400)
////                .onChange({value: String => this.text = value})
//                .backgroundColor(0xfcfcfc)
                        }
                }.height(60)
                 .margin(top:15,left:10)
                 .width(100.percent)
                 .justifyContent(FlexAlign.Start)

                    Divider()
                    .strokeWidth(1.5)
                    .color(0xf5f5f5)
                    .margin(top:40)

                Column(){
                    Row(){
                     Text("第二天")
                    .fontSize(24)
                    .fontColor(0x2E731A)
                    .fontWeight(W600)
                    .margin(left:15)
                    Text("…")
                   .fontSize(25)
                    .fontColor(0x2E731A)
                    .fontWeight(W600)
                    .margin(left:240)
                  }.width(100.percent)
                    .justifyContent(FlexAlign.Start)
                        .margin(top:10)
                        Row(){
                                Image(@r(app.media.adds))
                                .width(8.percent)
                                .margin(left:10)
                                TextInput(text: this.text, placeholder: '添加地点', controller: this.controller)
                .width(100.percent)
                .placeholderColor(0xcccccc)
                .setType(InputType.Normal)
                .height(50)
                .placeholderFont(size: 19, weight: FontWeight.W400)
                .onChange({value: String => this.text = value})
                .backgroundColor(0xfcfcfc)
                        }
                }.height(60)
                 .margin(top:10,left:10)
                 .width(100.percent)
                 .justifyContent(FlexAlign.Center)

                 Divider()
                    .strokeWidth(1.5)
                    .color(0xf5f5f5)
                    .margin(top:30)

                     Column(){
                    Row(){
                     Text("第三天")
                    .fontSize(24)
                    .fontColor(0x2E731A)
                    .fontWeight(W600)
                    .margin(left:15)
                    Text("…")
                   .fontSize(25)
                    .fontColor(0x2E731A)
                    .fontWeight(W600)
                    .margin(left:240)
                  }.width(100.percent)
                    .justifyContent(FlexAlign.Start)
                        .margin(top:10)
                        Row(){
                                Image(@r(app.media.adds))
                                .width(8.percent)
                                .margin(left:10)
                                TextInput(text: this.text, placeholder: '添加地点', controller: this.controller)
                .width(100.percent)
                .placeholderColor(0xcccccc)
                .setType(InputType.Normal)
                .height(50)
                .placeholderFont(size: 19, weight: FontWeight.W400)
                .onChange({value: String => this.text = value})
                .backgroundColor(0xfcfcfc)
                        }
                }.height(60)
                 .margin(top:10,left:10)
                 .width(100.percent)
                 .justifyContent(FlexAlign.Center)

                 Divider()
                    .strokeWidth(1.5)
                    .color(0xf5f5f5)
                    .margin(top:30)

                     Column(){
                    Row(){
                     Text("待安排")
                    .fontSize(24)
                    .fontColor(0x2E731A)
                    .fontWeight(W600)
                    .margin(left:15)
                    Text("…")
                   .fontSize(25)
                    .fontColor(0x2E731A)
                    .fontWeight(W600)
                    .margin(left:240)
                  }.width(100.percent)
                    .justifyContent(FlexAlign.Start)
                        .margin(top:10)
                        Row(){
                                Image(@r(app.media.adds))
                                .width(8.percent)
                                .margin(left:10)
                                TextInput(text: this.text, placeholder: '添加地点', controller: this.controller)
                .width(100.percent)
                .placeholderColor(0xcccccc)
                .setType(InputType.Normal)
                .height(50)
                .placeholderFont(size: 19, weight: FontWeight.W400)
                .onChange({value: String => this.text = value})
                .backgroundColor(0xfcfcfc)
                        }
                }.height(60)
                 .margin(top:10,left:10,bottom:100)
                 .width(100.percent)
                 .justifyContent(FlexAlign.Center)

            }
                .justifyContent(FlexAlign.End)
                .backgroundColor(0xfcfcfc)
                .borderRadius(20)
//                     Row(){
//                     Button('+')
//                     .shape(ShapeType.Normal)
//                    .borderRadius(10)
//                    .height(60)
//                    .width(60)
//                    .fontSize(40)
//                    .fontColor(0xffffff)
//                    .margin(bottom:160,right:20)
//                    .backgroundColor(0x51C152)
//                }.width(100.percent)
                }
    }
        .height(100.percent)
        .width(100.percent)
}
}
