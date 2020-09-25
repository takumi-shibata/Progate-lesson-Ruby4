# 1.クラスの定義(jsとほぼ変わらない。詳しくはjs4のリポジトリ参照)
# class 大文字クラス名 end
class Menu
end



# 2.インスタンス変数(クラスに情報を持たせること)
# クラス内に「attr_accessor シンボル(:インスタンス変数名)」
class Menu
  attr_accessor :name  # →nameというインスタンス変数をMenuクラスに追加
  attr_accessor :price # →priceというインスタンス変数をMenuクラスに追加
end



# 3.インスタンスの生成(クラスを元に新しくインスタンスを生成するには「クラス名.new」とする)
# 「変数名 = クラス名.new」とすることで、生成したインスタンスを変数に代入することができる
class Menu
  attr_accessor :name
  attr_accessor :price
end

menu1 = Menu.new



# 4.インスタンス変数に値の代入(生成したインスタンスに情報をもたせるには、クラスで用意したインスタンス変数に値を代入する必要がある)
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



# 5.クラスの中でメソッドの定義及び、メソッドの出力
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



# 6.インスタンスメソッドの中でインスタンス変数の定義
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
      return total_price -= 100
    end

    return total_price
  end
end

menu1 = Menu.new

menu1.name = "ピザ"
menu1.price = 800

puts menu1.get_total_price(3)
# →2300



# 7.initializeメソッド(インスタンスが生成(Menu.new)された直後にinitializeメソッドが呼び出され、その中の処理が実行される。)
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