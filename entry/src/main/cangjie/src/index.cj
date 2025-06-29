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
class EntryView {

    let a = AppStorage.setOrCreate<Int64>("Time1", 0)
    @StorageLink["Account"] var acc: String = "";
    @StorageLink["Password"] var pass: String = "";
    @State
    var account: String = '';
    @State
    var password: String = '';
    @State
    var isShowProgress: Bool = false;
    @StorageLink["isLogin"]
    var isLoginCheck: Bool = false;
    //    private var timeOutId: Int64 = -1;

    func login() {
        if (this.account == '' || this.password == '') {
            PromptAction.showToast(message: "输入不能为空")
        }
       else if (this.account ==this.acc && this.password ==this.pass ) {
             this.isLoginCheck = true
            Router.push(url: "Home")
        }
        else if (this.account != this.acc ) {
             PromptAction.showToast(message: "用户不存在")
        }
        else if (this.password != this.pass ) {
             PromptAction.showToast(message: "请输入正确密码")
        }
        else {
                PromptAction.showToast(message: "用户不存在")
    }
        }

//    protected override func aboutToDisappear(){
//        sleep(4000 * Duration.millisecond)
//    }

    func backClickLoginCheck() {
        if (this.isLoginCheck) {
            Router.back();
        } else {
            Router.push(url: "EntryView")
        }
    }

    @Builder
    func imageButton(src: CJResource) {
        Button {
            Image(src)
        }.height(48).width(48).backgroundColor(0xF1F3F5)
    }
@State var flag: Bool = true
    func build() {

          Column() {
            Row() {
                Image(@r(app.media.app_icon)).width(20).height(20).margin(left: 10).onClick(
                    {
                    event => this.backClickLoginCheck()
                })
            }.width(100.percent).margin(top: 10, bottom: 100)
            Text("Welcome").fontSize(24).fontWeight(FontWeight.Medium).margin(bottom: 10, left: 10).width(100.percent)
            Text("欢迎来到侠客").fontSize(24).fontWeight(FontWeight.Medium).margin(bottom: 10, left: 15).width(
                100.percent)

            TextInput(placeholder: '账号').maxLength(16).placeholderColor(0x787F87).setType(InputType.Number).
                height(45).width(100.percent).maxLength(11).margin(top: 12).onChange({value: String => this.account = value}).backgroundColor(0xF1F3F5)

            Line().width(92.percent).height(1).backgroundColor(0x33182431)

            TextInput(placeholder: '密码').maxLength(12).placeholderColor(0x787F87).setType(InputType.Password).height(
                45).width(100.percent).margin(top: 20).onChange({value: String => this.password = value}).backgroundColor(0xF1F3F5)

            Line().width(92.percent).height(1).backgroundColor(0x33182431)
            Row() {
                Text("短信验证码登录").fontSize(14).fontColor(0x85CC16).fontWeight(FontWeight.Medium)
                Text("忘记密码").fontSize(14).fontColor(0x85CC16).fontWeight(FontWeight.Medium)
            }.justifyContent(FlexAlign.SpaceBetween).width(92.percent).margin(top:15)
            Button("登录").shape(ShapeType.Normal).width(92.percent).height(50).borderRadius(5).fontSize(16).fontWeight(
                FontWeight.Medium).backgroundColor(0x85CC16).margin(top: 60, bottom: 30).onClick(
                {evt =>this.login()
            })

//            .onClick({evt =>
//                this.flag = !this.flag
//            })
//
//            if (this.flag) {
//                Text("the flag is true").fontSize(40.fp)
//            } else {
//                Text("the flag is false").fontSize(40.fp)
//            }
//           .onClick({
//    if (this.isPhoneValid && this.password.length >= 6) {
//        // 执行路由跳转
//        router.push(url: 'EntryView')
//    } else {
//        // 显示错误提示
//        prompt.showToast(
//            message: '请输入账号密码！',
//            duration: 2000
//        )
//    }
//})

//            .onClick({
//                event =>  Router.push(url: "EntryView")
//            })
//            .onClick(() => {
//          if (this.isPhoneValid && this.password.length >= 6) {
//              router.pushUrl({
//                url: 'pages/Home',
//              })
//          } else {
//            prompt.showToast({
//              message: '请输入账号密码！',
//              duration: 2000,
//            });
//          }
//          })
            Text("注册账号").fontSize(16).fontColor(0x787F87).fontWeight(FontWeight.Medium)
            .onClick{evt => Router.push(url: "register")
            }
            if (this.isShowProgress) {
                LoadingProgress().width(30).height(30).margin(top: 15)
            }
            Blank()
            Text("其他方式登录").fontColor(0x838D97).fontSize(12).fontWeight(FontWeight.Medium).margin(top: 50,
                bottom: 12)
            Row(44) {
                this.imageButton(@r(app.media.login_method1))
                this.imageButton(@r(app.media.login_method2))
                this.imageButton(@r(app.media.login_method3))
            }
        }.backgroundColor(0xF1F3F5).width(100.percent).height(100.percent).padding(left: 12, right: 12, bottom: 24)
    }
}
