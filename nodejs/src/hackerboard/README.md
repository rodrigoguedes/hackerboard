    // "dev:debug": "nodemon --local --delay 300ms --legacy-watch --inspect=0.0.0.0:9229 src/server.js -V"

talvez usar o rsync: https://www.vagrantup.com/docs/synced-folders/rsync.html

## Start App dev mode
```
yarn dev
```

## Start Queue manager
```
yarn queue
```

## Source formatter
```
yarn eslint --fix src --ext .js
```
