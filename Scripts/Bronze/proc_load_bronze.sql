Create or alter procedure bronze.load_bronze as 
Begin
Declare @start_date Datetime , @end_date Datetime;
set @start_date= GETDATE();
	begin try
		Truncate table [bronze].[erp_px_cat_g1v2];
		Bulk insert [bronze].[erp_px_cat_g1v2]
		from 'C:\Users\JayasuryaK\Downloads\01_datasets\source_erp\PX_CAT_G1V2.CSV'
		with (
			firstrow=2,
			Fieldterminator=',',
			TABLOCK);
end try 
	begin catch 
		print 'error occured during' + ERROR_MESSAGE();
		END CATCH
		begin try
		Truncate table [bronze].[erp_loc_a101];	
		Bulk insert [bronze].[erp_loc_a101]
		from 'C:\Users\JayasuryaK\Downloads\01_datasets\source_erp\LOC_A101.CSV'
		with (
			firstrow=2,
			Fieldterminator=',',
			TABLOCK);
end try 
	begin catch 
		print 'error occured during' + ERROR_MESSAGE();
		END CATCH
		begin try
		Truncate table [bronze].[erp_cust_az12];	
		Bulk insert [bronze].[erp_cust_az12]
		from 'C:\Users\JayasuryaK\Downloads\01_datasets\source_erp\CUST_AZ12.CSV'
		with (
			firstrow=2,
			Fieldterminator=',',
			TABLOCK);
end try 
	begin catch 
		print 'error occured during' + ERROR_MESSAGE();
		END CATCH
		begin try
		Truncate table [bronze].[crm_sales_details];
		Bulk insert [bronze].[crm_sales_details]
		from 'C:\Users\JayasuryaK\Downloads\01_datasets\source_crm\sales_details.CSV'
		with (
			firstrow=2,
			Fieldterminator=',',
			TABLOCK);
end try 
	begin catch 
		print 'error occured during' + ERROR_MESSAGE();
		END CATCH
		begin try
		Truncate table [bronze].[crm_prd_info];
		Bulk insert [bronze].[crm_prd_info]
		from 'C:\Users\JayasuryaK\Downloads\01_datasets\source_crm\prd_info.csv'
		with (
			firstrow=2,
			Fieldterminator=',',
			TABLOCK);
end try 
	begin catch 
		print 'error occured during' + ERROR_MESSAGE();
		END CATCH
		begin try
		Truncate table [bronze].[crm_cust_info];
		Bulk insert [bronze].[crm_cust_info]
		from 'C:\Users\JayasuryaK\Downloads\01_datasets\source_crm\cust_info.csv'
		with (
			firstrow=2,
			Fieldterminator=',',
			TABLOCK);	
	end try 
	begin catch 
		print 'error occured during' + ERROR_MESSAGE();
		END CATCH
		set @end_date= GETDATE();
		print '>>> Load duration :'+cast(Datediff(second,@start_date,@end_date) as nvarchar) +' seconds';
end
