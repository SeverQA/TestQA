#language: ru

@tree

Функционал: Создание 10 элементов справочника Номенклатура с разными наименованиями

Как Тестировщик я хочу
Создать 10 элементов справочника Номенклатура с разными наименованиями
чтобы создать большой объем данных  

Контекст:
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий

Сценарий: Создание 10 элементов справочника Номенклатура с разными наименованиями
	И я перехожу по навигационной ссылке "e1cib/list/Catalog.Items"
	И Я запоминаю значение выражения '6' в переменную "Шаг"
	И я делаю 10 раз
		И Я запоминаю значение выражения '$Шаг$ + 1' в переменную "Шаг"
		И Я запоминаю значение выражения '"Номенклатура"+ $Шаг$' в переменную "НоваяНоменклатура"
		And I check or create catalog "Items" objects:
				| 'Ref'                                                              | 'DeletionMark' | 'Code' | 'ItemType'                                                          | 'Unit'                                                          | 'MainPricture'                          | 'Vendor' | 'ItemID' | 'PackageUnit' | 'Description_en'      | 'Description_hash' | 'Description_ru' | 'Description_tr' | 'Height' | 'Length' | 'Volume' | 'Weight' | 'Width' |
				| '{e1cib/data/Catalog.Items?ref=" + StrReplace(New UUID, "-", "")}' | 'False'        |  5     | 'e1cib/data/Catalog.ItemTypes?ref=b762b13668d0905011eb76684b9f6878' | 'e1cib/data/Catalog.Units?ref=b762b13668d0905011eb76684b9f687b' | 'ValueStorage:AQEIAAAAAAAAAO+7v3siVSJ9' | ''       | '58795'  | ''            | '$НоваяНоменклатура$' | ''                 | ''               | ''               |          |          |          |          |         |





//			| 'Ref'                                                               | 'DeletionMark' | 'Code' | 'Item' | 'Quantity' | 'BasisUnit'                                                     | 'UOM' | 'Description_en'     | 'Description_hash' | 'Description_ru' | 'Description_tr' | 'Height' | 'Length' | 'Volume' | 'Weight' | 'Width' |
//			| '{"e1cib/data/Catalog.Units?ref=" + StrReplace(New UUID, "-", "")}' | 'False'        |        | ''     | 1          | ''                                                              | ''    | '$ЕдиницаИзмерения$' | ''                 | ''               | ''               |          |          |          |          |         |
