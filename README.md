# MuraVueDecoupled

## Inital Startup

You will first need to go to localhost:8888 to initialize Mura's install then login and edit the default sites settings:
* Domain= The domain of the remote site that the the content will be served on. (localhost)
* Is Remote = true
* Remote Context = The directory structure off of the remote site's web root that the site lives (Leave Empty)
* Remote Port = The port of the remote site (8080)
* Resource Domain = The domain that Mura will use the access resource like css and js scripts that are dynamically loaded. (localhost)


## Theme

The theme's contentRenderer.cfc's has this.hashURLs=true;

You set the list of available templates by setting a contentRenderer.cfc this.layoutTemplates array. They should match the available /Vue/src/components/templates options


## Mura Site Settings

* Domain= The domain of the remote site that the the content will be served on. (localhost)
* Is Remote = true
* Remote Context = The directory structure off of the remote site's web root that the site lives (Leave Empty)
* Remote Port = The port of the remote site (8080)
* Resource Domain = The domain that Mura will use the access resource like css and js scripts that are dynamically loaded. (localhost)

#/config/settings.ini.cfm

* admindomain=localhost

## Reload Mura and test.
