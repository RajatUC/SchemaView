SELECT * into #temp

FROM    [Rpt].[CustomerList] --put your table name here




SELECT 

     '[' + c.column_name + '] ' 

        + c.data_type 

            + CASE WHEN c.data_type IN ('decimal')

                THEN isnull('(' + convert(nvarchar, c.numeric_precision) + ', ' + convert(varchar, c.numeric_scale) + ')', '') 

                ELSE '' END

            + CASE WHEN CHARINDEX('char', c.data_type) > 0 then '(' + cast(CHARACTER_MAXIMUM_LENGTH as nvarchar(20)) + ')' else '' end

            + CASE WHEN c.IS_NULLABLE = 'YES' THEN ' NULL' ELSE '' END

        + ','

From 

    tempdb.INFORMATION_SCHEMA.COLUMNS c 

WHERE 

    TABLE_NAME LIKE '#temp%'