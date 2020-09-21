import Vue from "vue";
import Router from "vue-router";
import store from "../store/store.js";
import Home from "../views/Home.vue";
import About from "../views/About.vue";
import Login from "../views/Login.vue";
import Signup from "../views/Signup.vue";
import Calendar from "../views/Calendar.vue";


Vue.use(Router);

const router = new Router({
  mode: "history",
  routes: [
    //ルーティングの設定
    {
      path: "/",
      name: "home",
      component: Home,
      meta: { isPublic: true }
    },
    {
      path: "/about",
      name: "about",
      component: About,
      meta: { isPublic: true }
    },
    {
      path: "/calendar",
      name: "calendar",
      component: Calendar,
    },
    {
      path: "/login",
      name: "login",
      component: Login,
      meta: { isPublic: true }
    },
    {
      path: "/signup",
      name: "signup",
      component: Signup,
      meta: { isPublic: true }
    }
  ],
});

router.beforeEach((to, from, next) => {
  // isPublic でない場合(=認証が必要な場合)、かつ、ログインしていない場合
  if (to.matched.some(record => !record.meta.isPublic) && !store.state.user) {
    next({ path: '/login' });
  } else {
    next();
  }
});

export default router;
