<template>
  <v-container id="login-view" fill-height tag="section">
    <v-row justify="center">
      <v-col cols="12">
        <material-card
          max-width="350"
          class="mx-auto"
          rounded
          light
          color="primary"
          fullHeader
        >
          <template v-slot:heading>
            <div class="text-center pa-5">
              <div class="text-h4 font-weight-bold white--text">Login</div>
              <div class="mt-4">
                <v-btn icon class="mx-2" rounded>
                  <v-icon aria-hidden="true">mdi-google-plus</v-icon>
                </v-btn>
              </div>
            </div>
          </template>
          <v-card-text class="text-center">
            <div class="text-center font-weight-light">Or Be Classical</div>
            <v-text-field
              v-model.trim="form.email"
              placeholder="Email..."
              prepend-icon="mdi-email"
              class="mt-10"
            />
            <v-text-field
              v-model.trim="form.password"
              type="password"
              placeholder="Password..."
              prepend-icon="mdi-lock-outline"
              class="mb-8"
            />
            <v-btn depressed rounded min-width="140" color="primary" @click="login()">Login</v-btn>
          </v-card-text>
        </material-card>
      </v-col>
    </v-row>
  </v-container>
</template>

<script>

export default {
  name: 'LoginView',
  metaInfo: {
    title: 'Login',
    titleTemplate: '%s | TheStableManager',
  },

  data: () => ({
    form: {
      email: '',
      password: '',
    },
  }),

  methods: {
    login() {
      this.$store.dispatch('auth/login', {
        email: this.form.email,
        password: this.form.password,
      });
    },
  },
};
</script>
