# add_googlemaps_into_flutter

GooglemapsをFlutterに追加する方法を下記に残す
1. fulutterプロジェクトのホームディレクトリに移動する

2. 次のコマンドを実行する
flutter pub add google_maps_flutter

3. アンドロイドの最小バージョンを20以上にする
android/app/build.gradle
minsdkVersion 20

4. AndroidアプリにAPIキーを追加する
4.1　APIキーを作成(フィンガープリントについても下記のURLに記載)
https://developers.google.com/maps/documentation/android-sdk/get-api-key?hl=ja

5. android/app/src/main/AndroidManifest.xmlのmeta-dataに次の2つを指定する
<meta-data android:name="com.google.android.geo.API_KEY"
        android:value="YOUR-KEY-HERE"/> //←自分のAPIキーを設定する
↑
この位置をちゃんと確認すること!

