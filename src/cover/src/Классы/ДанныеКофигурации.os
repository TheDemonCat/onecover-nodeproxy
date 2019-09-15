#Использовать xml-parser

Перем ПутьКФайлуКонфигурации;
Перем ДанныеОбъектов;
Перем ТипыМодулей;

Процедура ПриСозданииОбъекта(ПутьКИсходникам) Экспорт 

	ТипыМодулей = Новый Соответствие;
	ИнициализацияТипыМодулей();
	ДанныеОбъектов = Новый Соответствие;
	ПроцессорXML = Новый СериализацияДанныхXML();
	
	ПутьКФайлуКонфигурации = ПутьКИсходникам + ПолучитьРазделительПути() + "ConfigDumpInfo.xml"; 
	РезультатЧтения = ПроцессорXML.ПрочитатьИзФайла(ПутьКФайлуКонфигурации);
	ДанныеXML = РезультатЧтения.Получить("ConfigDumpInfo")["_Элементы"]["ConfigVersions"];

	Для Каждого ДанныеКлюч Из ДанныеXML Цикл

		ОбъектКонфигурации = ДанныеКлюч["Metadata"]["_Атрибуты"];
		ДанныеОбъектов.Вставить(ОбъектКонфигурации.Получить("id"), ОбъектКонфигурации.Получить("name"));

	КонецЦикла;

	// СохранитьДанные();

КонецПроцедуры	

Функция ОпределитьМодульПоId(IdОбъекта, idМодуля = "") Экспорт

	ИмяМодуля = ДанныеОбъектов.Получить(IdОбъекта);

	Если НЕ ЗначениеЗаполнено(ИмяМодуля) Тогда
		ИмяМодуля = IdОбъекта;
	КонецЕсли;	

	Модуль = ИмяМодуля + "." + ТипМодуля(idМодуля);

	Возврат Модуль;

КонецФункции	

Процедура СохранитьДанные()

	ПомошникЗаписи.ЗаписатьВJson(ДанныеОбъектов, "./out/tempdata.json");

КонецПроцедуры

Функция ТипМодуля(idТипа)

	ТипМодуля = ТипыМодулей.Получить(idТипа);
	Если ТипМодуля = Неопределено Тогда
		ТипМодуля = idТипа;
	КонецЕсли;	

	Возврат ТипМодуля;

КонецФункции	

Процедура ИнициализацияТипыМодулей()

	ТипыМодулей.Вставить("a637f77f-3840-441d-a1c3-699c8c5cb7e0", "ObjectModule");
	ТипыМодулей.Вставить("d1b64a2c-8078-4982-8190-8f81aefda192", "ManagerModule");
	ТипыМодулей.Вставить("d5963243-262e-4398-b4d7-fb16d06484f6", "Module");
	ТипыМодулей.Вставить("32e087ab-1491-49b6-aba7-43571b41ac2b", "Form\Module");
	ТипыМодулей.Вставить("9b7bbbae-9771-46f2-9e4d-2489e0ffc702", "SessionModule");
	ТипыМодулей.Вставить("d22e852a-cf8a-4f77-8ccb-3548e7792bea", "ManagedApplicationModule");
	ТипыМодулей.Вставить("078a6af8-d22c-4248-9c33-7e90075a3d2c", "CommandModule");
	ТипыМодулей.Вставить("9f36fd70-4bf4-47f6-b235-935f73aab43f", "RecordSetModule");
    ТипыМодулей.Вставить("0c8cad23-bf8c-468e-b49e-12f1927c048b", "ManagerModule");


КонецПроцедуры	