// ----------------------------------------------------------
// This Source Code Form is subject to the terms of the
// Mozilla Public License, v.2.0. If a copy of the MPL
// was not distributed with this file, You can obtain one
// at http://mozilla.org/MPL/2.0/.
// ----------------------------------------------------------

Перем МенеджерОбработкиДанных;  // ВнешняяОбработкаОбъект - обработка-менеджер, вызвавшая данный обработчик
Перем Идентификатор;            // Строка                 - идентификатор обработчика, заданный обработкой-менеджером
Перем ПараметрыОбработки;       // Структура              - параметры обработки
Перем Лог;

Перем ИмяПользователя;          // Строка                 - имя пользователя сайта релизов 1С
Перем ПарольПользователя;       // Строка                 - пароль пользователя сайта релизов 1С

Перем ФильтрПриложений;         // Массив(Строка)         - фильтр имен приложений
Перем ФильтрВерсий;             // Массив(Строка)         - фильтр номеров версий
Перем ФильтрВерсийНачинаяСДаты; // Дата                   - фильтр по начальной дате версии (включая)
Перем ФильтрВерсийДоДаты;       // Дата                   - фильтр по последней дате версии (включая)

Перем НакопленныеДанные;        // Массив(Структура)      - результаты обработки данных

#Область ПрограммныйИнтерфейс

// Функция - признак возможности обработки, принимать входящие данные
// 
// Возвращаемое значение:
//	Булево - Истина - обработка может принимать входящие данные для обработки;
//	         Ложь - обработка не принимает входящие данные;
//
Функция ПринимаетДанные() Экспорт
	
	Возврат Ложь;
	
КонецФункции // ПринимаетДанные()

// Функция - признак возможности обработки, возвращать обработанные данные
// 
// Возвращаемое значение:
//	Булево - Истина - обработка может возвращать обработанные данные;
//	         Ложь - обработка не возвращает данные;
//
Функция ВозвращаетДанные() Экспорт
	
	Возврат Истина;
	
КонецФункции // ВозвращаетДанные()

// Функция - возвращает список параметров обработки
// 
// Возвращаемое значение:
//	Структура                                - структура входящих параметров обработки
//      *Тип                    - Строка         - тип параметра
//      *Обязательный           - Булево         - Истина - параметр обязателен
//      *ЗначениеПоУмолчанию    - Произвольный   - значение параметра по умолчанию
//      *Описание               - Строка         - описание параметра
//
Функция ОписаниеПараметров() Экспорт
	
	Параметры = Новый Структура();
	
	ДобавитьОписаниеПараметра(Параметры,
	                          "ИмяПользователя",
	                          "Строка",
	                          Истина,
	                          "",
	                          "Имя пользователя сайта релизов 1С");
	
	ДобавитьОписаниеПараметра(Параметры,
	                          "ПарольПользователя",
	                          "Строка",
	                          Истина,
	                          "",
	                          "Пароль пользователя сайта релизов 1С");
	
	ДобавитьОписаниеПараметра(Параметры,
	                          "ФильтрПриложений",
	                          "Массив",
	                          Истина,
	                          "",
	                          "Фильтр имен приложений");
	
	ДобавитьОписаниеПараметра(Параметры,
	                          "ФильтрВерсий",
	                          "Массив",
	                          Истина,
	                          "",
	                          "Фильтр номеров версий");

	ДобавитьОписаниеПараметра(Параметры,
	                          "ФильтрВерсийНачинаяСДаты",
	                          "Дата",
	                          Истина,
	                          "",
	                          "Фильтр по начальной дате версии (включая)");

	ДобавитьОписаниеПараметра(Параметры,
	                          "ФильтрВерсийДоДаты",
	                          "Дата",
	                          Истина,
	                          "",
	                          "Фильтр по последней дате версии (включая)");

	  Возврат Параметры;
	
КонецФункции // ОписаниеПараметров()

// Функция - Возвращает обработку - менеджер
// 
// Возвращаемое значение:
//	ВнешняяОбработкаОбъект - обработка-менеджер
//
Функция МенеджерОбработкиДанных() Экспорт
	
	Возврат МенеджерОбработкиДанных;
	
КонецФункции // МенеджерОбработкиДанных()

// Процедура - Устанавливает обработку - менеджер
//
// Параметры:
//	НовыйМенеджерОбработкиДанных      - ВнешняяОбработкаОбъект - обработка-менеджер
//
Процедура УстановитьМенеджерОбработкиДанных(Знач НовыйМенеджерОбработкиДанных) Экспорт
	
	МенеджерОбработкиДанных = НовыйМенеджерОбработкиДанных;
	
КонецПроцедуры // УстановитьМенеджерОбработкиДанных()

// Функция - Возвращает идентификатор обработчика
// 
// Возвращаемое значение:
//	Строка - идентификатор обработчика
//
Функция Идентификатор() Экспорт
	
	Возврат Идентификатор;
	
КонецФункции // Идентификатор()

// Процедура - Устанавливает идентификатор обработчика
//
// Параметры:
//	НовыйИдентификатор      - Строка - новый идентификатор обработчика
//
Процедура УстановитьИдентификатор(Знач НовыйИдентификатор) Экспорт
	
	Идентификатор = НовыйИдентификатор;
	
КонецПроцедуры // УстановитьИдентификатор()

// Функция - Возвращает значения параметров обработки
// 
// Возвращаемое значение:
//	Структура - параметры обработки
//
Функция ПараметрыОбработкиДанных() Экспорт
	
	Возврат ПараметрыОбработки;
	
КонецФункции // ПараметрыОбработкиДанных()

// Процедура - Устанавливает значения параметров обработки данных
//
// Параметры:
//	НовыеПараметры      - Структура     - значения параметров обработки
//
Процедура УстановитьПараметрыОбработкиДанных(Знач НовыеПараметры) Экспорт
	
	ПараметрыОбработки = НовыеПараметры;
	
	ИмяПользователя = "";
	Если ПараметрыОбработки.Свойство("ИмяПользователя") Тогда
		ИмяПользователя = ПараметрыОбработки.ИмяПользователя;
	КонецЕсли;

	ПарольПользователя = "";
	Если ПараметрыОбработки.Свойство("ПарольПользователя") Тогда
		ПарольПользователя = ПараметрыОбработки.ПарольПользователя;
	КонецЕсли;

	ФильтрПриложений = Новый Массив();
	Если ПараметрыОбработки.Свойство("ФильтрПриложений") Тогда
		Если ТипЗнч(ПараметрыОбработки.ФильтрПриложений) = Тип("Массив") Тогда
			ФильтрПриложений = ПараметрыОбработки.ФильтрПриложений;
		Иначе
			ФильтрПриложений = СтрРазделить(ПараметрыОбработки.ФильтрПриложений, "|");
		КонецЕсли;
	КонецЕсли;

	ФильтрВерсий = Новый Массив();
	Если ПараметрыОбработки.Свойство("ФильтрВерсий") Тогда
		Если ТипЗнч(ПараметрыОбработки.ФильтрВерсий) = Тип("Массив") Тогда
			ФильтрВерсий = ПараметрыОбработки.ФильтрВерсий;
		Иначе
			ФильтрВерсий = СтрРазделить(ПараметрыОбработки.ФильтрПриложений, "|");
		КонецЕсли;
	КонецЕсли;

	ФильтрВерсийНачинаяСДаты = "";
	Если ПараметрыОбработки.Свойство("ФильтрВерсийНачинаяСДаты") Тогда
		ФильтрВерсийНачинаяСДаты = ПараметрыОбработки.ФильтрВерсийНачинаяСДаты;
	КонецЕсли;

	ФильтрВерсийДоДаты = "";
	Если ПараметрыОбработки.Свойство("ФильтрВерсийДоДаты") Тогда
		ФильтрВерсийДоДаты = ПараметрыОбработки.ФильтрВерсийДоДаты;
	КонецЕсли;

КонецПроцедуры // УстановитьПараметрыОбработкиДанных()

// Функция - Возвращает значение параметра обработки данных
// 
// Параметры:
//	ИмяПараметра      - Строка           - имя получаемого параметра
//
// Возвращаемое значение:
//	Произвольный      - значение параметра
//
Функция ПараметрОбработкиДанных(Знач ИмяПараметра) Экспорт
	
	Если НЕ ТипЗнч(ПараметрыОбработки) = Тип("Структура") Тогда
		Возврат Неопределено;
	КонецЕсли;
	
	Если НЕ ПараметрыОбработки.Свойство(ИмяПараметра) Тогда
		Возврат Неопределено;
	КонецЕсли;
	
	Возврат ПараметрыОбработки[ИмяПараметра];
	
КонецФункции // ПараметрОбработкиДанных()

// Процедура - Устанавливает значение параметра обработки
//
// Параметры:
//	ИмяПараметра      - Строка           - имя устанавливаемого параметра
//	Значение          - Произвольный     - новое значение параметра
//
Процедура УстановитьПараметрОбработкиДанных(Знач ИмяПараметра, Знач Значение) Экспорт
	
	Если НЕ ТипЗнч(ПараметрыОбработки) = Тип("Структура") Тогда
		ПараметрыОбработки = Новый Структура();
	КонецЕсли;
	
	ПараметрыОбработки.Вставить(ИмяПараметра, Значение);

	Если ВРег(ИмяПараметра) = ВРег("ИмяПользователя") Тогда
		ИмяПользователя = Значение;
	ИначеЕсли ВРег(ИмяПараметра) = ВРег("ПарольПользователя") Тогда
		ПарольПользователя = Значение;
	ИначеЕсли ВРег(ИмяПараметра) = ВРег("ФильтрПриложений") Тогда
		Если ТипЗнч(Значение) = Тип("Массив") Тогда
			ФильтрПриложений = Значение;
		Иначе
			ФильтрПриложений = СтрРазделить(Значение, "|");
		КонецЕсли;
	ИначеЕсли ВРег(ИмяПараметра) = ВРег("ПолучатьВерсии") Тогда
		ПолучатьВерсии = Значение;
	ИначеЕсли ВРег(ИмяПараметра) = ВРег("ФильтрВерсий") Тогда
		Если ТипЗнч(Значение) = Тип("Массив") Тогда
			ФильтрВерсий = Значение;
		Иначе
			ФильтрВерсий = СтрРазделить(Значение, "|");
		КонецЕсли;
	ИначеЕсли ВРег(ИмяПараметра) = ВРег("ФильтрВерсийНачинаяСДаты") Тогда
		ФильтрВерсийНачинаяСДаты = Значение;
	ИначеЕсли ВРег(ИмяПараметра) = ВРег("ФильтрВерсийДоДаты") Тогда
		ФильтрВерсийДоДаты = Значение;
	Иначе
		Возврат;
	КонецЕсли;
	
КонецПроцедуры // УстановитьПараметрОбработкиДанных()

// Процедура - устанавливает данные для обработки
//
// Параметры:
//	Данные      - Структура     - значения параметров обработки
//
Процедура УстановитьДанные(Знач ВходящиеДанные) Экспорт
	
КонецПроцедуры // УстановитьДанные()

// Процедура - выполняет обработку данных
//
Процедура ОбработатьДанные() Экспорт
	
	Обозреватель = Новый ОбозревательСайта1С(ИмяПользователя, ПарольПользователя);

	НакопленныеДанные = Обозреватель.ПолучитьСписокПриложений(ФильтрПриложений);

	Для Каждого ТекЭлемент Из НакопленныеДанные Цикл
		ВерсииПриложения = Обозреватель.ПолучитьВерсииПриложения(ТекЭлемент.Путь,
		                                                         ФильтрВерсий,
		                                                         ФильтрВерсийНачинаяСДаты,
		                                                         ФильтрВерсийДоДаты);
		ТекЭлемент.Вставить("Версии", ВерсииПриложения);

		ПродолжениеОбработкиДанныхВызовМенеджера(ТекЭлемент);
	КонецЦикла;

	ЗавершениеОбработкиДанныхВызовМенеджера();

КонецПроцедуры // ОбработатьДанные()

// Функция - возвращает текущие результаты обработки
//
// Возвращаемое значение:
//	Произвольный     - результаты обработки данных
//
Функция РезультатОбработки() Экспорт
	
	Возврат НакопленныеДанные;
	
КонецФункции // РезультатОбработки()

// Процедура - выполняет действия при окончании обработки данных
// и оповещает обработку-менеджер о завершении обработки данных
//
Процедура ЗавершениеОбработкиДанных() Экспорт
	
	Лог.Информация("[%1]: Завершение обработки данных.", ТипЗнч(ЭтотОбъект));

	ЗавершениеОбработкиДанныхВызовМенеджера();
	
КонецПроцедуры // ЗавершениеОбработкиДанных()

#КонецОбласти // ПрограммныйИнтерфейс

#Область СлужебныйПрограммныйИнтерфейс

// Функция - возвращает объект управления логированием
//
// Возвращаемое значение:
//  Объект      - объект управления логированием
//
Функция Лог() Экспорт
	
	Возврат Лог;

КонецФункции // Лог()

// Процедура - устанавливает описание команды
//
// Параметры:
//  Команда    - КомандаПриложения     - объект описание команды
//
Процедура ОписаниеКоманды(Команда) Экспорт
	
	Команда.Опция("af app-filter", "", "фильтр приложений")
	       .ТСтрока()
	       .ВОкружении("YARD_RELEASES_APP_FILTER");

	Команда.Опция("vf version-filter", "", "фильтр версий")
	       .ТСтрока()
	       .ВОкружении("YARD_RELEASES_VERSION_FILTER");

	Команда.Опция("vsd version-start-date", "", "фильтр по начальной дате версии (включая)")
	       .ТСтрока()
	       .ВОкружении("YARD_RELEASES_VERSION_START_DATE");

	Команда.Опция("ved version-end-date", "", "фильтр по последней дате версии (включая)")
	       .ТСтрока()
	       .ВОкружении("YARD_RELEASES_VERSION_END_DATE");

КонецПроцедуры // ОписаниеКоманды()

// Процедура - запускает выполнение команды устанавливает описание команды
//
// Параметры:
//  Команда    - КомандаПриложения     - объект  описание команды
//
Процедура ВыполнитьКоманду(Знач Команда) Экспорт

	ВыводОтладочнойИнформации = Команда.ЗначениеОпции("verbose");

	ПараметрыПриложения.УстановитьРежимОтладки(ВыводОтладочнойИнформации);

	УстановитьПараметрОбработкиДанных("ИмяПользователя"          , Команда.ЗначениеОпции("user"));
	УстановитьПараметрОбработкиДанных("ПарольПользователя"       , Команда.ЗначениеОпции("password"));
	УстановитьПараметрОбработкиДанных("ФильтрПриложений"         , Команда.ЗначениеОпции("app-filter"));
	УстановитьПараметрОбработкиДанных("ФильтрВерсий"             , Команда.Значениеопции("version-filter"));

	ВремДата = ДатаИзСтроки(Команда.ЗначениеОпции("version-start-date"));
	УстановитьПараметрОбработкиДанных("ФильтрВерсийНачинаяСДаты" , ВремДата);

	ВремДата = ДатаИзСтроки(Команда.ЗначениеОпции("version-end-date"));
	УстановитьПараметрОбработкиДанных("ФильтрВерсийДоДаты"       , ВремДата);

	ОбработатьДанные();

	Для Каждого ТекЭлемент Из НакопленныеДанные Цикл
		
		Для Каждого ТекСвойство Из ТекЭлемент Цикл
			Если ТекСвойство.Ключ = "Версии" Тогда
				Продолжить;
			КонецЕсли;
			Сообщить(СтрШаблон("%1 : %2", ТекСвойство.Ключ, ТекСвойство.Значение));
		КонецЦикла;

		Для Каждого ТекВерсия Из ТекЭлемент.Версии Цикл
			Для Каждого ТекСвойство Из ТекВерсия Цикл
				Сообщить(СтрШаблон("%1%1%2 : %3", Символы.Таб, ТекСвойство.Ключ, ТекСвойство.Значение));
			КонецЦикла;
		КонецЦикла;
	КонецЦикла;

КонецПроцедуры // ВыполнитьКоманду()

#КонецОбласти // СлужебныйПрограммныйИнтерфейс

#Область СлужебныеПроцедурыВызоваМенеджераОбработкиДанных

// Процедура - выполняет действия обработки элемента данных
// и оповещает обработку-менеджер о продолжении обработки элемента
//
//	Параметры:
//		Элемент    - Произвольный     - Элемент данных для продолжения обработки
//
Процедура ПродолжениеОбработкиДанныхВызовМенеджера(Элемент)
	
	Если МенеджерОбработкиДанных = Неопределено Тогда
		Возврат;
	КонецЕсли;
	
	МенеджерОбработкиДанных.ПродолжениеОбработкиДанных(Элемент, Идентификатор);
	
КонецПроцедуры // ПродолжениеОбработкиДанныхВызовМенеджера()

// Процедура - выполняет действия при окончании обработки данных
// и оповещает обработку-менеджер о завершении обработки данных
//
Процедура ЗавершениеОбработкиДанныхВызовМенеджера()
	
	Если МенеджерОбработкиДанных = Неопределено Тогда
		Возврат;
	КонецЕсли;
	
	МенеджерОбработкиДанных.ЗавершениеОбработкиДанных(Идентификатор);
	
КонецПроцедуры // ЗавершениеОбработкиДанныхВызовМенеджера()

#КонецОбласти // СлужебныеПроцедурыВызоваМенеджераОбработкиДанных

#Область СлужебныеПроцедурыИФункции

// Процедура - добавляет описание параметра обработки
// 
// Параметры:
//     ОписаниеПараметров     - Структура      - структура описаний параметров
//     Параметр               - Строка         - имя параметра
//     Тип                    - Строка         - список возможных типов параметра
//     Обязательный           - Булево         - Истина - параметр обязателен
//     ЗначениеПоУмолчанию    - Произвольный   - значение параметра по умолчанию
//     Описание               - Строка         - описание параметра
//
Процедура ДобавитьОписаниеПараметра(ОписаниеПараметров
	                              , Параметр
	                              , Тип
	                              , Обязательный = Ложь
	                              , ЗначениеПоУмолчанию = Неопределено
	                              , Описание = "")
	
	Если НЕ ТипЗнч(ОписаниеПараметров) = Тип("Структура") Тогда
		ОписаниеПараметров = Новый Структура();
	КонецЕсли;
	
	ОписаниеПараметра = Новый Структура();
	ОписаниеПараметра.Вставить("Тип"                , Тип);
	ОписаниеПараметра.Вставить("Обязательный"       , Обязательный);
	ОписаниеПараметра.Вставить("ЗначениеПоУмолчанию", ЗначениеПоУмолчанию);
	ОписаниеПараметра.Вставить("Описание"           , Описание);
	
	ОписаниеПараметров.Вставить(Параметр, ОписаниеПараметра);
	
КонецПроцедуры // ДобавитьОписаниеПараметра()

// Функция - преобразует строковое значение даты в формате "дд.мм.гг" или "дд.мм.гггг" в дату
//
// Параметры:
//	ДатаСтрокой     - Строка     - дата в формате "дд.мм.гг" или "дд.мм.гггг"
//
// Возвращаемое значение:
//	Дата     - преобразованное значение
//
Функция ДатаИзСтроки(Знач ДатаСтрокой)

	ВремЧастиДаты = СтрРазделить(ДатаСтрокой, ".");

	КоличествоЧастейДаты = 3;

	Если ВремЧастиДаты.Количество() < КоличествоЧастейДаты Тогда
		Возврат '00010101000000';
	КонецЕсли;

	Попытка
		Если СтрДлина(ВремЧастиДаты[2]) = 4 Тогда
			Возврат Дата(СтрШаблон("%1%2%3%4", ВремЧастиДаты[2], ВремЧастиДаты[1], ВремЧастиДаты[0], "000000"));
		ИначеЕсли СтрДлина(ВремЧастиДаты[2]) = 2 Тогда
			Возврат Дата(СтрШаблон("20%1%2%3%4", ВремЧастиДаты[2], ВремЧастиДаты[1], ВремЧастиДаты[0], "000000"));
		Иначе
			Возврат '00010101000000';
		КонецЕсли;
	Исключение
		Возврат '00010101000000';
	КонецПопытки;

КонецФункции // ДатаИзСтроки()

#КонецОбласти // СлужебныеПроцедурыИФункции

#Область ОбработчикиСобытий

// Процедура - обработчик события "ПриСозданииОбъекта"
//
// Параметры:
//  Менеджер	 - МенеджерОбработкиДанных    - менеджер обработки данных - владелец
// 
// BSLLS:UnusedLocalMethod-off
Процедура ПриСозданииОбъекта(Менеджер = Неопределено)

	УстановитьМенеджерОбработкиДанных(Менеджер);

	Лог = ПараметрыПриложения.Лог();

	Лог.Информация("[%1]: Инициализирован обработчик", ТипЗнч(ЭтотОбъект));

КонецПроцедуры // ПриСозданииОбъекта()
// BSLLS:UnusedLocalMethod-on

#КонецОбласти // ОбработчикиСобытий
