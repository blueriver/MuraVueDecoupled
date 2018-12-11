# MuraVueDecoupled

## Initial Startup

First you need to start Mura up:
```
git clone https://github.com/blueriver/MuraVueDecoupled.git
cd MuraVueDecoupled
git checkout master
cd mura
docker-compose up
```

Then go to http://localhost:8888 to initialize Mura's install then login with the default (admin/admin) and edit the default site's settings:
* Domain= The domain of the remote site that the the content will be served on. (localhost)
* Is Remote = true
* Remote Context = The directory structure off of the remote site's web root that the site lives (Leave Empty)
* Remote Port = The port of the remote site (8080)
* Resource Domain = The domain that Mura will use the access resource like css and js scripts that are dynamically loaded. (localhost)

Second you need to start Vue up:

If you haven't already install vue-cli 3 you will need to run This

```
npm install -g @vue/cli @vue/cli-service
```

Then in terminal go to the vue directory within the project root:
```
cd {project_root}/vue
npm install
npm run serve
```

You can now visit the site at http://localhost:8080

And finally go to your Mura admin (http://localhost:8888/admin) and reload Mura one more to and it will see the mura.config.json from the Vue directory.
