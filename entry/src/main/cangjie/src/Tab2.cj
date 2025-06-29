/**
 * Created on 2025/5/11
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
class Tab2 {
    @State
    var isShow: Bool = true;
    @State
    var hide: CJResource = @r(app.media.app_icon)
    @State
    var show: CJResource = @r(app.media.app_icon)
    @State
    var property: String = '99999'
    @StorageLink["Text"] var text: String = ""


 var scroller: Scroller = Scroller();
    @Provide
    var opacityValue: Float64 = 0.0;
    private var yOffset: Float64 = 0.0;
    @StorageLink["isLogin"]
    var isLoginCheck: Bool = false;

    protected override func aboutToAppear() {
        AppLog.info("home aboutToAppear")
    }

        func build() {

            Column() {
            Row(){
                TextInput(placeholder: "searching······")
                .height(40)
                .width(75.percent)
                Image(@r(app.media.icon_add))
                .width(30)
                .height(30)
                .margin(left:20)
                .onClick {
                    evt => Router.push(url: "Posting")
                                }
            }
            List(space:10) {
        ListItem() {
          Column() {
            Image(@r(app.media.post1))
              .width(90.percent)
              .margin(20)
              .borderRadius(10)
            Text('迷人的爱妮岛')
              .fontSize(16)
              .width(320)
              .height(16)
            Text('攻略详情......')
              .fontSize(15)
              .width(320)
              .height(40)
                    }
                }.onClick {
                    evt => Router.push(url: "post")
                                }
                ListItem() {
          Column() {
            Image(@r(app.media.post2))
              .width(90.percent)
              .margin(20)
              .borderRadius(10)
            Text('沂蒙山银座天蒙攻略')
              .fontSize(16)
              .width(320)
              .height(16)
            Text('攻略详情......')
              .fontSize(15)
              .width(320)
              .height(40)
                    }
                }
                ListItem() {
          Column() {
            Image(@r(app.media.post1))
              .width(90.percent)
              .margin(20)
              .borderRadius(10)
            Text('杭州三日游攻略')
              .fontSize(16)
              .width(320)
              .height(16)
            Text('攻略详情......')
              .fontSize(15)
              .width(320)
              .height(40)
                    }
                }
            }
            }


    }

    }