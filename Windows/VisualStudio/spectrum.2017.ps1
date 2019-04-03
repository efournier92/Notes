#####################################################################################################################################
#build system core includes
$build_systemdir = "\\tfs\TeamCityBuilds\build.infrastructure\system"
. "$build_systemdir\build.system.ps1"
#####################################################################################################################################


#####################################################################################################################################
#$msbuild_platformtarget = "64"
$msbuild_framework = "v4.0.30319"
$SolutionFile = "SpectrumManager.sln"
#####################################################################################################################################


#####################################################################################################################################
$UnitTestingIncludeFilter = "*.Specs.dll"
$UnitTestingExcludeFilter = "*.Integration*Specs.dll", "*.Acceptance*Specs.dll"

$IntegrationTestingIncludeFilter = "*.Integration*Specs.dll"
$IntegrationTestingExcludeFilter = "*.Acceptance*Specs.dll"

#$CodeCoverageConfigurationFile = ""
$FxCopIncludeFilter = "*.donotexist"
$FxCopExcludeFilter = "*.dll"

$VersioningDirectory = "\\tfs\TeamCityBuilds\BuildNumber\Spectrum-Branch"
#####################################################################################################################################



#####################################################################################################################################
#If your solution contains numerous individual applications, each will automatically qualify for continuous integration 
#(packaging/versioning/deployment) unless otherwise specified. 

#If you would like to relegate continuous integration to one (or more) application(s), you must supply 
#PackagingAndDeploymentSetting instance(s) as described below. 
#####################################################################################################################################

#####################################################################################################################################
#to use custom packaging/deployment settings:

#create a variable to represent an instance of your packaging/deployment setting per application/output directory you would like
#packaged/versioned and deployed

$package1 = Create-PackagingAndDeploymentSetting "Spectrum" "Spectrum.2012"
$package2 = Create-PackagingAndDeploymentSetting "Spectrum-PREVIEW" "Spectrum-PREVIEW.2012"
$package3 = Create-PackagingAndDeploymentSetting "Spectrum-WORKING" "Spectrum-WORKING.2012"
$package4 = Create-PackagingAndDeploymentSetting "SpectrumDashboard" "SpectrumDashboard.2012"
$package5 = Create-PackagingAndDeploymentSetting "SpectrumManager" "SpectrumManager.2012"
$package6 = Create-PackagingAndDeploymentSetting "SpectrumMedia" "SpectrumMedia.2012"
$package7 = Create-PackagingAndDeploymentSetting "SpectrumMedia.specs" "SpectrumMedia.specs.2012"
$package8 = Create-PackagingAndDeploymentSetting "SpectrumPackageAdmin" "SpectrumPackageAdmin.2012"
$package9 = Create-PackagingAndDeploymentSetting "SpectrumSvc" "SpectrumSVC.2012"
$package10 = Create-PackagingAndDeploymentSetting "ProductReviewService" "ProductReviewService.2012"



#assign all of your custom packaging/deployment settings for usage
$PackagingAndDeploymentSettings = Create-PackagingAndDeploymentSettings($package1, $package2, $package3, $package4, $package5, $package6, $package7, $package8, $package9, $package10)
#####################################################################################################################################
