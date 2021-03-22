// Pathify
import { make } from 'vuex-pathify';
import router from '@/router'
import * as fb from '@/firebase';
import firebase from 'firebase/app';
import 'firebase/auth';

// Data
const state = {
  userProfile: {},
};

const mutations = make.mutations(state);

const actions = {
  ...make.actions(state),
  init: async () => {
    // test
  },
  async login({ dispatch }, form) {
    // sign user in
    const { user } = await fb.auth.signInWithEmailAndPassword(form.email, form.password)

    // fetch user profile and set in state
    dispatch('fetchUserProfile', user)

    // redirect to manager view
    router.push('/manager')
  },
  async loginWithGoogle({ dispatch }) {
    const provider = new firebase.auth.GoogleAuthProvider();

    // sign user in
    const { user } = await fb.auth.signInWithPopup(provider)

    // fetch user profile and set in state
    dispatch('fetchUserProfile', user)

    // redirect to manager view
    router.push('/manager')
  },
  async signup({ dispatch }, form) {
    // sign user up
    const { user } = await fb.auth.createUserWithEmailAndPassword(form.email, form.password)

    await user.updateProfile({displayName: form.name})

    // fetch user profile and set in state
    dispatch('fetchUserProfile', user)

    // redirect to manager view
    router.push('/manager')
  },
  async signupWithGoogle({ dispatch }) {
    const provider = new firebase.auth.GoogleAuthProvider();

    // sign user in
    const { user } = await fb.auth.signInWithPopup(provider)

    // fetch user profile and set in state
    dispatch('fetchUserProfile', user)

    // redirect to manager view
    router.push('/manager')
  },
  async fetchUserProfile({ commit }, user) {
    // fetch user profile
    const userProfile = await fb.usersCollection.doc(user.uid).get()

    // set user profile in state
    commit('userProfile', userProfile.data())
  },
  async logout({ commit }) {
    // log user out
    await fb.auth.signOut()

    // clear user data from state
    commit('userProfile', {})

    // redirect to login view
    router.push('/login')
  },
  async updateProfile({ dispatch }, user) {
    const userId = fb.auth.currentUser.uid
    // update user object
    const userRef = await fb.usersCollection.doc(userId).update({
      name: user.name
    })

    dispatch('fetchUserProfile', { uid: userId })
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
