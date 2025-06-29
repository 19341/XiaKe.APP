/**
 * Created on 2025/4/25
 */
package ohos_app_cangjie_entry

import ohos.base.*
import ohos.component.*
import ohos.state_manage.*
//import ohos_app_cangjie_entry.Component.*
import ohos.state_macro_manage.*
import ohos.router.*
internal import ohos.state_manage.*
internal import ohos.base.*
internal import ohos.component.*
import ohos.webview.*

@Entry
@Component
class Tab1 {
     var scroller: Scroller = Scroller();
    @Provide
    var opacityValue: Float64 = 0.0;
    private var yOffset: Float64 = 0.0;
    @StorageLink["isLogin"]
    var isLoginCheck: Bool = false;

    @State
    var searchInput: String = '';

    let controller = SearchController()

    protected override func aboutToAppear() {
        AppLog.info("home aboutToAppear")
    }

    func onScrollAction() {
        this.yOffset = this.scroller.currentOffset().yOffset
        if (this.yOffset > Float64(100)) {
            this.opacityValue = 1.0
        } else {
            this.opacityValue = this.yOffset / Float64(100)
        }
    }

   @State
    var webUrl: String = "about:blank";
    var webController: WebviewController = WebviewController();

    // 打开网页方法
    func loadPage(url: String) {
        this.webUrl = url
        webController.loadUrl(url)
    }

    func build() {
         Column() {
            Scroll(this.scroller) {
        Column() {
//        Search(value: this.searchInput,controller:controller,placeholder:"周边游").borderRadius(3).width(95.percent)

        Stack(Alignment.BottomEnd) {
Column() {
// 控制按钮区域
//            Row() {
//                Button("打开官网")
//                    .onClick { =>
//                        this.loadPage("https://developer.harmonyos.com/")
//                    }
//                    .backgroundColor(0x007AFF)
//                    .margin(12.vp)
//
//
//                Button("清空页面")
//                    .onClick { =>
//                        this.webUrl = "about:blank"
//                    }
//                    .backgroundColor(0xFF5722)
//                    .margin(12.vp)
//
//            }
            // Web容器组件
//            Web(src:"https://developer.harmonyos.com/", controller: this.webController)
//        }
//        .width(100.percent)
//        .height(100.percent)
            Web(src: @rawfile("MAP1.html"), controller: this.webController )
             .onPageBegin({evt =>
                AppLog.info("page begin url: ${evt.url}")
            })
            .onPageEnd({evt =>
                AppLog.info("page end url: ${evt.url}")
            })
            }
        .width(100.percent)
        .height(100.percent)
       // .fileAccess(true)        // 允许访问本地文件
//          Image(@r(app.media.map)).height(100.percent)
                        Column(){
                             Button(){
                                Text("+")
                                .fontSize(30)
                                .fontColor(0xFFFFFF)
                            }
                            .backgroundColor(0x85CC16)
                            .height(50)
                            .width(50)
                            .margin(bottom:20)
                            .onClick {
                            evt=>Router.push(url: "strategy")
                            }
                             Button(){
                                Image(@r(app.media.send))
                                .height(30)
                            }
                            .backgroundColor(0x85CC16)
                            .height(50)
                            .width(50)
                            .onClick {
                            evt=>Router.push(url: "str")
                            }
                        }
                        .margin(bottom:50, right: 30)
                    }
        }.zIndex(1)
        }.onScroll({offset => this.onScrollAction()})
        }


    }
}