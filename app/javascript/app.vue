<template>
  <div id="app">
    <Header/>
    <router-view></router-view>
    <SideNav/>
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
