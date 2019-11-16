Перем ИменаПапок;
Перем Разделитель;

Функция ПутьКонфигуратора(Модуль) Экспорт

	ЧастиИмен = СтрРазделить(Модуль, ".");

	
	НачальныйКаталог =  ИменаПапок.Получить(ЧастиИмен[0]);
	Если НачальныйКаталог = Неопределено Тогда
		НачальныйКаталог = ЧастиИмен[0] + "s";
	КонецЕсли;	

	// fixMe
	Если СтрНайти(НачальныйКаталог, "-") > 0 Тогда
		Возврат "";
	КонецЕсли;	

	Если НачальныйКаталог = Неопределено Тогда
		Возврат "";
	КонецЕсли;	

	ПутьМетаданного = "";
	Если НЕ ПустаяСтрока(НачальныйКаталог) Тогда
		ПутьМетаданного = НачальныйКаталог + Разделитель + ЧастиИмен[1];
	КонецЕсли;

	Если ЧастиИмен[ЧастиИмен.ВГраница() - 2] = "Form" Тогда
		ПутьМетаданного = ПутьМетаданного + Разделитель + "Forms" + Разделитель + ЧастиИмен[ЧастиИмен.ВГраница() - 1];		
	КонецЕсли;	

	ПутьМетаданного = ПутьМетаданного + Разделитель + "Ext";

	Путь = ПутьМетаданного + Разделитель + ЧастиИмен[ЧастиИмен.ВГраница()] + ".bsl";

	Возврат Путь;

КонецФункции	


Процедура Инициализация()
	
	ИменаПапок = Новый Соответствие;
	ИменаПапок.Вставить("Catalog", "Catalogs");
	ИменаПапок.Вставить("Document", "Documents");
	ИменаПапок.Вставить("Configuration", "");
	ИменаПапок.Вставить("CommonModule", "CommonModules");
	ИменаПапок.Вставить("DataProcessor", "DataProcessors");
	ИменаПапок.Вставить("Report", "Reports");
	ИменаПапок.Вставить("InformationRegister", "InformationRegisters");
	ИменаПапок.Вставить("CommonForm", "CommonForms");
	ИменаПапок.Вставить("ChartOfAccounts", "ChartsOfAccounts");
	ИменаПапок.Вставить("ChartOfCalculationTypes", "ChartsOfCalculationTypes");
	ИменаПапок.Вставить("ChartOfCharacteristicTypes", "ChartsOfCharacteristicTypes");

	Разделитель = ПолучитьРазделительПути();
КонецПроцедуры	

Функция ТипыМодулей() Экспорт

	ТипыМодулей = Новый Соответствие;
	ТипыМодулей.Вставить("a637f77f-3840-441d-a1c3-699c8c5cb7e0", "ObjectModule");
	ТипыМодулей.Вставить("d1b64a2c-8078-4982-8190-8f81aefda192", "ManagerModule");
	ТипыМодулей.Вставить("d5963243-262e-4398-b4d7-fb16d06484f6", "Module");
	ТипыМодулей.Вставить("32e087ab-1491-49b6-aba7-43571b41ac2b", "Form\Module");
	ТипыМодулей.Вставить("9b7bbbae-9771-46f2-9e4d-2489e0ffc702", "SessionModule");
	ТипыМодулей.Вставить("d22e852a-cf8a-4f77-8ccb-3548e7792bea", "ManagedApplicationModule");
	ТипыМодулей.Вставить("078a6af8-d22c-4248-9c33-7e90075a3d2c", "CommandModule");
	ТипыМодулей.Вставить("9f36fd70-4bf4-47f6-b235-935f73aab43f", "RecordSetModule");
    ТипыМодулей.Вставить("0c8cad23-bf8c-468e-b49e-12f1927c048b", "ManagerModule");

	Возврат ТипыМодулей;
	
КонецФункции	
	
Инициализация();

