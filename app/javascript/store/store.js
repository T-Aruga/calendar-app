import Vue from "vue";
import Vuex from "vuex";

Vue.use(Vuex);

const store = new Vuex.Store({
  state: {
    user: {},
  },
  getters: {},
  mutations: {
    'set-user' (state, payload) {
      state.user = payload
    },
    'logout-user' (state) {
      state.user = null
    }
  },
  actions: {},
});

export default store;
