<script>
export default {
  props: {
    name: {
      default: '',
      required: true,
      type: String,
    },
    disabled: {
      default: false,
      required: false,
      type: Boolean,
    },
  },

  computed: {
    enabled() {
      return this.$store.state.featureFlags.enabledFeatures[this.name] !== this.disabled;
    },
  },

  render() {
    return this.enabled ? this.$slots.default : null;
  },
};
</script>
