import * as modules from '@/store/modules';

import FeatureFlags from '@/plugins/feature-flags';
import Vue from 'vue';
import Vuex from 'vuex';
import featureFlagsConfig from '@/.featureFlagsConfig';
import pathify from '@/plugins/vuex-pathify';

Vue.use(Vuex);

const store = new Vuex.Store({
  modules,
  plugins: [
    pathify.plugin,
  ],
});

Vue.use(FeatureFlags, {
  appName: featureFlagsConfig.appName,
  host: featureFlagsConfig.host,
  instanceId: featureFlagsConfig.instanceId,
  store
});

store.subscribe((mutation) => {
  if (!mutation.type.startsWith('user/')) return;

  store.dispatch('user/update', mutation);
});

store.dispatch('app/init');

export default store;

export const ROOT_DISPATCH = Object.freeze({ root: true });
