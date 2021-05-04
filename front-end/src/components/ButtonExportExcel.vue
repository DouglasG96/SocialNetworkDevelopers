<template>
  <download-excel
    :worksheet="myWorksheet"
    :name="myName"
    :data="myData"
    :export-fields="myExportFields"
  >
<q-btn round color="primary" icon="download" />
  </download-excel>
</template>



<script>
export default {
  props: {
    myWorksheet: String,
    myName: String,
    myData: {
      type: Array,
      default: () => [],
    },
    myExportFields: {
      type: Object,
      default: () => [],
    },

    created () {
        console.log(JSON.parse(JSON.stringify(this.myExportFields)));
    },
  },
};

</script>

<style lang="scss" scoped></style>
