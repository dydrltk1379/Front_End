import { defineStore } from "pinia";
import { ref } from 'vue';

export const useMemberStore = defineStore("Member", () => {
    const member_id = ref("kimmulti");
    const member_pw = ref("1234");
    const member_name = ref("kim");
    const member_addr = ref("kangnam");
    const member_tel = ref("010");

    return { member_id, member_pw, member_name, member_addr, member_tel};
});