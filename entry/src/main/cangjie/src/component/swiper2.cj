/**
 * Created on 2025/5/6
 */
package ohos_app_cangjie_entry.component

internal import ohos.base.*
internal import ohos.component.*
internal import ohos.state_manage.*
import ohos.state_macro_manage.*

import cj_res_entry.app
import ohos.prompt_action.*
import ohos.router.*

//const YLH = 0x24271Eu32

@Entry
@Component
public class swiper2{
    var ctr2: SwiperController = SwiperController()

    func build() {
        Column {
            Swiper(ctr2) {
                Image(@r(app.media.img))
                Image(@r(app.media.img))
                Image(@r(app.media.img))
            }.autoPlay(true).duration(500).width(100.percent).margin(bottom: 20, top: 5)
            .onChange({
                index => nativeLog("Swiper onChanged." + index.toString())
            })

//            Row {
//                Button("上一页").margin(right: 100).backgroundColor(YLH).fontColor(Color.WHITE)
//                .onClick({
//                    evt => ctr2.showPrevious()
//                })
//                Button("下一页").backgroundColor(YLH).fontColor(Color.WHITE)
//                .onClick({
//                    evt => ctr2.showNext()
//                })
//            }
        }.width(90.percent).borderRadius(10)
    }
}