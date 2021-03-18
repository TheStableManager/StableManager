// Pathify
import { make } from 'vuex-pathify';

// Data
const state = {
  drawer: null,
  mini: false,
  version: '0.1.0',
  items: [
    {
      title: 'Dashboard',
      icon: 'mdi-view-dashboard',
      to: '/manager/dashboard/',
    },
  ],
};

const mutations = make.mutations(state);

const actions = {
  ...make.actions(state),
  init: async () => {
    // test
  },
};

const getters = {};

export default {
  namespaced: true,
  state,
  mutations,
  actions,
  getters,
};
