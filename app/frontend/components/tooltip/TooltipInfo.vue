<template>
  <i
    class="material-icons tooltipped"
    data-position="bottom"
    :data-tooltip="message"
    >help</i
  >
</template>

<script>
import { onMounted } from 'vue'

export default {
  name: 'TooltipInfo',
  props: {
    message: {
      type: String,
      required: true
    },
  },
  setup() {
    onMounted(() => {
      const tooltip = document.querySelector('.tooltipped')
      M.Tooltip.init(tooltip);
    })
  }
}
</script>

<style lang="scss" scoped>
.tooltip-info {
  display: inline-flex;
}
</style>