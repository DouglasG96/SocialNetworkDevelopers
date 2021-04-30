import { HubConnectionBuilder, LogLevel } from "@aspnet/signalr";
export default {
  install(Vue) {
    const connection = new HubConnectionBuilder()
      //.withUrl(`https://webapidaf20200717155403.azurewebsites.net/question-hub`)//Url de WebApiDaf a donde estaremos escuchando SignalR
        .withUrl(`http://localhost:50886/publication-hub`) //Url de dashboardapi a donde estaremos escuchando SignalR
      .configureLogging(LogLevel.Information)
      .build();

    let startedPromise = null;
    function start() {
      startedPromise = connection.start().catch((err) => {
        console.error("Error Conectando con Hub", err);
        return new Promise((resolve, reject) =>
          setTimeout(
            () =>
              start()
                .then(resolve)
                .catch(reject),
            5000
          )
        );
      });
      return startedPromise;
    }
    connection.onclose(() => start());

    start();
    // creamos nueva instancia de Vue
        const apihub = new Vue();
    // cualquier componente podrá accerder a esta instancia mediante la variable this.$dashboardhub
        Vue.prototype.$apihub = apihub;

        connection.on("NewPublication", (data) => {
        apihub.$emit("info-publication", { data });
    });
  },
};
