<script lang="ts">
  import { supabase } from "$lib/supabaseClient";
  import { goto, invalidate } from "$app/navigation";
  import { onMount } from "svelte";
  import { page } from "$app/stores";
  import "./style.css";
  import Auth from "./Auth.svelte";
  import { dev } from "$app/environment";

  onMount(() => {
    const {
      data: { subscription },
    } = supabase.auth.onAuthStateChange(() => {
      invalidate("supabase:auth");
    });
    return () => {
      subscription.unsubscribe();
    };
  });
</script>

<!-- セッションが存在する場合。開発環境時はログインなし -->
{#if $page.data.session || dev}
  <div class="container" style="padding: 50px 0 100px 0">
    <slot />
  </div>
  <!-- リクエストが成功し、かつ、セッションが存在しない場合。 -->
{:else if $page.status == 200}
  <Auth />
  <!-- リクエストエラーの時 -->
{:else}
  <slot />
{/if}
