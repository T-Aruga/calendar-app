<template>
  <v-app>
    <v-app-bar app color="primary" dark>
      <v-app-bar-nav-icon @click.stop="toggleSideMenu"></v-app-bar-nav-icon>
      <v-toolbar-title>My Original Calendar!</v-toolbar-title>
      <v-spacer></v-spacer>
    </v-app-bar>
  </v-app>
</template>

<script>
import { mapMutations } from 'vuex'

export default {
  name: 'Header',
  data () {
    return {
      items: [
        { title: '連絡先一覧', icon: 'mdi-menu' }
      ]
    }
  },
  methods: {
    ...mapMutations(['toggleSideMenu'])
  }
}
</script>
