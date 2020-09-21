<template>
  <v-row align="center" justify="center">
    <v-col cols="12" sm="8" md="4">
      <v-card class="elevation-12">
        <v-toolbar color="primary" dark flat>
          <v-spacer></v-spacer>
            <v-icon>mdi-login</v-icon>
            <v-toolbar-title class='ml-2'>Login</v-toolbar-title>
          <v-spacer></v-spacer>
        </v-toolbar>
        <v-card-text>
          <v-form>
            <v-text-field label="Email" name="email" prepend-icon="mdi-email-outline" type="text" v-model="user.email"/>
            <v-text-field id="password" label="Password" name="password" prepend-icon="mdi-eye-off" type="password" v-model="user.password"/>
            <div class="text-center">
              <v-btn @click="login" color="primary" large outlined>Login</v-btn>
            </div>
          </v-form>
        </v-card-text>
      </v-card>
    </v-col>
  </v-row>
</template>


<script>
  export default {
    data () {
      return {
        user: {
          email: "",
          password: ""
        }
      }
    },
    methods: {
      login() {
        this.axios.post("/api/sign_in", { user: this.user }).then(res => {
          const user = res["data"]
          this.$store.commit('set-user', user)
          this.$router.push({ name: 'calendar' })
          this.$eventHub.$emit('show-snackbar', { body: 'ログインに成功しました'})
        }).catch(err => {
          this.$eventHub.$emit('show-snackbar', { body: err, color: 'error'})
        })
      }
    }
  }
</script>
