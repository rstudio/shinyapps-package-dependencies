Contributing to this project
============================

Requirements
============
This repo utilizes [vagrant](http://www.vagrantup.com/) to test the install scripts. Please make sure you [download](http://www.vagrantup.com/downloads.html) the latest version of vagrant before contributing to the project.

Steps
=====
1. [Fork](https://help.github.com/articles/fork-a-repo) the repository on Github
2. Create a named feature branch (like `add_package_x_support`)
3. Write your change ([see next section below](https://github.com/rstudio/shinyapps-package-dependencies/blob/master/CONTRIBUTING.md#how-to-add-system-dependency-support-for-an-r-package))
4. Write tests for your change ([see next section below](https://github.com/rstudio/shinyapps-package-dependencies/blob/master/CONTRIBUTING.md#how-to-add-system-dependency-support-for-an-r-package))
5. Run the tests, ensuring they all pass
6. Submit a [Pull Request](https://help.github.com/articles/creating-a-pull-request) using Github

How to add system dependency support for an R package
=====================================================

1. Create a directory with the same name as the R package you are adding support for. The directory **MUST BE** case sensitive.

```bash
mkdir packages/<r_package_name>
```

2. Create a bash script in the directory named `install` and give it executable permissions

```bash
touch packages/<r_package_name>/install
chmod 755 packages/<r_package_name>/install
```

3. Write your install bash script to install all the dependencies of your R package.

4. Create a `test.R` file in the same directory.

```bash
touch packages/<r_package_name>/test.R
```

5. Write this R script to install the R package and run some basic code to ensure that the package is installed correctly and functional.

4. Test your install via running this command.

```bash
vagrant docker-run shinyapps-package-dependencies -- /vagrant/test <r_package_name>
```
