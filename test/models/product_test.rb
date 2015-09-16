require 'test_helper'

class ProductTest < ActiveSupport::TestCase
   #загружаем стендовые/исходные данные в тестовую базу из файла \test\fixtures\products.yml
   fixtures :products;

   #метод создания записи:
   def createProduct
   	 result = Product.new do |p|
   	 	p.title = 'Half Life 3';
   	 	p.description = 'Игра по мативам вселенной Half Life';
   	 	#p.price = price;
   	 	p.image_url = 'logo.gif';
   	 end;
   	 return result;
   end;

   #блок тестирования:
   test "MyFirstTest" do
     /
     #тесты для цены товара:
     #созаем экземпляр класса Product
     product = createProduct;
     #проверка на nil
     assert(product.invalid?, "Цена не указана!");
     product.price = -1;
     #проверяем, что цена товара не отрицательная:
     assert product.invalid?, "Цена не должна быть отрицательной!";
     #проверяем, что цена не нулевая:
     product.price = 0;
     assert(product.invalid?, "Цена не должна быть нулевой!");
     product.price = 0.001;
     assert(product.invalid?, "Цена не должна быть нулевой!");
     #проверяем строку вместо числа:
     product.price = "Five";
     assert(product.invalid?, "Цена записывается числом!");
     #проверяем нормальную цену:
     product.price = 1001.99;
     assert(product.valid?, "Верные данные!");
     /
     product = createProduct;
     product.price = 1000;
	 #получение данных из стендового файла fixtures:
     product.title = products(:Half_Life_3).title;
     assert(product.invalid?, "Продукт с именем #{product.title} уже существует!");
     product.title = "Half Life";
     #assert product.invalid?;
     assert(product.invalid?, "Продукт с именем #{product.title} уже существует!");
   end
end
