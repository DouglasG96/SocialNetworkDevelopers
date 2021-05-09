<template>
  <q-page class="q-pa-sm">
    <card-social />
  </q-page>
</template>

<script>
import IEcharts from "vue-echarts-v3/src/full.js";

export default {
  name: "Estadisticas",
  components: {
    IEcharts,
    CardSocial: () => import("components/cards/CardSocial")
  },
  data() {
    return {
      slide: 1,
    };
  },
  computed: {
    getSalesOptions() {
      return {
        tooltip: {
          trigger: "axis",
          axisPointer: {
            // Coordinate axis indicator, coordinate axis trigger is valid
            type: "shadow" // The default is a straight line, optional:'line' |'shadow'
          }
        },
        grid: {
          left: "2%",
          right: "2%",
          top: "4%",
          bottom: "3%",
          containLabel: true
        },
        xAxis: [
          {
            type: "category",
            data: ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]
          }
        ],
        yAxis: [
          {
            type: "value",
            splitLine: {
              show: false
            }
          }
        ],
        series: [
          {
            name: "Fashions",
            type: "bar",
            data: [40, 45, 27, 50, 32, 50, 70, 30, 30, 40, 67, 29],
            color: "#546bfa"
          },
          {
            name: "Electronics",
            type: "bar",
            data: [124, 100, 20, 120, 117, 70, 110, 90, 50, 90, 20, 50],
            color: "#3a9688"
          },
          {
            name: "Toys",
            type: "bar",
            data: [17, 2, 0, 29, 20, 10, 23, 0, 8, 20, 11, 30],
            color: "#02a9f4"
          },
          {
            name: "Vouchers",
            type: "bar",
            data: [20, 100, 80, 14, 90, 86, 100, 70, 120, 50, 30, 60],
            color: "#f88c2b"
          }
        ]
      };
    },
    getPieOptions() {
      return {
        tooltip: {
          trigger: "item",
          formatter: "{a} <br/>{b}: {c} ({d}%)"
        },
        legend: {
          bottom: 10,
          left: "center",
          data: ["Fashions", "Electronics", "Toys", "Vouchers"]
        },
        series: [
          {
            name: "Sales",
            type: "pie",
            radius: ["50%", "70%"],
            avoidLabelOverlap: false,
            label: {
              show: false,
              position: "center"
            },
            emphasis: {
              label: {
                show: false,
                fontSize: "30",
                fontWeight: "bold"
              }
            },
            labelLine: {
              show: false
            },
            data: [
              {
                value: 335,
                name: "Fashions",
                itemStyle: {
                  color: "#546bfa"
                }
              },
              {
                value: 310,
                name: "Electronics",
                itemStyle: {
                  color: "#3a9688"
                }
              },
              {
                value: 234,
                name: "Toys",
                itemStyle: {
                  color: "#02a9f4"
                }
              },
              {
                value: 135,
                name: "Vouchers",
                itemStyle: {
                  color: "#f88c2b"
                }
              }
            ]
          }
        ]
      };
    }
  },
  methods: {
    getColor(val) {
      if (val > 70 && val <= 100) {
        return "green";
      } else if (val > 50 && val <= 70) {
        return "blue";
      }
      return "red";
    },
    getChipColor(status) {
      if (status == "Canceled") {
        return "negative";
      } else if (status == "Sent") {
        return "positive";
      } else if (status == "Pending") {
        return "warning";
      } else if (status == "Paid") {
        return "info";
      } else {
        return "dark";
      }
    }
  }
};
</script>

<style scoped></style>
