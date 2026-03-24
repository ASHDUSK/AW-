import router from '@ohos.router';

@Entry
@Component
struct LaunchPage {
  // 定义变量
  @State private opacityValue: number = 0;
  @State private scaleValue: number = 0.2;

  build() {
    Stack({ alignContent: Alignment.Center }) {
      // 1. 背景（深绿色）
      Rect()
        .width('100%')
        .height('100%')
        .fill('#006633');

      // 2. Logo 和文字
      Column({ space: 20 }) {
        Image($r('app.media.logo_flower'))
          .width(80)
          .height(80)
          .scale({ x: this.scaleValue, y: this.scaleValue });

        Text('时 间 花 园')
          .fontSize(28)
          .fontColor(Color.White)
          .fontWeight(FontWeight.Bold)

          .opacity(this.opacityValue);
      }
    }
    .width('100%')
    .height('100%')
    .onAppear(() => {
      this.scaleValue = 1;
      this.opacityValue = 1;

      setTimeout(() => {
        router.replaceUrl({ url: 'pages/Index' });
      }, 3000);
    });
  }
}
