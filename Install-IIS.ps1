Install-WindowsFeature -name web-server -IncludeManagementTools

New-Item C:\ImageBuilderWebapp -type Directory

Copy-Item "C:\buildArtifacts\webapp\*" -Destination "C:\ImageBuilderWebApp" -Recurse

New-IISWebSite -Name "ImageBuilderWebApp" -BindingInformation "*:8080" -PhysicalPath "C:\ImageBuilderWebapp"

New-NetFirewallRule -DisplayName "Allow Inbound port 8080" -Direction Inbound -LocalPort 8080 -Protocol TCP -Action Allow

Remove-Item -Path "C:\buildArtifacts\*" -Force -Recurse
