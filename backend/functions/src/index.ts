import { FunctionParser } from "firebase-backend";
import admin = require("firebase-admin");
import { FakeDataPopulator } from "./fake_data_populator/fake_data_populator";
admin.initializeApp();

if (process.env.FUNCTIONS_EMULATOR) {
  const firesotre = admin.firestore();
  const auth = admin.auth();
  console.log("Mode is in emulator");
  const fakedataPopulator = new FakeDataPopulator(firesotre, auth);
  fakedataPopulator.generateFakeData();
}
exports = new FunctionParser(__dirname, exports).exports;
