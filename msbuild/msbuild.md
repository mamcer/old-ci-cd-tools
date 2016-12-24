# MSBuild

List of parameters

## /maxcpucount[:number]

Specifies the maximum number of concurrent processes to build with. If not present MSBuild will build the projects in the solution one at a time. If present but not configured MSBuild will use up to the number of processors on the computer.

   /m

## /property:name=value

    /property:WarningLevel=2;OutDir=bin\Debug

## /toolsversion:version

## /target:targets

Build the specified targets in the project. Specify each target separately, or use a semicolon or comma to separate multiple targets, as the following example shows:

    /target:Resources;Compile

## toolsversion:version

Specifies the version of the Toolset to use to build the project, as the following example shows: 

    /toolsversion:3.5

## Target Framework Version

    /p:TargetFrameworkVersion=v2.0;

## /verbosity:level

Specifies the amount of information to display in the build log. Each logger displays events based on the verbosity level that you set for that logger.

levels: q[uiet], m[inimal], n[ormal], d[etailed], and diag[nostic]. 

    /verbosity:quiet
