<cfset fileDir = application.configBean.getFileDir()>
<cfset rs = application.settingsManager.getList()>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>S3 File Download</title>
	</head>
	<body>
		<ul>
			<cfoutput query="rs">
				<cfif rs.siteID neq "default">
					<cfset directoryCopy('#request.muraSysEnv.MURA_S3ASSETS#/#rs.siteID#/', '#fileDir#/#rs.siteID#/', true)>
					<li>S3 file download for #rs.site# - #rs.siteID# complete!</li>
				</cfif>
			</cfoutput>
		</ul>
	</body>
</html>
