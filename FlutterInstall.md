# flutter_demo

```

個人環境搭建遇到問題解決方案總結
VS問題1: bin/sh dart:command not found
VS問題2: 提示Could not find a Flutter SDK
VS問題3: For full Dart language support, please open a folder containing your Dart files instead of individual loose files
AS問題1: AndroidStudio 打開新項目, 頂部提示: ‘package get’ has not been run
AS問題2: 提示Could not find a Flutter SDK
AS問題3: For full Dart language support, please open a folder containing your Dart files instead of individual loose files
AS問題4: it is taking an unexpectedly long time.
AS問題5: Checking Android licenses is taking an unexpectedly long time…
AS問題6: AndroidStudio安裝完flutter,dart插件後，重啟，AndroidStudio再次提示沒有安裝dart,實際上flutter sdk中已經有dart了
AS問題7: Failed to install the following Android SDK packages as some licences have not been accepted
AS問題8: No active package devtools. pub finished with exit code 65

一、VSCode 配置問題:
問題1: bin/sh dart:command not found
錯誤: VSCode 運行時顯示錯誤: bin/sh dart:command not found
或者寫代碼時,基本函數不提示, 比如main函數不自動顯示代碼塊

解決:
1.首先確定已經安裝Dart和Flutter插件.
2.然後要確定環境是否正確配置, 打開.bash_profile,參考上邊配置

open ~/.bash_profile
3.安裝dart環境

$ brew tap dart-lang/dart
$ brew install dart
4.重啟VSCode

問題2: 提示Could not find a Flutter SDK
使用VSCode打開flutter項目, 如果提示顯示錯誤信息: Could not find a Flutter SDK. Please ensure flutter is installed and in your PATH (you may need to restart).



解決:
這說明我們上面配置flutter命令沒有成功，檢測一下路徑是否有問題，可以cd到本地flutter目錄下，使用flutter -h，查看運行結果，如果失敗，就檢測一下路徑。
如果上面路徑下提示成功，在其他路徑下提示不成功，那麼進行下面命令：

vim ~/.zshrc
在打開的文件裡最下面增加一行代碼，就是配置的路徑

export PATH=本地flutter路徑/bin:$PATH
保存退出後，再使用source命令重新加載一下：

source ~/.zshrc
到這裡，應該可是在任何路徑下使用flutter命令了。

問題3: For full Dart language support, please open a folder containing your Dart files instead of individual loose files


原因:
如果直接新建一個 .dart 文件進行編輯不支持，需要新建一個文件夾，再在裡面新建 .dart文件就可以了.

解決:


提示翻譯: 要獲得Dart語言的全面支持，請打開一個包含Dart文件的文件夾.
所以點擊打開文件夾按鈕, 找到新建dart文件所在文件夾即可.

二、AndroidStudio配置問題
問題1: AndroidStudio 打開新項目, 頂部提示: ‘package get’ has not been run
錯誤信息:Flutter: ‘package get’ has not been run; ‘Pub get’ has not been run



原因: Dart與node類似。它有一個pubspec.yaml相當於package.json包含你的依賴項和內容的項。需要下載這些依賴項。

解決：
參考stackoverflow



此警告僅在此處提醒您未下載依賴項 =>單擊Get Dependencies第一個警告.

如果卡在flutter packages get, 請看問題2
問題2: flutter packages get 慢或者卡
錯誤信息: Running “flutter pub get” in xxx
如果默認鏡像已經修改為國內鏡像，並重新執行命令安裝；結果問題還是出現。

1) .zshrc文件沒有配置

如果你使用終端是zsh，終端啟動時 ~/.bash_profile 將不會被加載，解決辦法就是修改 ～/.zshrc ，在其中添加：

source ～/.bash_profile
重啟

2) 終端優先執行下面三條指令嘗試:
此方法修改臨時環境的配置

export PUB_HOSTED_URL=https://pub.flutter-io.cn
export FLUTTER_STORAGE_BASE_URL=https://storage.flutter-io.cn
flutter packages get
3) 手動下載插件直接放本地使用
如果網絡正常，鏡像正常，環境正常，三條指令執行後，還是依舊會出現卡在flutter packages get的情況。可以考慮手動下載插件直接放本地使用。
這裡就直接po出flutter插件默認本地路徑：

flutter的SDK目錄/.pub-cache/hosted/當前使用的鏡像地址文件夾/
參考示例：
/usr/local/flutter1.5.4/.pub-cache/hosted/pub.flutter-io.cn/
在hosted文件夾下，可以發現幾個以flutter鏡像域名命名的文件夾
./hosted
.../dart-pub.mirrors.sjtug.sjtu.edu.cn%47/
.../pub.dartlang.org/
.../pub.flutter-io.cn/
可見下載的依賴包都是按不同鏡像分目錄存放，所以每切一回鏡像，都需要重新下載所有項目的依賴插件；因為加載的插件較多，也就導致等待時間非常久，這也是切換了幾個國內鏡像依舊卡flutter packages get很久的原因。

解決方法:

第一步，按需選擇操作步驟：

耐心等待下載（若下載的插件數量非常多，等待的耗時會比較長）
將其他鏡像文件夾下已下載的插件文件，拷貝到當前使用的鏡像的目錄下，並執行flutter packages get（避免有遺漏的插件）
手動到插件的github下載文件，放到當前使用的鏡像目錄下
第二步，執行flutter run。

問題3: Waiting for another flutter command to release the startup lock…
方法一: 刪除flutter SDK 下的/bin/cache/lockfile文件, 重啟Android Studio。
方法二: 啟動mac自帶的活動監視器, 搜索dart, 將所有dart進程關閉即可。此方法不需要重啟Android Studio, 所以建議方法二。
問題4: it is taking an unexpectedly long time.
Please try steps below:

a. delete all contents under /home/nima/.gradle
b. cd to the android folder for your flutter project and run ./gradlew sync command, it will download the gradle-xxx.zip automatically. It this gradle process succeeds, re-run the flutter run command.
翻譯:

1> 刪除 /home/nima/.gradle 下的所有內容
2> cd到flutter項目的android文件夾並運行./gradlew sync 命令，它將自動下載gradle-xxx.zip。如果此gradle過程成功，請重新運行flutter run命令。
3> flutter run -v

flutter run -v : it usually download gradle(which is a large file) for the first time you run a flutter program.The above will help you to see the message that its downloading gradle/dist.It wont happen from the next program

問題5: Checking Android licenses is taking an unexpectedly long time…
終端運行

flutter doctor --android-licenses
會檢查是否需要更新 Android SDK ,並重啟電腦

如下提示則成功:

All SDK package licenses accepted.======] 100% Computing updates...  
問題6: AndroidStudio安裝完flutter,dart插件後，重啟，AndroidStudio再次提示沒有安裝dart,實際上flutter sdk中已經有dart了
解決：AndroidStudio需要設置flutter的目錄，設置方法：
file->setting->languages&Frameworks->flutter

問題7: Failed to install the following Android SDK packages as some licences have not been accepted
解決：

用flutter進行編寫時出現了標題的錯誤，不是配置的原因，而是需要接受SDK的證書，反正不難操作即可解決。

1、首先打開控制台，使用如下命令：
cd /Users/你的用戶名/Library/Android/sdk
cd tools
cd bin
2、最關鍵的一部就是下面這個語句
sdkmanager.bat --licenses
執行之後，它會提示你去允許認證，然後
命令會提醒你確定y/n（accept lincense），一路y下去便可以了。

參考解決方案

問題8: No active package devtools. pub finished with exit code 65


Android Studio 點擊 Open in DevTools時，報錯：
No active package devtools. pub finished with exit code 65
解決：
沒有安裝DevTools, 終端調用命令安裝, 安裝後重新啟動Android Studio, 並運行項目,再次點擊Open in DevTools

flutter packages pub global activate devtools
如果沒有安裝成功, 並且提示以下信息,按照信息提示,在.bash_profile文件中添加
export PATH=”$PATH”:”你的flutterSDK路徑/.pub-cache/bin”
Warning: Pub installs executables into /Users/SKFlutter/flutter/.pub-cache/bin, which is not on your path.
You can fix that by adding this to your shell's config file (.bashrc, .bash_profile, etc.):
  export PATH="$PATH":"你的flutterSDK路徑/.pub-cache/bin"
Activated devtools 0.2.5.
再次執行

flutter packages pub global activate devtools

```
