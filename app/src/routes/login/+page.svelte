<script lang="ts">
  export let data: {
    user: string;
    pass: string;
  };
</script>

<div>
  <form method="post">
    <label>
      user
      <input name="user" />
    </label>
    <label>
      password
      <input type="password" name="password" />
    </label>
    <button>login</button>
  </form>
  <p>{data.user}</p>
  <p>{data.pass}</p>
</div>

<style>
  form {
    margin-left: auto;
    margin-right: auto;
  }
</style>
