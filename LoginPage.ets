import router from '@ohos.router';

@Entry
@Component
struct LoginPage {
  @State pwd: string = '';
  @State pwdVisible: boolean = false;
  @State isFocus: boolean = false;
  @State phone: string = '';
  @State flowerProgress: number = 0;
  private timer: number = -1;

  aboutToAppear() {
    this.timer = setInterval(() => {
      if (this.flowerProgress < 1) {
        this.flowerProgress = Math.min(this.flowerProgress + 0.01, 1);
      } else {
        clearInterval(this.timer);
      }
    }, 20);
  }

  aboutToDisappear() {
    if (this.timer !== -1) clearInterval(this.timer);
  }

  build() {
    Column() {
      Stack() {
        Column({ space: 20 }) {
          // 欢迎文本
          Text("欢迎回到时间花园")
            .fontSize(26)
            .fontWeight(FontWeight.Medium)
            .fontColor('#333333')

          Image($r('app.media.HUA'))
            .width(80)
            .height(80)

          // 输入框区域
          Column({ space: 18 }) {
            // 手机号输入框
            TextInput({ placeholder: "手机号 / 邮箱", text: this.phone })
              .width(280)
              .height(55)
              .backgroundColor(Color.White)
              .borderRadius(12)
              .borderWidth(1.5)
              .borderColor(this.isFocus ? '#FF85A1' : '#EAEAEA')
              .onFocus(() => { this.isFocus = true; })
              .onBlur(() => { this.isFocus = false; })

            // 密码输入框
            TextInput({ placeholder: "密码", text: this.pwd })
              .width(280)
              .height(55)
              .backgroundColor(Color.White)
              .borderRadius(12)
              .borderWidth(1.5)
              .borderColor('#EAEAEA')
              .type(InputType.Password)

            // 登录按钮
            Button("登录")
              .width(280)
              .height(48)
              .backgroundColor('#FF85A1')
              .borderRadius(24)
              .fontSize(16)
              .fontColor(Color.White)
              .onClick(() => {
                router.pushUrl({ url: 'pages/Garden' });
              })

            // 底部链接
            Row({ space: 20 }) {
              Text("注册新账号")
                .fontSize(12)
                .fontColor('#999999')
              Text("忘记密码")
                .fontSize(12)
                .fontColor('#999999')
            }
          }
        }
        .alignItems(HorizontalAlign.Center)
        .padding({ top: 60, bottom: 40 })
      }
      .width('100%')
      .height('100%')
      .backgroundColor('#FFF5F7')
    }
    .width('100%')
    .height('100%')
  }
}
