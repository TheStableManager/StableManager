// Globals
import { IN_BROWSER } from '@/util/globals';
// Utilities
import { make } from 'vuex-pathify';

const state = {
  dark: false,
  notifications: [],
};

const mutations = make.mutations(state);

const actions = {
  fetch: ({ commit }) => {
    const local = localStorage.getItem('vuetify@user') || '{}';
    const user = JSON.parse(local);

    for (const key in user) {
      commit(key, user[key]);
    }

    if (user.dark === undefined) {
      commit('dark', window.matchMedia('(prefers-color-scheme: dark)'));
    }
  },
  update: ({ state }) => {
    if (!IN_BROWSER) return;

    localStorage.setItem('vuetify@user', JSON.stringify(state));
  },
};

const getters = {
  dark: (state, getters) => (
    state.dark
    || getters.gradient.indexOf('255, 255, 255') === -1
  ),
};

export default {
  namespaced: true,
  state,
  mutations,
  actions,
  getters,
};
