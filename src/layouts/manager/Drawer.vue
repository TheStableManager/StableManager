<template>
  <v-navigation-drawer
    id="default-drawer"
    v-model="drawer"
    :dark="true"
    :right="$vuetify.rtl"
    src="@/assets/bg-stable.jpg"
    :mini-variant.sync="mini"
    mini-variant-width="80"
    app
    width="260"
  >
    <template
      #img="props"
    >
      <v-img
        gradient="rgba(0, 0, 0, .7), rgba(0, 0, 0, .7)"
        v-bind="props"
      />
    </template>

    <div class="px-2">
      <default-drawer-header />

      <v-divider class="mx-3 mb-2" />

      <default-list :items="items" />
    </div>

    <template #append>
      <div class="pa-4 text-center">
        <app-btn
          class="text-none mb-4"
          color="white"
          href="#"
          small
          text
        >
          Documentation
        </app-btn>

        <app-btn
          block
          class="text-none"
          color="secondary"
          href="#"
        >
          <v-icon left>
            mdi-package-up
          </v-icon>

          Upgrade to Pro
        </app-btn>
      </div>
    </template>

    <div class="pt-12" />
  </v-navigation-drawer>
</template>

<script>
// Utilities
import { get, sync } from 'vuex-pathify';
import Account from './widgets/Account.vue';

export default {
  name: 'DefaultDrawer',

  components: {
    DefaultDrawerHeader: () => import(
      /* webpackChunkName: "default-drawer-header" */
      '@/components/DrawerHeader'
    ),
    DefaultList: () => import(
      /* webpackChunkName: "default-list" */
      './List'
    ),
    Account,
  },

  computed: {
    ...get('app', [
      'items',
      'version',
    ]),
    ...sync('app', [
      'mini',
      'drawer',
    ]),
  },
};
</script>

<style lang="sass">
#default-drawer
  .v-list-item
    margin-bottom: 8px

  .v-list-item::before,
  .v-list-item::after
    display: none

  .v-list-group__header__prepend-icon,
  .v-list-item__icon
    margin-top: 12px
    margin-bottom: 12px
    margin-left: 4px

  &.v-navigation-drawer--mini-variant
    .v-list-item
      justify-content: flex-start !important
</style>
