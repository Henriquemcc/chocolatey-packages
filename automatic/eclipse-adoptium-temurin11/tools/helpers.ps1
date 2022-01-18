function Get-InstallComponents([System.Collections.Hashtable]$pp) {

    $res = @("FeatureMain")

    if (!$pp.NoFeatureEnvironment) {
        $res += "FeatureEnvironment"
    }

    if (!$pp.NoFeatureJarFileRunWith) {
        $res += "FeatureJarFileRunWith"
    }

    if ($pp.FeatureJavaHome) {
        $res += "FeatureJavaHome"
    }

    if ($pp.FeatureOracleJavaSoft) {
        $res += "FeatureOracleJavaSoft"
    }

    return 'ADDLOCAL="{0}"' -f ($res -join ",")
}