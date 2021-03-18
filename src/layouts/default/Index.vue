<template>
  <v-app>
    <v-img
      dark
      gradient="to top, rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5)"
      src="@/assets/bg-stable.jpg"
      height="100vh"
      min-height="100vh"
    >
      <default-bar />

      <default-view />

      <default-footer />
    </v-img>
  </v-app>
</template>

<script>
export default {
  name: 'DefaultLayout',

  components: {
    DefaultBar: () => import(
      /* webpackChunkName: "default-app-bar" */
      './AppBar'
    ),
    DefaultFooter: () => import(
      /* webpackChunkName: "default-footer" */
      '@/components/Footer'
    ),
    DefaultView: () => import(
      /* webpackChunkName: "default-view" */
      './View'
    ),
  },
};
</script>
