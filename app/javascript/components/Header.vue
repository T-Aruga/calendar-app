<template>
  <header id="header">
    <v-app-bar>
      <v-app-bar-nav-icon></v-app-bar-nav-icon>
      <v-toolbar-title>This is Header.vue</v-toolbar-title>
      <router-link to="/">Home</router-link>
      <router-link to="/about">About</router-link>
    </v-app-bar>
  </header>
</template>

<script>
  export default {
    name: 'Header',
  }
</script>
