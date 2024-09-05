﻿#language: ru

@tree

Функционал: Проверка расчета поля количество (итог) документа Заказ

Как тестровщик я хочу
создать документ Заказ
чтобы проверить расчет поля количество (итог)  

Контекст:
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий

Сценарий: Проверка расчета поля количество (итог)
* Открытие формы документа создание
	И В командном интерфейсе я выбираю "Продажи" "Заказ"
	Тогда открылось окно "Заказ (создание)"
* Заполнение шапки заказа
	И Заполнение шапки документа Заказ
* Заполнение товарной части	
	И в таблице 'Товары' я нажимаю на кнопку с именем 'ТоварыДобавить'
	И в таблице 'Товары' из выпадающего списка с именем 'ТоварыТовар' я выбираю точное значение "Валенки"
	И я перехожу к следующему реквизиту
	И в таблице 'Товары' я завершаю редактирование строки
	И в таблице 'Товары' я нажимаю на кнопку с именем 'ТоварыДобавить'
	И в таблице 'Товары' из выпадающего списка с именем 'ТоварыТовар' я выбираю точное значение "Босоножки"
	И я перехожу к следующему реквизиту
	И в таблице 'Товары' я завершаю редактирование строки
* Номер
	И я нажимаю на кнопку с именем 'ФормаЗаписать'
	И я запоминаю значение поля "Номер" как "Номер"
* Проведение заказа	
	И я нажимаю на кнопку с именем 'ФормаПровестиИЗакрыть'
	И я жду закрытия окна "Заказ (создание) *" в течение 20 секунд
* Переход в созданный заказ
	И В командном интерфейсе я выбираю "Продажи" "Заказы"
	Тогда открылось окно "Заказы товаров"
	И в таблице 'Список' я перехожу к строке
			| 'Номер' |
			| '$Номер$' |
	И в таблице 'Список' я выбираю текущую строку
* Изменение количества и цены
	Когда открылось окно "Заказ * от *"
	И в таблице 'Товары' я перехожу к строке:
		| "Количество" | "Сумма"    | "Товар"     | "Цена"     |
		| "1"          | "1 800,00" | "Валенки"   | "1 800,00" |
	И в таблице 'Товары' в поле с именем 'ТоварыЦена' я ввожу текст "1 000,00"
	И в таблице 'Товары' я активизирую поле с именем 'ТоварыКоличество'
	И в таблице 'Товары' в поле с именем 'ТоварыКоличество' я ввожу текст "3"
	И в таблице 'Товары' я завершаю редактирование строки
	И в таблице 'Товары' я перехожу к строке:
		| "Количество" | "Сумма"    | "Товар"     | "Цена"     |
		| "1"          | "1 800,00" | "Босоножки"   | "1 800,00" |
	И в таблице 'Товары' в поле с именем 'ТоварыЦена' я ввожу текст "500,00"
	И в таблице 'Товары' в поле с именем 'ТоварыКоличество' я ввожу текст "4"
	И в таблице 'Товары' я завершаю редактирование строки
* Проверка расчета поля количество (итог) документа Заказ
	И элемент формы 'Количество (итог)' стал равен '7'
	И элемент формы с именем 'ТоварыИтогКоличество' стал равен '7'

	И представление элемента с именем 'ТоварыИтогКоличество' стало равно '7'


	


