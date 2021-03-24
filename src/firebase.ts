import { collection, getFirestore } from 'firebase/firestore/lite';

import { getAuth } from 'firebase/auth';
import { initializeApp } from 'firebase/app';
import firebaseConfig from './.firebaseConfig';

const app = initializeApp(firebaseConfig);

// utils
const db = getFirestore(app);
const auth = getAuth(app);

// collection references
const usersCollection = collection(db, 'users');

// export utils/refs
export {
  db,
  auth,
  usersCollection,
};
