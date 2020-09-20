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
  };
</script>

<style scoped>

</style>
