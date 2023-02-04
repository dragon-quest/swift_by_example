# 課題

## 開発環境
* MacOS Catalina 10.15.7
* Xcode Version 12.0.1

## 実機で実行ができない場合の設定手順
### Xcodeのバージョンが古いため以下の設定が必要となります。
* ステップ１
    * 実機のiOSバージョンのファイルをダウンロードしてください。
    * https://github.com/filsv/iOSDeviceSupport

* ステップ２
    * ターミナルを起動して、ステップ１でダウンロードしたファイルを以下のディレクトリに配置してください。
    * /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/DeviceSupport/

* ステップ３（プロジェクトに設定済みです。）
    * Xcodeの設定方法
    * --generate-entitlement-derの追加方法を以下のサイトを参考に設定してください。
    * https://stackoverflow.com/questions/68467306/the-code-signature-version-is-no-longer-supported

## 実機動作確認済みの端末
* iPhoneSE 2nd 15.5
