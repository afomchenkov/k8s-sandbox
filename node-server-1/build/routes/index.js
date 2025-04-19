"use strict";
import { Type } from "@sinclair/typebox";
const routes = async (server) => {
  server.get("/", {
    schema: {
      response: {
        200: Type.Object({
          hello: Type.String()
        })
      }
    }
  }, async function() {
    return { hello: "world" };
  });
};
export default routes;
