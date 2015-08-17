select * from sys.columns 
where object_id IN 
		(
			SELECT object_id from sys.objects where name in 
					(
						'ThemeAttribute','ThemeFunction','ThemeFunctionAttribute','ThemeResource','ThemeResourceAttribute','ThemeLookup','ThemeTask',
						'FunctionAttribute','FunctionLookup','FunctionTask','FunctionResource','FunctionResourceAttribute',
						'StyleAttribute','StyleLookup','StyleTask','StyleResource','StyleResourceAttribute',
						'ResourceAllowedTransport','ResourceAttribute','ResourceCapacity','ResourceLookup','ResourcePackage','ResourceStorageRoom'
					)
			and object_id NOT in (SELECT object_ID from sys.columns where name = 'PropertyID'))
