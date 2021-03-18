import firebase from 'firebase/app';
import 'firebase/auth';
import 'firebase/firestore';
import firebaseConfig from './.firebaseConfig';

const app = firebase.initializeApp(firebaseConfig);

// utils
const db = app.firestore();
const auth = app.auth();

// collection references
const usersCollection = db.collection('users');

// export utils/refs
export {
  db,
  auth,
  usersCollection,
};
