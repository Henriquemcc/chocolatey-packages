function Get-InstallComponents([System.Collections.Hashtable]$pp) {
    $res = @()

    if ($pp.InstallAllUsers) {
        $res += "InstallAllUsers=1"
    }

    if ($pp.TargetDir) {
        $res += "TargetDir=$($pp['TargetDir'])"
    }

    if ($pp.DefaultAllUsersTargetDir) {
        $res += "DefaultAllUsersTargetDir=$($pp['DefaultAllUsersTargetDir'])"
    }

    if ($pp.DefaultJustForMeTargetDir) {
        $res += "DefaultJustForMeTargetDir=$($pp['DefaultJustForMeTargetDir'])"
    }

    if ($pp.DefaultCustomTargetDir) {
        $res += "DefaultCustomTargetDir=$($pp['DefaultCustomTargetDir'])"
    }

    if ($pp.DoNotAssociateFiles) {
        $res += "AssociateFiles=0"
    }

    if ($pp.CompileAll) {
        $res += "CompileAll=1"
    }

    if ($pp.PrependPath) {
        $res += "PrependPath=1"
    }

    if ($pp.NoShortcuts) {
        $res += "Shortcuts=0"
    }

    if ($pp.DoNotInclude_doc) {
        $res += "Include_doc=0"
    }

    if ($pp.Include_debug) {
        $res += "Include_debug=1"
    }

    if ($pp.DoNotInclude_dev) {
        $res += "Include_dev=0"
    }

    if ($pp.DoNotInclude_exe) {
        $res += "Include_exe=0"
    }

    if ($pp.DoNotInclude_launcher) {
        $res += "Include_launcher=0"
    }

    if ($pp.DoNotInstallLauncherAllUsers) {
        $res += "InstallLauncherAllUsers=0"
    }

    if ($pp.DoNotInclude_lib) {
        $res += "Include_lib=0"
    }

    if ($pp.DoNotInclude_pip) {
        $res += "Include_pip=0"
    }

    if ($pp.Include_symbols) {
        $res += "Include_symbols=1"
    }

    if ($pp.DoNotInclude_tcltk) {
        $res += "Include_tcltk=0"
    }

    if ($pp.DoNotInclude_test) {
        $res += "Include_test=0"
    }

    if ($pp.DoNotInclude_tools) {
        $res += "Include_tools=0"
    }

    if ($pp.LauncherOnly) {
        $res += "LauncherOnly=1"
    }

    if ($pp.SimpleInstall) {
        $res += "SimpleInstall=1"
    }

    if ($pp.SimpleInstallDescription) {
        $res += "SimpleInstallDescription=$($pp['SimpleInstallDescription'])"
    }

    return '"{0}"' -f ($res -join " ")
}