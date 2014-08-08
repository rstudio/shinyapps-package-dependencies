shinyapps-package-dependencies
==============================

This repo is a holding place that has bash scripts that install system layer dependencies for R packages. This allows shinyapps users to install R packages that require other software to be install on the server.

How to write a bash script for an R package
===========================================

1. Create a bash script in the `packages` directory.

```bash
touch packages/<package_name>
chmod 755 packages/<package_name>
```

2. Test your bash script by running the following.

```bash
vagrant docker-run shinyapps-package-dependencies -- bash /vagrant/test <package_name>
```
