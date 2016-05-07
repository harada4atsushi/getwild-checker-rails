## 注意点
- 開発環境と本番環境でDBを切り分けるのが面倒だったので、どちらの環境でも`db/development.sqlite3`を使っています。git管理もされているので、両環境でDBが更新されるとコンフリクトするので注意が必要。
- 学習・予測の処理についてはpythonで書かれています。予測については直接Railsからコマンド実行されます。学習については自動実行されませんので、ラベル付データが新しく追加された場合は手動で学習処理を実行する必要があります。

## コマンド

学習させる(sqlitedbをトレーニングセットにする)

```
$ cd learning
$ python main_learn.py
```

学習時に学習曲線を出力したい場合は下記のコメントアウトを解除しておく(`main_learn.py`)。

```
# plotter = Plotter()
# plotter.plot(svm_model, feature_vectors, data_parser.labels)
```


予測させる。標準出力の最後の1文字が結果(0: not Getwild, 1: GetWild)。

```
$ cd learning
$ python main_predict.py りょうちゃんもっこり
```
