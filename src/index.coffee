
Vue = require "vue"
App = require "./components/app.vue"

Vue.config.debug = true
new Vue
	el: "body"
	components:
		app: App


