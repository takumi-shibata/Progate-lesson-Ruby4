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


# クラスの中でメソッドの定義及び、メソッドの出力
# クラスの中で定義したメソッド(インスタンスメソッド)は、インスタンスに対して使うようにして呼び出す「生成したインスタンスの変数名.メソッド名」
class Menu
  attr_accessor :name
  attr_accessor :price

  def info
    puts "料理名と値段が表示されます"
  end
end

menu1 = Menu.new

menu1.name = "ピザ"
menu1.price = 800

menu1.info
# →料理名と値段が表示されます


# ↓※インスタンスメソッドでは、引数を渡したり戻り値を返すこともできる↓
class Menu
  attr_accessor :name
  attr_accessor :price
  
  def info(a)
    return "料理名と#{a}が表示されます"
  end
end

menu1 = Menu.new

menu1.name = "ピザ"
menu1.price = 800

puts menu1.info("値段")
# →料理名と値段が表示されます


# インスタンスメソッドの中でインスタンス変数の定義
# インスタンスメソッドの中で「self.インスタンス変数名」とすることで、インスタンス変数を扱うことができる
class Menu
  attr_accessor :name
  attr_accessor :price
  
  def info
    return "#{self.name} #{self.price}円"
  end
end

menu1 = Menu.new

menu1.name = "ピザ"
menu1.price = 800

puts menu1.info
# →ピザ 800円


# ↓クラスとインスタンスの演習↓
class Menu
  attr_accessor :name
  attr_accessor :price
  
  def info
    return "#{self.name} #{self.price}円"
  end
  
  def get_total_price(count)
    total_price = self.price * count

    if count >= 3
      total_price -= 100
    end

    return total_price
  end
end

menu1 = Menu.new

menu1.name = "ピザ"
menu1.price = 800

puts menu1.get_total_price(3)
# →2300


# initializeメソッド(インスタンスが生成(Menu.new)された直後にinitializeメソッドが呼び出され、その中の処理が実行される。)
# そのためインスタンスの生成後に記述していたインスタンス変数の値の代入を、initializeメソッドの中で行う。→「self.インスタンス変数名 = 値」 
class Menu
  attr_accessor :name
  attr_accessor :price
  
  def initialize
    self.name = "ピザ"
    self.price = 800
  end  
  
  def info
    return "#{self.name} #{self.price}円"
  end
  
  def get_total_price(count)
    total_price = self.price * count
    if count >= 3
      total_price -= 100
    end
    return total_price
  end
end

menu1 = Menu.new

puts menu1.info
# →ピザ 800円


# ↓※initializeメソッドでは、引数を渡すこともできる(「クラス.new」に対して引数を渡すことで、initializeメソッドにその値を渡すことができる)↓
class Menu
  attr_accessor :name
  attr_accessor :price
  
  def initialize(name:,price:)
    self.name = name
    self.price = price
  end
  
  def info
    return "#{self.name} #{self.price}円"
  end
  
  def get_total_price(count)
    total_price = self.price * count
    if count >= 3
      total_price -= 100
    end
    return total_price
  end
end

menu1 = Menu.new(name:"すし",price:1000)

puts menu1.info
# →すし 1000円


# ファイルの分割(分割先のファイルで定義されているクラスを使用するにはrequireする必要がある。jsと似ている、詳しくはjs5のリポジトリ参照)
# 使用するファイルの先頭で「require "./ファイル名"」もしくは「require "../フォルダー名/ファイル名"」と記述する。 ※ファイル名の拡張子の「.rb」は省略することができる
require "./menu"

menu1 = Menu.new(name: "すし", price: 1000)
puts menu1.info
# →すし 1000円


# インスタンスの配列(クラスから生成したインスタンスも、配列の要素にすることが可能)
require "./menu"

menu1 = Menu.new(name: "ピザ", price: 800)
menu2 = Menu.new(name: "すし", price: 1000)
menu3 = Menu.new(name: "コーラ", price: 300)
menu4 = Menu.new(name: "お茶", price: 200)

menus =[menu1,menu2,menu3,menu4]

menus.each do |menu|
  puts menu.info
end
# →ピザ 800円 すし 1000円 コーラ 300円　お茶 200円


# ↓※項目に数字の番号の表示↓
require "./menu"

menu1 = Menu.new(name: "ピザ", price: 800)
menu2 = Menu.new(name: "すし", price: 1000)
menu3 = Menu.new(name: "コーラ", price: 300)
menu4 = Menu.new(name: "お茶", price: 200)

menus = [menu1, menu2, menu3, menu4]

# 変数indexを定義し、項目に数字の番号の表示
index = 0

menus.each do |menu|
  puts "#{index}. #{menu.info}"
  
  # 数字の番号が入った変数indexにeachで繰り返し1を足していく
  index += 1
end
# →0.ピザ 800円 1.すし 1000円 2.コーラ 300円　3.お茶 200円


# 入力の受け取り(文字列や数字をコンソールで入力し、その入力した値を変数に代入する事ができる。jsではパッケージ、詳しくはjs5のリポジトリ参照)
# 文字列は→「変数名 = gets.chomp  数字は→「変数名 = gets.chomp.to_i」
puts "名前を入力してください"

# ↓文字列の入力の受け取り
name = gets.chomp

# ↓受け取った結果
puts "#{name}さん、いらっしゃいませ"

puts "1つ100円のお菓子があります"
puts "いくつ買いますか?"

# ↓数字の入力の受け取り
count = gets.chomp.to_i

# 合計金額の定義
total_price = 100 * count

# ↓受け取った結果
puts "お会計は#{total_price}円です"
# →名前を入力してください (文字列をコンソールで入力) (文字列)さん、いらっしゃいませ 1つ100円のお菓子があります いくつ買いますか? (数字をコンソールで入力)　お会計は(合計金額)円です


# ↓全ての内容のまとめ↓
require "./menu"

menu1 = Menu.new(name: "ピザ", price: 800)
menu2 = Menu.new(name: "すし", price: 1000)
menu3 = Menu.new(name: "コーラ", price: 300)
menu4 = Menu.new(name: "お茶", price: 200)

menus = [menu1, menu2, menu3, menu4]

# ↓メニュー番号の定義
index = 0
menus.each do |menu|
  puts "#{index}. #{menu.info}"

  # メニュー番号が入った変数indexにeachで繰り返し1を足していく
  index += 1
end

puts "--------------"
puts "メニューの番号を選択してください"

# メニュー番号(数字)の受け取り
order = gets.chomp.to_i

# ↓menus[order(上記で受け取ったメニュー番号)]は、menus[インデックス番号]って事。それをselected_menuに代入しているので、selected_menuはmenus[インデックス番号]と同じ
selected_menu = menus[order]

# ↓メニュー名の表示
puts "選択されたメニュー: #{selected_menu.name}"
puts "個数を入力してください(3つ以上で100円割引)"

# ↓購入する個数(数字)の受け取り
count = gets.chomp.to_i

# ↓合計金額の表示(先程選択したselected_menuに入っているメニュー名と金額。及び、countに入っている購入する個数をget_total_priceメソッドに値の受け渡し)
puts "お会計は#{selected_menu.get_total_price(count)}円です"