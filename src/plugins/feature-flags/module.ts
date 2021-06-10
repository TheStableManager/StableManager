import Vue from 'vue';
import axios from 'axios';
import { keyBy } from 'lodash/core';

const moduleFactory = ({
  host, appName, namePrefix, instanceId, strategyProviders = {},
}) => ({
  actions: {
    async fetch({ commit }) {
      commit('setLoading', true);

      try {
        const { data } = await axios.get(
          `${host}/features${namePrefix ? `?namePrefix=${namePrefix}` : ''}`,
          {
            headers: {
              'UNLEASH-APPNAME': appName,
              'UNLEASH-INSTANCEID': instanceId,
            },
          },
        );

        commit('setFeatures', data.features);
      } catch (e) {
        // istanbul ignore next
        console.error('Unable to reach Unleash API');
      } finally {
        commit('setLoading', false);
      }
    },
  },

  mutations: {
    setFeatures(state, features) {
      const enabledFeatures = features.reduce((result, feature) => {
        result[feature.name] = feature.enabled;

        feature.strategies.forEach((strategy) => {
          if (!strategyProviders[strategy.name]) {
            return;
          }

          if (!strategyProviders[strategy.name](strategy.parameters)) {
            result[feature.name] = false;
          }
        });

        return result;
      }, {});

      Vue.set(state, 'enabledFeatures', { ...enabledFeatures });
      Vue.set(state, 'features', { ...keyBy(features, 'name') });
    },

    setLoading(state, loading) {
      state.loading = loading;
    },
  },

  namespaced: true,

  state: {
    enabledFeatures: {},
    features: {},
    loading: true,
  },
});

export default moduleFactory;
