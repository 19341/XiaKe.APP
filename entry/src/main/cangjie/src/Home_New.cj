/**
 * Created on 2025/6/18
 */
package ohos_app_cangjie_entry
internal import ohos.base.LengthProp
internal import ohos.component.Column
internal import ohos.component.Row
internal import ohos.component.Button
internal import ohos.component.Text
internal import ohos.component.Image
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
import ohos.router.*
import ohos.base.*
import ohos.component.*
import ohos.state_manage.*
import ohos.state_macro_manage.*
import cj_res_entry.*
import ohos.resource_manager.*
import ohos.router.Router
import std.collection.ArrayList
import ohos.bundle_manager.*
import std.os.homeDir
import ohos.request.agent.State


@Entry
@Component
class Home_New {
    @State var currentIndex: Int32 = 0;
    var controller: TabsController = TabsController()
    @StorageLink["isLogin"]
    var isLoginCheck: Bool = false

    protected override func aboutToAppear() {
        AppLog.info("index aboutToAppear")
    }

//    @Builder
//    func  tabBuilder(title: String, targetIndex: Int32, selectedImg: CJResource, normalImg: CJResource) {
//  Column {
//    if (this.currentIndex == targetIndex){
//                    Image(selectedImg).size(width: 30, height: 30)
//                }
//                else{
//                    Image(normalImg).size(width: 30, height: 30)
//                }
//    Text(title)
//      .fontColor(if(this.currentIndex == targetIndex)
//                {
//                    0x6491f9
//                }
//                else{
//                    0x6B6B6B
//                }
//                )
//  }
//  .width(100.percent)
//  .height(50)
//  .justifyContent(FlexAlign.Center)
//}

    func build() {

        Tabs(BarPosition.End, this.controller) {
            if(this.currentIndex == 0){
                TabContent {
                Tab1()
            }
            .tabBar(icon: "/resources/base/media/Home_icon1_selected.png", text: "首页")
//            .tabBar(this.tabBuilder('首页','0', @r(app.media.Home_icon1_selected), @r(app.media.Home_icon1)))
            }
            else {
            	TabContent {
                Tab1()
            }
            .tabBar(icon: "/resources/base/media/Home_icon1.png", text: "首页")
            }

            if(this.currentIndex == 1){
                TabContent {
                        Tab5()
            }
            .tabBar(icon: "/resources/base/media/Home_icon2_selected.png", text: "社区")
            }
            else {
            	TabContent {
                    Tab5()
            }
            .tabBar(icon: "/resources/base/media/Home_icon2.png", text: "社区")
            }

            if(this.currentIndex == 2){
                TabContent {
                Tab3()
            }
            .tabBar(icon: "/resources/base/media/Home_icon3_selected.png", text: "旅游")
            }
            else {
            	TabContent {
                Tab3()
            }
            .tabBar(icon: "/resources/base/media/Home_icon3.png", text: "旅游")
            }

            if(this.currentIndex == 3){
                TabContent {
                Tab4()
            }
            .tabBar(icon: "/resources/base/media/Home_icon4_selected.png", text: "我的")
            }
            else {
            	TabContent {
                Tab4()
            }
            .tabBar(icon: "/resources/base/media/Home_icon4.png", text: "我的")
            }
//            TabContent {
//                Tab2()
//            }.tabBar(icon: "/resources/base/media/Home_icon2.png", text: "社区")
//            TabContent {
//                Tab3()
//            }.tabBar(icon: "/resources/base/media/Home_icon3.png", text: "旅游")
//            TabContent {
//                Tab4()
//            }.tabBar(icon: "/resources/base/media/Home_icon4.png", text: "我的")
        }.vertical(false).scrollable(true).barMode(BarMode.Fixed).barHeight(70).animationDuration(400).backgroundColor(Color.WHITE)
        .onChange(
            {
                index: Int32 =>
                this.currentIndex = index
                if (this.isLoginCheck == false && this.currentIndex == 4) {
                    Router.push(url: 'Entryview')
                }
            }
        )
    }


//    获取AppID
//    @State var message:String = "HELLO.1l"
//    func build(){
//        Row{
//            Column{
//                Button('APPID').onClick{
//                    let flag = BundleFlag.GET_BUNDLE_INFO_WITH_SIGNATURE
//    let bundleInfo = BundleManager.getBundleInfoForSelf(flag.getValue())
//    message = bundleInfo.signatureInfo.appId
//                }
//                Text(message).margin(top:20)
//            }.width(100.percent)
//        }.height(100.percent)
//    }


}
