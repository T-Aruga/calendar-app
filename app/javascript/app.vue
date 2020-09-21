<template>
  <div id="app">
    <v-app id="inspire">
      <Header/>
      <SideNav/>
      <v-app id="inspire">
        <v-main>
          <v-container class="fill-height" fluid>
            <router-view/>
          </v-container>
          <v-snackbar v-model="snackbar" :timeout="timeout" rounded="pill" :color="snackbarColor">
            {{ snackbarContent }}
            <template v-slot:action="{ attrs }">
              <v-btn text v-bind="attrs" @click="snackbar = false">
                Close
              </v-btn>
            </template>
          </v-snackbar>
        </v-main>
      </v-app>
    </v-app>
  </div>
</template>

<script>
import Header from "./components/Header"
import SideNav from './components/SideNav'

export default {
  components: {
    Header,
    SideNav
  },
  data: function() {
    return {
      snackbar: false,
      timeout: 3000,
      snackbarContent: "",
      snackbarColor: "blue-grey"
    };
  },
  mounted() {
    this.$eventHub.$on('show-snackbar', this.showSnackbar)
    this.$store.watch(
      (state) => state.user,
      (value) => {
        const authUser = value
        if (!authUser) {
          this.$router.push({ name: 'login' })
        }
      }
    )
  },
  methods: {
    showSnackbar(content) {
      if(content.hasOwnProperty('body')) {
        this.snackbarContent = content.body
        this.snackbarColor = content.color || 'blue-grey'
      } else {
        this.snackbarContent = content
        this.snackbarColor = 'blue-grey'
      }
      this.snackbar = true
    }
  }
};
</script>

<style scoped>

</style>
