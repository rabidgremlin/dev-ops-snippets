Vagrant script to set up a Wordpress theme development VM.

* Run ```vagrant up```
* Then browse to http://localhost/ and complete the installation. Use the default database name,password, etc  values provided
* In the wordpress admin tool, browse to the Themes section, You should see a Dev Theme. 
The ```src/theme``` folder on your host is mapped to ```/var/www/html/wp-content/themes/devtheme``` and changes made to the files in ```src/theme``` will be reflect in the "Dev Theme"
* See https://codex.wordpress.org/Theme_Development and https://yoast.com/wordpress-theme-anatomy/ for info on building themes

