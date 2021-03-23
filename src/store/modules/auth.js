// Pathify
import { make } from 'vuex-pathify';
import router from '@/router'
import { auth, usersCollection } from '@/firebase';
import { GoogleAuthProvider, signInWithEmailAndPassword, signInWithPopup, createUserWithEmailAndPassword, signOut, browserPopupRedirectResolver } from 'firebase/auth';
import { doc, getDoc, updateDoc } from 'firebase/firestore';

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
    const { user } = await signInWithEmailAndPassword(auth, form.email, form.password)

    // fetch user profile and set in state
    dispatch('fetchUserProfile', user)

    // redirect to manager view
    router.push('/manager')
  },
  async loginWithGoogle({ dispatch }) {
    const provider = new GoogleAuthProvider();

    // sign user in
    const { user } = await signInWithPopup(auth, provider, browserPopupRedirectResolver)

    // fetch user profile and set in state
    dispatch('fetchUserProfile', user)

    // redirect to manager view
    router.push('/manager')
  },
  async signup({ dispatch }, form) {
    // sign user up
    const { user } = await createUserWithEmailAndPassword(auth, form.email, form.password)

    await user.updateProfile({displayName: form.name})

    // fetch user profile and set in state
    dispatch('fetchUserProfile', user)

    // redirect to manager view
    router.push('/manager')
  },
  async signupWithGoogle({ dispatch }) {
    const provider = new GoogleAuthProvider();

    // sign user in
    const { user } = await signInWithPopup(auth, provider, browserPopupRedirectResolver)

    // fetch user profile and set in state
    dispatch('fetchUserProfile', user)

    // redirect to manager view
    router.push('/manager')
  },
  async fetchUserProfile({ commit }, user) {
    // fetch user profile
    const userProfile = await getDoc(doc(usersCollection, user.uid))

    // set user profile in state
    commit('userProfile', userProfile.data())
  },
  async logout({ commit }) {
    // log user out
    await signOut(auth)

    // clear user data from state
    commit('userProfile', {})

    // redirect to login view
    router.push('/login')
  },
  async updateProfile({ dispatch }, user) {
    const userId = auth.currentUser.uid
    // update user object
    const userRef = await updateDoc(doc(usersCollection, userId), {
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
