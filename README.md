shinyapps-package-dependencies
==============================

This repo is a holding place that has bash scripts that install system layer dependencies for R packages. This allows shinyapps users to install R packages that require other software to be install on the server.

How to write a bash script for an R package
===========================================

1. Create a directory with the same name as the r package you are adding support for.

```bash
mkdir packages/<r_package_name>
```

2. Create a bash script in the directory named install and give it executable permissions

```bash
touch packages/<r_package_name>/install
chmod 755 packages/<r_package_name>/install
```

3. Write you install bash script to install all the dependencies of your R package.

4. Create a `test.R` file in the same directory.

```bash
touch packages/<r_package_name>/test.R
```

5. Write this R script to install the R package and run some basic code to ensure that the package is installed correctly and functional.

4. Test your install via running this command.

```bash
vagrant docker-run shinyapps-package-dependencies -- bash /vagrant/test <r_package_name>
```
