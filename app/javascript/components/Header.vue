<template>
  <v-app-bar app color="primary" dark>
    <v-app-bar-nav-icon @click.stop="openSideMenu"></v-app-bar-nav-icon>
    <v-toolbar-title>My Original Calendar!</v-toolbar-title>
    <v-spacer></v-spacer>
    <v-tooltip bottom v-if="isLogin">
      <template v-slot:activator="{ on, attrs }">
        <v-btn icon v-bind="attrs" v-on="on" @click="$router.push({ name: 'calendar' })">
          <v-icon>mdi-calendar</v-icon>
        </v-btn>
      </template>
      <span>Check Cakendar</span>
    </v-tooltip>
    <v-tooltip bottom v-if="isLogin">
      <template v-slot:activator="{ on, attrs }">
        <v-btn icon v-bind="attrs" v-on="on" @click="Logout">
          <v-icon>mdi-logout</v-icon>
        </v-btn>
      </template>
      <span>Logout</span>
    </v-tooltip>
    <v-tooltip bottom>
      <template v-slot:activator="{ on, attrs }">
        <v-btn icon v-bind="attrs" v-on="on" @click="$router.push({ name: 'signup' })">
          <v-icon>mdi-account</v-icon>
        </v-btn>
      </template>
      <span>Create Account!</span>
    </v-tooltip>
    <v-tooltip bottom>
      <template v-slot:activator="{ on, attrs }">
        <v-btn icon v-bind="attrs" v-on="on" @click="$router.push({ name: 'login' })">
          <v-icon>mdi-login</v-icon>
        </v-btn>
      </template>
      <span>Let's Login!</span>
    </v-tooltip>
  </v-app-bar>
</template>

<script>
import { mapMutations } from 'vuex'

export default {
  name: 'Header',
  data () {
    return {
    }
  },
  methods: {
    openSideMenu() {
      this.$eventHub.$emit('open-sidemenu')
    },
    Logout(){
      this.axios.delete("/api/sign_out").then(res => {
        this.$store.commit('logout-user')
      }).catch(err => {
        console.log(err)
      })
    }
  },
  computed: {
    loginUser () {
      return this.$store.state.user
    },
    isLogin () {
      return this.loginUser ? true : false
    }
  }
}
</script>
