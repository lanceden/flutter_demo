# Vue 上課程式碼及說明文件
- https://github.com/lanceden/flutter_demo/tree/main/assets/VueDemo
- https://github.com/lanceden/vuecli-demo

# Flutter 安裝(mac)

1. 下載Flutter: https://flutter.dev/docs/get-started/install
2. 解壓縮到:/Library
3. 開啟terminal輸入：vim .zshrc，按"i"鍵進入編輯模式
4. 輸入:export PATH=電腦中Flutter的路徑/flutter/bin:$PATH
5. 保存文件:wq
6. 重新加載terminal：source ~/.zshrc
6. 開啟terminal，輸入:flutter doctor，驗證是否安裝成功


# Flutter安裝常見錯誤

* 若照上述安裝有錯誤或失敗，請參考底下連結

* https://github.com/lanceden/flutter_demo/blob/main/FlutterInstall.md


# Flutter -Day 1

- 了解如何寫出建置專案的計數器
- 語法快捷鍵
```
stless - 產生無狀態的widgt

stful - 產生有狀態的widget
```

-無狀態 widget
# StatelessWidget在App初始化之後就不能改變，它是immutable。如果想要改變就得new一個新的StatelessWidget去做更換。
