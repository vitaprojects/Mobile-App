import * as functions from 'firebase-functions';
import * as admin from 'firebase-admin'


// // Start writing Firebase Functions
// // https://firebase.google.com/docs/functions/typescript
//
admin.initializeApp();

export const sendNotification = functions.firestore.document('Chats/{messageId}').onCreate(async (snap, context) => {

    const snapsRef = await admin.firestore().collection('users').where('email', '==', snap.data().receiveremail).get();

    snapsRef.docs.forEach(async (elem) => {

        const payload = {
            notification: { body: snap.data().message, title: 'New Message From ' + elem.data().fname },
            data: {
                'view': 'message_noti',
            },
            tokens: elem.data().deviceIds,
        };


        admin.messaging().sendMulticast(payload).then((_) => {
            console.info('notification sent successfullt');
        }).catch((e) => {
            console.error('cannot send notficatio', e);
        })



    });




});
export const getClientSecret = functions.https.onCall((data, context) => {
    return {
        secretKey: 'sk_test_QlK20L7smKFDri5myFa66pDM00IPlTVzqS',

    };
});