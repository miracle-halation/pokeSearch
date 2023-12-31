// Import the functions you need from the SDKs you need
import { initializeApp } from "firebase/app";
import { getAuth } from "firebase/auth";

const firebaseConfig = {
  apiKey: process.env.POKESEARCH_FIREBASE_API_KEY,
  authDomain: process.env.POKESEARCH_FIREBASE_AUTH_DOMAIN,
  projectId: process.env.POKESEARCH_FIREBASE_PROJECT_ID,
  storageBucket: process.env.POKESEARCH_FIREBASE_STORAGE_BUCKET,
  messagingSenderId: process.env.POKESEARCH_FIREBASE_MESSAGING_SENDER_ID,
  appId: process.env.POKESEARCH_FIREBASE_APP_ID,
};

// Initialize Firebase
const app = initializeApp(firebaseConfig);

export const auth = getAuth(app);
