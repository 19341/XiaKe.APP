/**
 * Created on 2025/6/18
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

@Entry
@Component
class strategy {
    let A = AppStorage.setOrCreate("a", "")
    let B = AppStorage.setOrCreate("b", "")
    let C = AppStorage.setOrCreate("c", "")
    @StorageLink["c"] var c: String = "";
    @StorageLink["a"] var text1: String = "";
    @StorageLink["b"] var text2: String = "";
     var select: UInt32 = 1
    @State var fruits: Array<String> = ["1", "2", "3", "4","5"]
      @State var text: String = ''
    @State var passwordState: Bool = false
    var controller: TextInputController = TextInputController()
    func build(){
        Column {
             Row(){
               Button(){
                    Image(@r(app.media.back1))
                    .width(70.percent)
                    .onClick{ evt=>Router.back()}
                }.shape(ShapeType.CircleType)
                .backgroundColor(0xffffff)
                .height(40).width(40)
                .margin(left:10)
                Button(){
                    Row(){
                        Image(@r(app.media.myway))
                        .width(15.percent)
                        .margin(left:10)
                        Text("我的路线")
                        .fontSize(14)
                        .fontColor(0x757575)
                        .margin(left:5)
                        .fontWeight(W400)
                    }.width(100.percent)
                }.height(35).width(105)
                .backgroundColor(0xffffff)
                    .border(width:1.vp)
                    .borderColor(0xe6e6e6)
                .borderRadius(6)
                .margin(left:225)
            }.width(100.percent)
            .margin(top:20)
             Row(){
                 Text("旅游攻略")
            .fontSize(30)
            .fontColor(0x2E731A)
            .margin(left:25,top:30)
            .fontWeight(W600)
             }.width(100.percent)
            .justifyContent(FlexAlign.Start)
           Column(){
                Row(){
                Text("出发地")
                .fontSize(22)
                .fontColor(0x404040)
                .fontWeight(W500)
                .margin(left:25)
                Button(){
                    Row(){
                        Image(@r(app.media.decoration))
                        .width(20.percent)
                        Text("西安")
                        .fontSize(20)
                        .fontColor(0x404040)
                        .fontWeight(W500)
                        .margin(left:5)
//                        Image(@r(app.media.forward))
//                        .width(20.percent)
                    }
                }.width(100)
               // .height(50)
                .margin(left:180)
                .backgroundColor(0xffffff)
            }
                .width(100.percent)
            .margin(top:20)
//            .border(width:1.vp)
//            .borderColor(0xe6e6e6)
//            .borderRadius(20)
           TextInput(text: this.text1, placeholder: '输入国家/城市', controller: this.controller)
                     .width(90.percent)
                     .placeholderColor(0xcccccc)
                     .placeholderFont(size: 18, weight: FontWeight.W300)
                     .setType(InputType.Normal)
                     .height(45)
                     .margin(top:10)
                     .onChange({value: String => this.text1 = value})
                     .backgroundColor(0xf7f7f7)
           } .width(100.percent)
            .height(100)
            .margin(top:10,bottom:10)
            .justifyContent(FlexAlign.Center)

             Divider().strokeWidth(1).color(0xF2F2F2)
            Column(){
                Row(){
                    Text("目的地")
                  .fontSize(22)
                .fontWeight(W500)
                .fontColor(0x1a1a1a)
                .margin(left:25,top:10)
                }.width(100.percent)
                 .justifyContent(FlexAlign.Start)
                     TextInput(text: this.text2, placeholder: '输入国家/城市', controller: this.controller)
                     .width(90.percent)
                     .placeholderColor(0xcccccc)
                     .placeholderFont(size: 18, weight: FontWeight.W300)
                     .setType(InputType.Normal)
                     .height(45)
                     .margin(top:10)
                     .onChange({value: String => this.text2 = value})
                     .backgroundColor(0xf7f7f7)
            }.width(100.percent).height(100)
            .justifyContent(FlexAlign.Center)
//            .border(width:1.vp)
//            .borderColor(0xe6e6e6)
//            .borderRadius(25)
            .margin(top:10,bottom:10)

             Divider().strokeWidth(1).color(0xF2F2F2)
            Column(){
                Row(){
                    Text("游玩天数")
                .fontSize(22)
                .fontWeight(W500)
                .fontColor(0x1a1a1a)
                .margin(left:25,top:10)
                }.width(100.percent)
                .justifyContent(FlexAlign.Start)
                 Column {
            TextPicker(this.fruits, selected: this.select)
            .onChange({result: TextPickerResData =>
                    nativeLog("Picker item changed, value: ${result.index}")
            })
        }.height(150).width(90.percent)
                .colorBlend(0x274312)
                .margin(top:5)
         .alignItems(HorizontalAlign.Center)
         //.justifyContent(FlexAlign.Center)
            }.width(100.percent)
            //.height(250)
//            .border(width:1.vp)
//            .borderColor(0xe6e6e6)
//            .borderRadius(20)
            .backgroundColor(0xffffff)
            .margin(top:15,bottom:10)

            Divider().strokeWidth(1).color(0xF2F2F2)
            Row(){
                 Button(){
                    Text("P o s t")
                    .fontSize(23)
                    .fontColor(0xffffff)
                    .fontWeight(W500)
                }.shape(ShapeType.Normal)
                .height(45)
                .width(320)
                .borderRadius(40)
                .backgroundColor(0x51C152)
                .onClick{
                    evt=>Router.push(url: "str")
                }
            }.justifyContent(FlexAlign.Center)
            .width(100.percent)
            .margin(top:80)
    }//.alignItems(HorizontalAlign.Start)
}
    }
