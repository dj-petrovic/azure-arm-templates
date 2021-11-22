# Deploying scale unit case and exchange rate with bundled components
# 
# sof-case-we-dit
#  sof: software
#  case: scale unit Name
#  we: region west europe
#  dit: development integration test environment

$resourceGroup = "sof-case-we-dit"
$templateName = "sof-case-we-dit_deployment"
$templateFile = "$PSScriptRoot/linked_templates/sof-exchangerate.json"
$parameterFile =  "$PSScriptRoot/linked_templates/sof-exchangerate-dit-parameters.json"

#Write-Host "Clearning existing resources..."
#Remove-AzResourceGroup -Name $resourceGroup
Write-Host "Creating resource group..."
New-AzResourceGroup -Name $resourceGroup -Location westeurope

Write-Host "Starting deployment..." -ForegroundColor Yellow

New-AzResourceGroupDeployment `
    -Name $templateName `
    -ResourceGroupName $resourceGroup `
    -Mode Incremental `
    -TemplateFile $templateFile `
    -TemplateParameterFile $parameterFile
