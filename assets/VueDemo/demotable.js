
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