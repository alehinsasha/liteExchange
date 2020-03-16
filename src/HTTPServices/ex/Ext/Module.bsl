﻿#Область СтандартныеЗапросы
Функция Запросget(Запрос)
	Ответ = ВыполнитьОбработкуЗапроса(Запрос, "get");	
	Возврат Ответ;
КонецФункции

Функция Запросpost(Запрос)
	Ответ = ВыполнитьОбработкуЗапроса(Запрос, "post");
	Возврат Ответ;
КонецФункции

Функция Запросput(Запрос)
	Ответ = ВыполнитьОбработкуЗапроса(Запрос, "put");	
	Возврат Ответ;
КонецФункции

Функция Запросdelete(Запрос)
	Ответ = ВыполнитьОбработкуЗапроса(Запрос, "delete");
	Возврат Ответ;
КонецФункции

Функция Запросpatch(Запрос)
	Ответ = ВыполнитьОбработкуЗапроса(Запрос);
	Возврат Ответ;
КонецФункции

Процедура ЗаполнитьЗаголовки(Запрос, Ответ)
	
	Origin = Запрос.Заголовки.Получить("Origin");
	Если Origin = Неопределено Тогда
		Ответ.Заголовки.Вставить("Access-Control-Allow-Origin", "*");
	Иначе
		Ответ.Заголовки.Вставить("Access-Control-Allow-Origin", Origin);
	КонецЕсли;	
	Ответ.Заголовки.Вставить("Access-Control-Allow-Headers", "Authorization,Content-type");
	Ответ.Заголовки.Вставить("Access-Control-Allow-Methods", "GET, POST, PUT, DELETE, PATCH");
	
КонецПроцедуры

Функция ЗапросOptions(Запрос)
	Ответ = Новый HTTPСервисОтвет(200);
	ЗаполнитьЗаголовки(Запрос, Ответ);
	Возврат Ответ;
КонецФункции
#КонецОбласти

#Область ОбработкаЗапроса
Функция ВыполнитьОбработкуЗапроса(ДанныеЗапроса, Метод = Неопределено)
	Обработка = леПодключаемыеОбработчики.ПодключитьОбработку("леLiteExchange2");
	Обработка.ВходящиеДанные = ДанныеЗапроса;
	Обработка.Метод          = Метод;
	// передать управление в защищенную обработку
	Обработка.ВыполнитьОбработку();
	Результат = Обработка.ИсходящиеДанные;
	Возврат Результат;
КонецФункции
#КонецОбласти
