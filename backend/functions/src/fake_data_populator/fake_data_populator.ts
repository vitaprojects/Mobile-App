import { firestore, auth } from "firebase-admin";
import * as faker from "faker";
export class FakeDataPopulator {
  firestore: firestore.Firestore;
  auth: auth.Auth;

  constructor(firestore: firestore.Firestore, auth: auth.Auth) {
    this.firestore = firestore;
    this.auth = auth;
  }
  async generateFakeData(): Promise<void> {
    log("generating fake data");
    const generateDocument = await this.getGenerateDocument().get();

    if (!generateDocument.exists) {
      await this.createGenerateDocument();
      await this.generatePostmanDocs();
      
    }
  }
  private getGenerateDocument(): firestore.DocumentReference {
    return this.firestore.collection("data").doc("generate");
  }

  private async createGenerateDocument(): Promise<void> {
    log("createGenerateDocument");
    await this.getGenerateDocument().set({});
  }

  private async generatePostmanDocs(): Promise<void> {
    for (let index = 0; index < 5; index++) {
    
      let id = faker.datatype.uuid();
      let cleaners = {
        fullName: faker.name.firstName(),
        completedOrders: 0,
        availableToWithdraw: 60,
        deviceIds: [],
        email: "test123@gmail.com",
        dataJoined: firestore.Timestamp.now(),
        hasSignedUpForNews: true,
        isAvailable: true,
        isNewUser: true,
        licenseNumber: faker.datatype.uuid(),
        phoneNumber: faker.phone.phoneNumber(),
        profileImage: faker.image.imageUrl(540, 540),
        rating: 5,
        rejectedOrders: 0,
        stripeId: "",
        totalCleared: 60,
        totalEarnings: 120,
        totalOrders: 0,
        totalRatedOrders: 0,
        userId: id,
        locationHash: {
          geohash: "tc0uuh7w6",
          geopoint: new firestore.GeoPoint(6.4844124, 79.98537950000002),
        },
      };
      await this.firestore.collection("users").doc("afsal20011@gmail.com").set(cleaners);
    }
  }
}

function log(message: string) {
  console.log(`FakeDataPopulator | ${message}`);
}
