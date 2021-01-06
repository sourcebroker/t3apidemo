<script lang="ts">
import { Component, Vue } from 'vue-property-decorator';
import VueRouter from 'vue-router';


@Component
export default class BaseComponent
    extends Vue
{

    public static MOUNT_ON = null;

    protected componentId : string;

    public created()
    {
        const uid = 100000000000 + Math.round(Math.random() * 899999999999);
        this.componentId = 'uid' + uid;
    }

}
</script>
