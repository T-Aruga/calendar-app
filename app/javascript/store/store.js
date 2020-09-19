import Vue from "vue";
import Vuex from "vuex";

Vue.use(Vuex);

const store = new Vuex.Store({
  state: {
    drawer: false,
  },
  getters: {},
  mutations: {
    toggleSideMenu (state) {
      state.drawer = !state.drawer
    }
  },
  actions: {},
});

export default store;
