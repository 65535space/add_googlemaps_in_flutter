# add_googlemaps_into_flutter

GooglemapsをFlutterに追加する方法を下記に残す
1. fulutterプロジェクトのホームディレクトリに移動する

2. 次のコマンドを実行する
flutter pub add google_maps_flutter

3. アンドロイドの最小バージョンを21以上にする
android/app/build.gradle
```gradle
minSdkVersion 21
```

4. AndroidアプリにAPIキーを追加する<br>
4.1　APIキーを作成(フィンガープリントについても下記のURLに記載)
https://developers.google.com/maps/documentation/android-sdk/get-api-key?hl=ja

SHA-1の発給方法
Android Studioでプロジェクト内のAndroidディレクトリを開く
gradleのなんでも実行から次のコマンドを実行する
```
gradle signingReport
```

6. android/app/src/main/AndroidManifest.xmlのmeta-dataに次の2つを指定する
<meta-data android:name="com.google.android.geo.API_KEY"
        android:value="YOUR-KEY-HERE"/> //←自分のAPIキーを設定する<br>
↑
この位置をちゃんと確認すること!
# !!!注意!!!
APIKEYはgit追跡したらダメなので、xmlファイルに直接書かないほうがいい。
よって、#APIKEYを隠す方法を参照すること

6. AndroidManifest.xmlのmanifestタグ配下に以下を追加
```android\app\src\main\AndroidManifest.xml
<uses-permission android:name="android.permission.INTERNET"/>
<uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
```
.INTERNET
アプリケーションがインターネットにアクセスするために必要である。具体的には、Web APIの呼び出し、データの送受信、外部サーバーとの通信など、ネットワークを介して行われる操作に必要である。

.ACCESS_FINE_LOCATION
この権限は、アプリケーションがデバイスの正確な位置情報（GPSやネットワークプロバイダを使用した位置情報）にアクセスするために必要である。この権限をリクエストすることで、アプリはユーザーの現在位置を取得し、位置ベースのサービスを提供することができる。


# 用語集
JSON：データを構造化して保存・転送するための軽量なデータ交換フォーマット

HTTP リクエスト：クライアント（例：ウェブブラウザやアプリケーション）がサーバーに対して特定の操作を要求するためのメッセージ

パース：プログラミングやデータ処理の文脈で、特定の形式のデータを読み取り、そのデータを構造化された形式に変換するプロセスを指します。パースは、テキストデータやファイルなどを解析し、プログラムで利用しやすい形に変換するために行われます。

# Flutterの機能
HTTPパッケージ：
1. HTTPメソッドのサポート：GET、POST、PUT、DELETEなどのHTTPメソッドを使用してリクエストを送信できます。
2. 非同期処理：DartのFutureやasync/awaitを使用して非同期リクエストを処理します。
3. ヘッダーとボディの設定：リクエストにカスタムヘッダーやボディデータを含めることができます。
4. JSON処理：サーバーからのレスポンスをJSON形式で受け取り、解析するためのサポートがあります。

json_serializableパッケージ：JSONデータのシリアライズとデシリアライズを自動化するためのツール。手動でJSONのマッピングを行う煩雑さを軽減し、モデルクラスの作成とJSONとの変換を簡単にします。<br>
シリアライズ：　オブジェクト→JSON //送れるようにする<br>
デシリアライズ：　JSON→オブジェクト//受け取れるようにする<br>

import文について
1.　as修飾子：as修飾子は、インポートしたモジュールにエイリアス（別名）を付けるために使用されます

2.　show修飾子：show修飾子は、インポートしたモジュールから特定のメンバーだけをインポートするために使用されます。

3.　partキーワード：ライブラリの一部として別のファイルに分割するために使用される

# 参考サイト
https://codelabs.developers.google.com/codelabs/google-maps-in-flutter?hl=ja#4

# json_serializableの使い方
json_serializable(dependencies配下)を追加する。json_annotationとbuild_runnerの2つの追加パッケージをpubspec.yamlに追加(dev_dependencies配下)

クラスに'@JsonSerializable' アノテーションを追加する。
 flutter pub run build_runner build
コマンドを実行すると、example.g.dart ファイルが生成され、fromJson メソッドが定義される。

# Markerウィジェット
google_maps_flutterパッケージのウィジェット
地図にポイントをつけるためのもの。<br>
Q. ポイントをつけるだけならpositionだけで特定できない?<br>
A. 付加情報を設定(markerIdやinfoWindow)をつけることで同じ位置に複数のマーカーがある場合でも区別でき、マーカーを動的に操作できる。また、詳細情報の表示などができる。

# kDebugMode とは
kDebugModeは、アプリケーションがデバッグモードで実行されているかどうかをチェックするための定数<br>
flutter runコマンドはデフォルトでデバッグモードである<br>
flutter build apk --release　リリースモードなのでkDebugModeが   Falseとなる


# json.decode()に as Map<String,dynamic> をつける理由
型安全性を向上させ、デコードされたデータに対して適切な型の操作を行うことができるようにするためです(可読性が上がる)


# coodelabは英語版を見るべき
右上の設定で日本語→Englishにしないと、最新バージョンが見られなくて詰む場合がある

# mapを表示する際のエラー
E/FrameEvents(23871): updateAcquireFence: Did not find frame.<br>
気にしないでいい

# Google Maps Platform 指標の見方
トラフィックレスポンスコードの見方
https://developers.google.com/maps/reporting/gmp-reporting?hl=ja#console-billing

# APIKEYを隠す方法(android)
1. androidディレクトリにsecret.propertiesを作る。
```.properties
googleMap.apiKey=YOUR_API_KEY
```

2. android/app/build.gradle 内に次の関数を追加する。

```build.gradle
def secretProperties = new Properties()
def secretPropertiesFile = rootProject.file('secret.properties')
if (secretPropertiesFile.exists()) {
    secretPropertiesFile.withReader('UTF-8') { reader ->
        secretProperties.load(reader)
    }
}
```

3. android内のdefaultConfig に次の変数を追加する
```android/app/build.gradle
// 環境変数を呼び出すコード
manifestPlaceholders = [
        googleMapApiKey: secretProperties.getProperty('googleMap.apiKey'),
]
```

4. AndroidManifest.xml
application配下に次のコードを置きます。(android:labelとandroid:nameの下,android:nameは消してもいい)
```
<meta-data android:name="com.google.android.geo.API_KEY" android:value="${googleMapApiKey}"/>
```

5. プロジェクトディレクトリにgitignoreにsecret.propertiesを追加する。

Q.次のエラーを解決する方法
e: C:/Users/Yourname/.gradle/caches/transforms-4/3d2bf78008da3bd2c559ae6e4a5dd67e/transformed/jetified-kotlin-stdlib-common-1.9.0.jar!/META-INF/kotlin-stdlib-common.kotlin_module: 
Module was compiled with an incompatible version of Kotlin. The binary version of its metadata is 1.9.0, expected version is 1.7.1.
Execution failed for task ':app:compileDebugKotlin'.
> A failure occurred while executing org.jetbrains.kotlin.compilerRunner.GradleCompilerRunnerWithWorkers$GradleKotlinCompilerWorkAction
> Compilation error. See log for more details

A.