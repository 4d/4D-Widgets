# SearchPicker SET HELP TEXT

> SearchPicker SET HELP TEXT ( objectName ; helpText )

| 引数 | 型 | 説明 |
| --------- | -------- | ----------- |
| objectName | テキスト | サブフォームオブジェクト名 |
| helpText | テキスト | 表示するテキスト |

## 説明

`SearchPicker SET HELP TEXT`コマンドを使用して、 `objectName`で指定した検索エリアのバックグランドに、入力不可のグレイアウトされたテキストを表示できます。このテキストはユーザがエリア内をクリックすると消えます。

### 例題

エリア内に"Country"と表示します。これにより検索がこの変数に関連するものだということを示すことができます:

```4d
SearchPicker SET HELP TEXT("vSearch";"Country")
```

![](../images/pict308485.en.png)