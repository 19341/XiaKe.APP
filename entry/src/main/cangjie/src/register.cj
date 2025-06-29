/**
 * Created on 2025/6/17
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
class register {
    let USER_name = AppStorage.setOrCreate("Name", "A")
    let USER_account = AppStorage.setOrCreate("Account", "B")
    let USER_password = AppStorage.setOrCreate("Password", "C")
    @StorageLink["Name"] var name: String = "";
    @StorageLink["Account"] var account: String = "";
    @StorageLink["Password"] var password: String = "";
    @State
    var isShowProgress: Bool = false;
    @State var password1: String="";
    @StorageLink["isLogin"]
    var isLoginCheck: Bool = false;
    //    private var timeOutId: Int64 = -1;

    func register() {
        if (this.account == ''||this.password == ''||this.password1 == ''||this.name == '') {
            PromptAction.showToast(message: "输入不能为空")
        }
        else if(this.password != this.password1){
            PromptAction.showToast(message: "两次密码不相同")
        }
        else {
                Router.push(url: "EntryView")
        }
    }

    func build(){
        Column(){
            Text("用户注册")
            .fontSize(32)
            .fontWeight(FontWeight.Medium)
            .margin(top:130,bottom: 25, left: 10)
            .width(100.percent)
            Text("用户名")
            .fontSize(20)
            .fontWeight(FontWeight.Medium)
            .margin(top:20, left: 10)
            .width(100.percent)
            TextInput(placeholder: '请输入用户名')
            .maxLength(16)
            .placeholderColor(0x787F87)
            .setType(InputType.Normal)
            .height(45)
            .width(100.percent)
            .maxLength(11)
            .margin(top: 6)
            .onChange({value: String => this.name = value})
            .backgroundColor(0xF1F3F5)
            Line().width(92.percent).height(1).backgroundColor(0x33182431)
            Text("账号")
            .fontSize(20)
            .fontWeight(FontWeight.Medium)
            .margin(top:15, left: 10)
            .width(100.percent)
            TextInput(placeholder: '请输入账号')
            .maxLength(16)
            .placeholderColor(0x787F87)
            .setType(InputType.Number)
            .height(45)
            .width(100.percent)
            .maxLength(11)
            .margin(top: 6)
            .onChange({value: String => this.account = value})
            .backgroundColor(0xF1F3F5)
            Line().width(92.percent).height(1).backgroundColor(0x33182431)
            Text("密码")
            .fontSize(20)
            .fontWeight(FontWeight.Medium)
            .margin(top:15, left: 10)
            .width(100.percent)
            TextInput(placeholder: '请输入密码')
            .maxLength(16)
            .placeholderColor(0x787F87)
            .setType(InputType.Password)
            .height(45)
            .width(100.percent)
            .maxLength(11)
            .margin(top: 6)
            .onChange({value: String => this.password = value})
            .backgroundColor(0xF1F3F5)
            Line().width(92.percent).height(1).backgroundColor(0x33182431)
            Text("确认密码")
            .fontSize(20)
            .fontWeight(FontWeight.Medium)
            .margin(top:15, left: 10)
            .width(100.percent)
            TextInput(placeholder: '请再次输入密码')
            .maxLength(16)
            .placeholderColor(0x787F87)
            .setType(InputType.Password)
            .height(45)
            .width(100.percent)
            .maxLength(11)
            .margin(top: 6)
            .onChange({value: String => this.password1 = value})
            .backgroundColor(0xF1F3F5)
            Line().width(92.percent).height(1).backgroundColor(0x33182431)
            Button("注册").shape(ShapeType.Normal).width(92.percent).height(50).borderRadius(5).fontSize(16).fontWeight(
                FontWeight.Medium).backgroundColor(0x85CC16).margin(top: 60, bottom: 30).onClick(
                {evt => this.register()
            })
        }.backgroundColor(0xF1F3F5).width(100.percent).height(100.percent).padding(left: 12, right: 12, bottom: 24)
    }
}
