# Continuous Integration cmd files

## Description

This repo containts different `.cmd` and `.proj` files that I have created to help simplify and avoid repetitive tasks in my Continuous Integration .NET plan configurations.

All this files were configured to run as a task in Bamboo (for example). [I wrote a blog post explaining my configuration](https://mamcer.github.io/2017-02-04-bamboo-cmd-tools/). 

They can also be easily tweaked to run locally as part of your development process: [atm-fun](https://github.com/mamcer/atm-fun).

You can edit and change all the folder paths to match your local configuration. By default the folders are:

Copy all the files in a `C:\root\bin\cmd\` folder. 

`open-cover-mstest.cmd` expects the open cover binaries in: `C:\root\bin\open-cover\`

`report-generator.cmd` expects the report generator binaries in: `C:\root\bin\report-generator\`

## vstest-console.cmd

With `vstest-console.proj` it recursively look for test assemblies from a given root directory and execute all the unit tests.

### Example

It only needs one parameter `[folder-path]`

    vstest-console.cmd [folder-path]

Where `[folder-path]` is the root path. From there it will recursively start looking for test assemblies. 

## open-cover-mstest.cmd

Uses [Open Cover](https://github.com/OpenCover/opencover) and MSTest to run a code coverage analysis. From a given starting folder it recursively scan for test assemblies and executes a code coverage analysis over them.

### Example  

It only needs one parameter `[folder-path]`

    open-cover-mstest.cmd [folder-path]

Where `[folder-path]` is the root path to start the scan looking for test assemblies. As an output it produces an `open-cover.xml` file with the code coverage analysis result.

## report-generator.cmd

Uses [Report Generator](http://danielpalme.github.io/ReportGenerator/) to generate a user friendly html report of an open cover xml analysis result file.

### Example  

    report-generator.cmd

It doesn't need a parameter. Assumes an `open-cover.xml` file at the same path level and produces as output a `coverage-report` folder with the html report at the same path level of the script. 

