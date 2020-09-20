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
      message: "Hello Vue!",
    };
  },
  mounted() {
    this.$store.watch(
      (state) => state.user,
      (value) => {
        const authUser = value
        if (!authUser) {
          this.$router.push({ name: 'login' })
        }
      }
    )
  }
};
</script>

<style scoped>

</style>
