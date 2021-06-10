import {
  layout,
  route,
} from '@/util/routes';

import Router from 'vue-router';
import Vue from 'vue';
import { auth } from '@/firebase';
import { trailingSlash } from '@/util/helpers';

Vue.use(Router);

const router = new Router({
  mode: 'history',
  base: process.env.BASE_URL,
  scrollBehavior: (to, from, savedPosition) => {
    if (to.hash) return { selector: to.hash };
    if (savedPosition) return savedPosition;

    return { x: 0, y: 0 };
  },
  routes: [
    layout('Default', [
      route('Home', null),
      route('Login', null, 'login'),
      route('Register', null, 'register'),
    ]),
    layout('Manager', [
      route('Dashboard', null, 'dashboard', true),
    ], '/manager'),
  ],
});

router.beforeEach((to, from, next) => (to.path.endsWith('/') ? next() : next(trailingSlash(to.path))));
router.beforeEach((to, from, next) => (to.path.endsWith('/manager/') ? next('/manager/dashboard') : next()));
router.beforeEach((to, from, next) => ((to.matched.some((x) => x.meta.requiresAuth) && !auth.currentUser) ? next('/login') : next()));
router.beforeEach((to, from, next) => ((to.path.match('/login') && auth.currentUser) ? next('/manager/dashboard') : next()));

export default router;
