

USE kaggle_2;
go
IF NOT EXISTS (SELECT * FROM SYS.TABLES WHERE object_id=OBJECT_ID(N'apple_stock_price')
AND type='U')

Create table apple_stock_price(
	Date_ datetime,
	Open_ DECIMAL(12, 6),
	High_ DECIMAL(12, 6),
	Low_ DECIMAL(12, 6),
	Close_ DECIMAL(12, 6),
	Adj_Close DECIMAL(12, 6),
	Volume bigint
	);
GO

Truncate table apple_stock_price
GO
-- Importar la data de mi archivo AAPL.csv
BULK INSERT apple_stock_price
FROM 'F:\User\Documents\CERTUS\Proyecto_Parcial_2\python\dataset\AAPL.csv'  --Ubicacion del archivo
WITH
( 
	Firstrow= 2, --Esto sirve para empezar a colocar los datos desde la segunda fila sabien que hay encabezado
	Fieldterminator = ',', --Delimitador de las columnas
	Rowterminator = '0x0a'
)
GO
