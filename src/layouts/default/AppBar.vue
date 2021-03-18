<template>
  <v-app-bar
    id="default-app-bar"
    app
    absolute
    color="transparent"
    height="80"
    flat
  >
    <v-container px-0 d-flex align-center>
      <v-toolbar-title>
        <strong class="mr-1 font-weight-black">Stable</strong>
        <span class="primary--text">Manager</span>
      </v-toolbar-title>
      <v-spacer />
      <v-btn text to="/" class="ml-1 ml-md-7" min-height="48">
        <v-icon left aria-hidden="true">mdi-home</v-icon>
        <span class="hidden-sm-and-down">Home</span>
      </v-btn>
      <v-btn text to="/register" class="ml-1 ml-md-7" min-height="48">
        <v-icon left aria-hidden="true">mdi-account-multiple-plus</v-icon>
        <span class="hidden-sm-and-down">Register</span>
      </v-btn>
      <v-btn text to="/login" class="ml-1 ml-md-7" min-height="48">
        <v-icon left aria-hidden="true">mdi-fingerprint</v-icon>
        <span class="hidden-sm-and-down">Login</span>
      </v-btn>
    </v-container>
  </v-app-bar>
</template>

<script>
// Utilities
import { get, sync } from 'vuex-pathify';

export default {
  name: 'DefaultBar',

  components: {
  },

  computed: {
    ...sync('app', [
      'drawer',
      'mini',
    ]),
    name: get('route/name'),
  },
};
</script>
