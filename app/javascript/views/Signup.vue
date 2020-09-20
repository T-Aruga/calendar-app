<template>
  <v-row align="center" justify="center">
    <v-col cols="12" sm="8" md="4">
      <v-card class="elevation-12">
        <v-toolbar color="primary" dark flat>
          <v-spacer></v-spacer>
            <v-icon>mdi-account</v-icon>
            <v-toolbar-title class='ml-2'>Create Account</v-toolbar-title>
          <v-spacer></v-spacer>
        </v-toolbar>
        <v-card-text>
          <v-form>
            <v-text-field label="Name" name="name" prepend-icon="mdi-account-outline" type="text" v-model="user.name"/>
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
          name: "",
          email: "",
          password: ""
        }
      }
    },
    methods: {
      login() {
        const params = {
          user: this.user
        }
        this.axios.post("/api/user", params).then(res => {
          console.log(res)
        }).catch(err => {
          console.log(err)
        })
      }
    }
  }
</script>
