import type { Actions,Load } from "@sveltejs/kit"

export const load: Load =  () => {
    return {
        user: "user1",
        pass:"pass1"
    }
}

export const actions:Actions = {
    default: async ({cookies,request}) => {
        const data = await request.formData();
        console.log(data)
        console.log(data.get('user'), data.get('password'))
        return {
            user: "user2",
            pass:"pass2"
        }
    }
}