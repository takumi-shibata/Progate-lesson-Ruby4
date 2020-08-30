# クラスの定義(jsとほぼ変わらない。詳しくはjs4のリポジトリ参照)
# class 大文字クラス名 end
class Menu
end


# インスタンス変数(クラスに情報を持たせること)
# クラス内に「attr_accessor シンボル(:インスタンス変数名)」
class Menu
  attr_accessor :name  # →nameというインスタンス変数をMenuクラスに追加
  attr_accessor :price # →priceというインスタンス変数をMenuクラスに追加
end


# インスタンスの生成(クラスを元に新しくインスタンスを生成するには「クラス名.new」とする)
# 「変数名 = クラス名.new」とすることで、生成したインスタンスを変数に代入することができる
class Menu
  attr_accessor :name
  attr_accessor :price
end
menu1 = Menu.new


# インスタンス変数に値の代入(生成したインスタンスに情報をもたせるには、クラスで用意したインスタンス変数に値を代入する必要がある)
# 「生成したインスタンスの変数名.インスタンス変数名 = 値」とする
class Menu
  attr_accessor :name
  attr_accessor :price
end
menu1 = Menu.new
menu2 = Menu.new

menu1.name = "ピザ"
menu1.price = 800
puts menu1.name
puts menu1.price

menu2.name = "すし"
menu2.price = 1000
puts menu2.name
puts menu2.price
# →ピザ 800 すし 1000