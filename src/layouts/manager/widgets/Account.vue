<template>
  <v-menu
    bottom
    left
    min-width="200"
    offset-y
    origin="top right"
    transition="scale-transition"
  >
    <template v-slot:activator="{ attrs, on }">
      <v-btn
        class="ml-2"
        min-width="0"
        text
        v-bind="attrs"
        v-on="on"
      >
        <v-icon>mdi-account</v-icon>
      </v-btn>
    </template>

    <v-list
      :tile="false"
      flat
      nav
    >
      <template v-for="(p, i) in profile">
        <v-divider
          v-if="p.divider"
          :key="`divider-${i}`"
          class="mb-2 mt-2"
        />

        <v-list-item
          v-else-if="p.logout"
          :key="`item-${i}`"
          @click="logout"
          class="logout"
        >
          <v-list-item-title>Log out</v-list-item-title>
        </v-list-item>

        <app-bar-item
          v-else
          :key="`item-${i}`"
          :to="p.to"
        >
          <v-list-item-title v-text="p.title" />
        </app-bar-item>
      </template>
    </v-list>
  </v-menu>
</template>

<script>
export default {
  name: 'DefaultAccount',

  data: () => ({
    profile: [
      { title: 'Profile', to: '/manager/user/profile' },
      { title: 'Settings', to: '/manager/user/settings' },
      { divider: true },
      { logout: true },
    ],
  }),

  methods: {
    logout() {
      this.$store.dispatch('auth/logout');
    },
  },
};
</script>

<style lang="css">
.logout:hover {
  color: #FFFFFF !important;
  caret-color: #FFFFFF !important;
  background-color: #9c27b0 !important;
  border-color: #9c27b0 !important;
  box-shadow:
    0 16px 38px -12px rgba(0, 0, 0, 0.56),
    0 4px 25px 0 rgba(0, 0, 0, 0.12),
    0 8px 10px -5px rgba(0, 0, 0, 0.2) !important;
}
.logout {
  color: #000000;
  caret-color: #000000;
}
</style>
