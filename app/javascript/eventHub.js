import Vue from 'vue/dist/vue.esm'

let eventHub = new Vue()

export default {
  install: function (Vue) {
    Vue.prototype.$eventHub = eventHub
  }
}
