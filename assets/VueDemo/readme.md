# Vue 使用及安裝(Visual Studio Code)
1. 安裝Live Server套件
2. 新增index.html檔案
3. 輸入html:5 產生HTML範本
4. 加入Vue CDN JS檔案
5. 創建Vue 實例
```

    <script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>

    var vm = new Vue({
        el: '#myApp',
    })

```
6. 新增假資料
```

    <script src="./data.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>

    var vm = new Vue({
        el: '#myApp',
        data: {
            list: data,
        },
    })

```
7. 使用Vue模版語法：v-for將資料顯示在畫面
```

    <table class="table table-hover">
        <thead>
            <tr>
                <th scope="col">id</th>
                <th scope="col">name</th>
                <th scope="col">email</th>
            </tr>
        </thead>
        <tbody>
            <tr v-for="(item, index) in listData">
                <td>{{item.News_FirstTitle}}</td>
                <td>{{item.News_SecTitle}}</td>
                <td>{{item.News_Content}}</td>
            </tr>
        </tbody>
    </table>


    其中{{item.News_FirstTitle}}雙花括號，為 Vue的資料綁定語法
```

8. 新增引用axios，發送Ajax請求
```

    <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
    var vm = new Vue({
        el: '#myApp',
        data: {
            foo: 'bar',
        },
        created: function() {
        },
        methods: {
            test: function () {
                console.log('test')
            },
            query: function () {
                axios.post('https://jxjasper.com/JasperFitness/JasperNews/Index')
                    .then(function (response) {
                        this.listData = response.data.Data.Result
                    }.bind(this))
                    .catch(function (error) {
                        console.log(error);
                    });
            }
        }
    })

```
9. 新增component

```

    <script src="./demotable.js"></script>

    var vm = new Vue({
        el: '#myApp',
        components: {
            'demo-table': DemoTable
        },
        data: {
            foo: 'bar',
            listData: []
        },
        created: function () {
            this.query()
        },
        methods: {
            test: function () {
                console.log('test')
            },
            query: function () {
                axios.post('https://jxjasper.com/JasperFitness/JasperNews/Index')
                    .then(function (response) {
                        this.listData = response.data.Data.Result
                        console.log(this.listData)
                    }.bind(this))
                    .catch(function (error) {
                        console.log(error);
                    });
            }
        }
    })
```

10. 將取回的Api資料傳遞至子組件

```

    <demo-table :list-data="listData" />

    let DemoTable = {
        template: `
        <table class="table table-hover">
            <thead>
                <tr>
                    <th scope="col">News_FirstTitle</th>
                    <th scope="col">News_SecTitle</th>
                    <th scope="col">News_Content</th>
                </tr>
            </thead>
            <tbody>
                <tr v-for="(item, index) in listData">
                    <td>{{item.News_FirstTitle}}</td>
                    <td>{{item.News_SecTitle}}</td>
                    <td>{{item.News_Content}}</td>
                </tr>
            </tbody>
        </table>
        `,
        props: {
            listData: Array
        }
    };
    
```