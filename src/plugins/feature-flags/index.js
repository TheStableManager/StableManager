import { moduleFactory } from './module';
import Feature from './Feature.vue';

const install = (Vue, { appName, namePrefix, host, instanceId, strategyProviders, store }) => {
  if (!host) {
    throw new Error('Please initialize plugin with a Unleash host.');
  }

  if (!store) {
    throw new Error('Please initialize plugin with a Vuex store.');
  }

  Vue.config.applicationHostname = 'localhost';
  store.registerModule('featureFlags', moduleFactory({ host, appName, namePrefix, instanceId, strategyProviders }));
  Vue.component('feature', Feature);
  store.dispatch('featureFlags/fetch');
};

const plugin = {
  Feature,
  install
};

export default plugin;

if (typeof window !== 'undefined' && window.Vue) {
  window.Vue.use(plugin);
}