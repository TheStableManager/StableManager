<template>
  <v-list-item class="mb-0 justify-space-between pl-3">
<!--    <v-list-item-avatar>
      <v-img
        :src="
          require('@/assets/logo.svg')"
      />
    </v-list-item-avatar>-->

    <v-list-item-content class="pl-2">
      <v-list-item-title class="text-h3">
        <strong class="mr-1 font-weight-black">Stable</strong>

        <span class="primary--text">Manager</span>
      </v-list-item-title>
      <v-list-item>
        <span>v{{ version }}</span>
      </v-list-item>
    </v-list-item-content>
  </v-list-item>
</template>

<script>
// Utilities
import { get } from 'vuex-pathify';

export default {
  name: 'DefaultDrawerHeader',

  computed: { version: get('app/version') },
};
</script>
