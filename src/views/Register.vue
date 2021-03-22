<template>
  <v-container id="register-view" fill-height tag="section">
    <v-row justify="center">
      <v-col cols="12" md="9">
        <v-card light class="pa-3 pa-md-10 mx-sm-auto">
          <h1 class="text-center text-h2 font-weight-light">Register</h1>
          <v-row>
            <v-col cols="12" md="6">
              <v-row no-gutters>
                <v-col cols="12">
                  <v-list-item
                    v-for="(item, i) in items"
                    :key="i"
                    three-line
                  >
                    <v-list-item-icon class="mr-4 mt-5 mt-md-4">
                      <v-icon :color="item.color" size="36">{{ item.icon }}</v-icon>
                    </v-list-item-icon>
                    <v-list-item-content>
                      <v-list-item-title class="text-h4 mb-4 mt-3">
                        {{ item.title }}
                      </v-list-item-title>
                      <v-list-item-subtitle>
                        {{ item.text }}
                      </v-list-item-subtitle>
                    </v-list-item-content>
                  </v-list-item>
                </v-col>
              </v-row>
            </v-col>
            <v-col cols="12" md="6">
              <feature name="registration_disabled" disabled>
                <div class="text-center">
                  <v-btn depressed fab rounded small dark color="rgb(219,68,55)" class="my-2 mr-1">
                    <v-icon aria-hidden="true">mdi-google-plus</v-icon>
                  </v-btn>
                  <div class="my-2" />
                  <div class="text-center text-h4">or be classical</div>
                  <v-text-field
                    v-model.trim="form.name"
                    type="text"
                    placeholder="First Name..."
                    prepend-icon="mdi-face"
                  />
                  <v-text-field
                    v-model.trim="form.email"
                    type="email"
                    placeholder="Email..."
                    prepend-icon="mdi-email"
                  />
                  <v-text-field
                    v-model.trim="form.password"
                    type="password"
                    placeholder="Password..."
                    prepend-icon="mdi-lock-outline"
                    class="mb-8"
                  />
                  <v-checkbox>
                    <template v-slot:label>
                      <div>
                        <span class="text-no-wrap">I agree to the </span>
                        <v-tooltip bottom>
                          <template v-slot:activator="{ on }">
                            <a
                              target="_blank"
                              href="#"
                              @click.stop
                              v-on="on"
                            >terms and conditions</a>
                          </template>
                          Opens in new window
                        </v-tooltip>
                        <span class="text-no-wrap">.</span>
                      </div>
                    </template>
                  </v-checkbox>
                  <v-btn depressed rounded min-width="140" color="primary" @click="signup()">
                    Get Started
                  </v-btn>
                </div>
              </feature>
              <feature name="registration_disabled">
                <div class="text-center">
                  <v-card-text class="text-center">
                    <div class="text-center text-h4">Registration is currently disabled!</div>
                  </v-card-text>
                </div>
              </feature>
            </v-col>
          </v-row>
        </v-card>
      </v-col>
    </v-row>
  </v-container>
</template>

<script>
export default {
  name: 'RegisterView',
  metaInfo: {
    title: 'Register',
    titleTemplate: '%s | TheStableManager',
  },

  data: () => ({
    items: [
      {
        icon: 'mdi-account-multiple',
        color: 'primary',
        title: 'From horse owners for horse owners',
        text: 'We build this app for stable and horse owners to simplify their managemant.',
      },
    ],
    form: {
      name: '',
      email: '',
      password: '',
    },
  }),

  methods: {
    signup() {
      this.$store.dispatch('auth/signup', {
        name: this.form.name,
        email: this.form.email,
        password: this.form.password,
      });
    },
  },
};
</script>
