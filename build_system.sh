node_modules/.bin/browserifyinc \
	-t vueify \
    -t coffeeify \
        --extension=".coffee" \
    src/index.coffee > public/app.js

cp src/index.html public
