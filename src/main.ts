import Vue from 'vue';
import { sync } from 'vuex-router-sync';
import store from '@/store';
import { auth } from '@/firebase';
import '@/registerServiceWorker';
import router from '@/router';
import '@/plugins';
import vuetify from '@/plugins/vuetify';
import App from '@/App.vue';

Vue.config.productionTip = false;

sync(store, router);

let app: Vue;
auth.onAuthStateChanged(() => {
  if (!app) {
    app = new Vue({
      router,
      vuetify,
      store,
      render: (h) => h(App),
    }).$mount('#app');
  }
});
