class Product < ActiveRecord::Base
	#добавление валидации:
	#проверка данных на пустоту
	validates :title, :presence => {message: 'Необходимо ввести наименование'};
	validates :description, :presence => {message: 'Необходимо указать описание'};
	validates :image_url, :presence => {message: 'Не указана ссылка на изображение'};
	validates :price, :presence => {message: 'Не указана цена'};
	#проверка длины текста:
	validates :title, :length => {minimum: 3, maximum: 50,
		message: 'Длина наименования не должна быть меньше 2х символов и больше 50'};
	#переопределим опцию подсчета символов в опцию посчета слов:
	validates :description, :length => {in: 1..250,
		tokenizer: lambda {|str| str.split(/\s+/)},
		too_short: "Слишком короткое описание(#{count} слов)",
		too_long: "Слишком длинное описание(#{count} слов)",
		};
	#проверка числового значения:
	validates :price, :numericality => {greater_than_or_equal_to: 0.01,
		message: 'Цена должна быть больше нуля'
		};
	#проверка наименования на уникальность:
	validates :title, :uniqueness => {message: "Наименование не уникально!"};
	#проверка маски вводимого url изображения:
	validates :image_url, :format => {with: /.+\.(gif|png|jpg|jpeg)\Z/i};
end
