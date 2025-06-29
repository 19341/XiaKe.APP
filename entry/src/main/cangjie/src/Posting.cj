/**
 * Created on 2025/5/10
 */
package ohos_app_cangjie_entry

import cj_res_entry.app
internal import ohos.base.*
internal import ohos.component.*
internal import ohos.state_manage.*
import ohos.state_macro_manage.*
import ohos.prompt_action.*
import ohos.router.*
import std.time.*
import std.sync.*
import ohos.base.*
import ohos.component.*
import ohos.state_manage.*
import ohos.hiappevent.Event
internal import ohos.base.LengthProp
internal import ohos.component.Column
internal import ohos.component.Row
internal import ohos.component.Button
internal import ohos.component.Text
internal import ohos.component.CustomView
internal import ohos.component.CJEntry
internal import ohos.component.loadNativeView
import ohos.base.*
import ohos.component.*
import ohos.state_manage.*
import ohos.state_macro_manage.*
import std.collection.HashMap
import ohos.net.http.*


@CustomDialog
class MyDialog {
    var controller: Option<CustomDialogController> = Option.None
    func build() {
        Column(){
                Button("拍摄").backgroundColor(0xffffff).fontColor(0x000000).fontSize(16).borderRadius(0).width(100.percent).height(60)
                Divider().width(80.percent).height(1)
                Button("从相册中选择").backgroundColor(0xffffff).fontColor(0x000000).fontSize(16).borderRadius(0).width(100.percent).height(60)
        }.width(100.percent).margin(top: 15, bottom: 15)


    }
}


@Entry
@Component

class  Posting {
    let TEXT_1 = AppStorage.setOrCreate("Text1", "")
    let TEXT_2 = AppStorage.setOrCreate("Text2", "")
    @StorageLink["Text1"] var text1: String = "";
    @StorageLink["Text2"] var text2: String = "";
//    @State var text: String = ''
//    @State var text1: String = ''
    var controller: TextInputController = TextInputController()
     var dialogController: CustomDialogController = CustomDialogController(CustomDialogControllerOptions(builder: MyDialog(),alignment: DialogAlignment.Bottom))


    func build() {
             Column(){
            Row(){
                Button(){
                    Image(@r(app.media.back1))
                    .width(70.percent)
                }.shape(ShapeType.CircleType)
                .backgroundColor(0xffffff)
                .height(40).width(40)
                .onClick {
                    evt => Router.back()
                                }
            }.width(100.percent)
            .margin(left:10,top:5)
            Row(10){
                    Image(@r(app.media.img))
                    .width(80)
                    .height(80)
                   // .margin(left: 25,top:60)
                    .borderRadius(8)
   //                 .onClick({event=>
   //           console.log("hit me!")6
   //         if ( this.visible== Visibility.Visible) {
   //         this.visible = Visibility.None
   //           } else {
   //             this.visible = Visibility.Visible
   //          }
   //         })
                    Button(){
                        Text("+")
                         .fontSize(40)
                         .fontColor(0xcccccc)
                         .fontWeight(W200)
                    }.shape(ShapeType.Normal)
                 .onClick({evt =>  dialogController.`open`()  })
                    .width(80)
                    .height(80)
                    //.margin(left: 20,top:60)
                    .borderRadius(10)
                    .backgroundColor(0xffffff)
                    .border(width: 2.vp)
                    .borderColor(0xE6E6E6)
            }.width(100.percent)
            .margin(left:20,top:15)
                 TextInput(text: this.text1, placeholder: 'Add a title', controller: this.controller)
                .width(100.percent)
                .placeholderColor(0xcccccc)
                .setType(InputType.Normal)
                .height(45)
                .margin(top:10)
                .placeholderFont(size: 24, weight: FontWeight.W400)
                .onChange({value: String => this.text1 = value})
            .backgroundColor(0xffffff)
             TextInput(text: this.text2 , placeholder: 'Add text', controller: this.controller)
                .width(100.percent)
                .placeholderColor(0xcccccc)
                .setType(InputType.Normal)
                .height(40)
                //.margin(top:10)
                .placeholderFont(size: 22, weight: FontWeight.W400)
                .onChange({value: String => this.text2= value})
            .backgroundColor(0xffffff)
                Row(){
                Button(){
                    Text("# Topic")
                    .fontColor(0x757575)
                    .fontSize(14)
                }.height(28).width(75)
                .backgroundColor(0xffffff)
                .borderRadius(6)
                .margin(left:10)
                .border(width: 1.vp)
                .borderColor(0xE6E6E6)
                Button(){
                    Text("@ User")
                    .fontColor(0x757575)
                    .fontSize(14)
                }.height(28).width(65)
                .backgroundColor(0xffffff)
                .borderRadius(6)
                .margin(left:10)
                .border(width: 1.vp)
                .borderColor(0xE6E6E6)
                Button(){
                    Text("& Vote")
                    .fontColor(0x757575)
                    .fontSize(14)
                }.height(28).width(65)
                .backgroundColor(0xffffff)
                .borderRadius(6)
                .margin(left:10)
                .border(width: 1.vp)
                .borderColor(0xE6E6E6)
                Button(){
                    Text("* Unfold")
                    .fontColor(0x757575)
                    .fontSize(14)
                }.height(28).width(75)
                .backgroundColor(0xffffff)
                .borderRadius(6)
                .margin(left:65)
                .border(width: 1.vp)
                .borderColor(0xE6E6E6)
            }.width(100.percent)
            .height(55)
            .margin(top:90)
             Divider().strokeWidth(1).color(0xf7f7f7)
                Column(){
                    Row(){
                        Image(@r(app.media.marker))
                        .width(5.percent)
                        .margin(left:10)
                        .opacity(0.7)
                        Text("Tag Location")
                        .fontSize(23)
                        .fontColor(0x757575)
                        .fontWeight(FontWeight.Medium)
                        .height(40)
                        .width(150)
                        .margin(left:10)
                    Button(){
                        Image(@r(app.media.forward))
                        .width(70.percent)
                       // .opacity(0.5)
                    }.width(30)
                    .height(30)
                    .shape(ShapeType.CircleType)
                    .backgroundColor(0x85CC16)
                    .margin(left:150)
                    }.margin(top:5)
                    .height(45)
                    .width(100.percent)
                    .alignItems(VerticalAlign.Center)
                    Row(10){
                        Button(){
                            Text("泰山风景名胜区")
                            .fontColor(0xb3b3b3)
                            .fontSize(13)
                            .fontWeight(W300)
                        }.height(28).width(130)
                        .backgroundColor(0xffffff)
                        .borderRadius(6)
                        .margin(left:10)
                        .border(width: 1.vp)
                        .borderColor(0xE6E6E6)
                        Button(){
                            Text("泰山旅游")
                            .fontColor(0xb3b3b3)
                            .fontSize(13)
                            .fontWeight(W300)
                        }.height(28).width(75)
                        .backgroundColor(0xffffff)
                        .borderRadius(6)
                        .border(width: 1.vp)
                        .borderColor(0xE6E6E6)
                        //.margin(left:10)
                    }.margin(top:5)
                    .width(100.percent)
                }.height(90)
             Divider().strokeWidth(1).color(0xf7f7f7)
                Row(){
                    Image(@r(app.media.unlock1))
                    .width(5.percent)
                    .margin(left:10)
                    .opacity(0.7)
                    Text("Public")
                    .fontSize(21)
                    .fontColor(0x757575)
                    .fontWeight(FontWeight.Medium)
                    .height(40)
                    .width(100)
                    .margin(left:10)
                   Button(){
                        Image(@r(app.media.forward))
                        .width(70.percent)
                       // .opacity(0.5)
                    }.width(30)
                    .height(30)
                    .shape(ShapeType.CircleType)
                    .backgroundColor(0x85CC16)
                    .margin(left:200)
                }.margin(top:5)
                .height(55)
                .width(100.percent)
                .alignItems(VerticalAlign.Center)
             Divider().strokeWidth(1).color(0xf7f7f7)
                Row(){
                    Image(@r(app.media.services1))
                    .width(5.percent)
                    .margin(left:10)
                    .opacity(0.7)
                    Text("Advanced options")
                    .fontSize(21)
                    .fontColor(0x757575)
                    .fontWeight(FontWeight.Medium)
                    .height(40)
                    .width(180)
                    .margin(left:10)
                    Button(){
                        Image(@r(app.media.forward))
                        .width(70.percent)
                       // .opacity(0.5)
                    }.width(30)
                    .height(30)
                    .shape(ShapeType.CircleType)
                    .backgroundColor(0x85CC16)
                    .margin(left:120)
                }.margin(top:5)
                .height(45)
                .width(100.percent)
                .alignItems(VerticalAlign.Center)
            Row(){
            Column(){
                Button(){
                    Image(@r(app.media.draftedit))
                    .width(60.percent)
                        .opacity(0.5)
            }.shape(ShapeType.CircleType)
                    .height(38).width(38)
                    .margin(left:10)
                    .backgroundColor(0xffffff)
                    .border(width: 1.vp)
                    .borderColor(0xE6E6E6)
                    Text("Save Draft")
                    .fontSize(14)
                    .fontColor(0x757575)
                    .margin(top:4,left:10)
                }
               // .justifyContent(FlexAlign.Center)
            Column(){
                Button(){
                    Image(@r(app.media.preview1))
                    .width(60.percent)
                        .opacity(0.5)
            }.shape(ShapeType.CircleType)
                    .height(38).width(38)
                    .margin(left:12)
                    .backgroundColor(0xffffff)
                    .border(width: 1.vp)
                    .borderColor(0xE6E6E6)
                    Text("Preview")
                    .fontSize(14)
                    .fontColor(0x757575)
                    .margin(top:4,left:13)
                }
               // .justifyContent(FlexAlign.Center)
                Button(){
                    Text("Post")
                    .fontSize(22)
                    .fontColor(0xffffff)
                    .fontWeight(W500)
                }.shape(ShapeType.Normal)
                .onClick{evt=>Router.push(url:"Home_New")
                    }
                .height(45)
                .width(220)
                .margin(left:15)
                .borderRadius(40)
                .backgroundColor(0x85CC16)
            }.width(100.percent)
            .margin(top:130)
        }
}
}