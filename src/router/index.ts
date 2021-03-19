// Imports
import Vue from 'vue';
import Router from 'vue-router';
import { trailingSlash } from '@/util/helpers';
import {
  layout,
  route,
} from '@/util/routes';
import { auth } from '@/firebase';

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
      route('Register', null, 'register'),
      route('Login', null, 'login'),
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
