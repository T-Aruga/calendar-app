<template>
  <v-container class="fill-height" fluid>
    <v-navigation-drawer v-model="drawer" absolute temporary>
      <v-list>
        <v-list-item class='mt-4'>
          <v-list-item-avatar>
            <img src="https://1.bp.blogspot.com/-r0SdJLU4eWk/X1CK7MQfwvI/AAAAAAABaws/QoCcnan3kO42i4Gmhpjil0Iy0BvIGzY4wCNcBGAsYHQ/s400/hair_okappa_boy.png">
          </v-list-item-avatar>
          <v-list-item-content>
            <v-list-item-title>有賀 達也</v-list-item-title>
          </v-list-item-content>
        </v-list-item>

        <v-divider></v-divider>

        <v-list-item v-for="(item, index) in filteredItems" :key="index" :to="item.link">
          <v-list-item-icon>
            <v-icon>{{ item.icon }}</v-icon>
          </v-list-item-icon>
          <v-list-item-content>
            <v-list-item-title>{{ item.title }}</v-list-item-title>
          </v-list-item-content>
        </v-list-item>
      </v-list>
    </v-navigation-drawer>
  </v-container>
</template>

<script>
export default {
  data () {
    return {
      drawer: false,
      items: [
        { title: 'Home', icon: 'mdi-home', link: { name: 'home' }, isPublic: true },
        { title: 'About', icon: 'mdi-information', link: { name: 'about' }, isPublic: true },
        { title: 'My Calendar', icon: 'mdi-calendar', link: { name: 'calendar' }, isPublic: false }
      ]
    }
  },
  computed: {
    loginUser () {
      return this.$store.state.user
    },
    isLogin () {
      return this.loginUser ? true : false
    },
    filteredItems () {
      if (this.isLogin) {
        return this.items
      } else {
        return this.items.filter(item => {
          return item.isPublic === true
        })
      }
    }
  },
  mounted() {
    this.$eventHub.$on('open-sidemenu', () => {
      this.drawer = true
    })
  },
  beforeDestroy() {
    this.$eventHub.$off('open-sidemenu')
  }
}
</script>
