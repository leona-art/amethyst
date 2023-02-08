<script>
  import { goto } from "$app/navigation";
  import { page } from "$app/stores";
  import { onMount } from "svelte";
  import Account from "./Account.svelte";
  import Auth from "./Auth.svelte";

  // onMount(() => {
  //   if (!$page.data.session) {
  //     goto("/login");
  //   }
  // });
</script>

<h1>Home</h1>
