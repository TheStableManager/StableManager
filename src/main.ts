import '@/registerServiceWorker';
import '@/plugins';

import App from '@/App.vue';
import Vue from 'vue';
import { auth } from '@/firebase';
import router from '@/router';
import store from '@/store';
import { sync } from 'vuex-router-sync';
import vuetify from '@/plugins/vuetify';

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
