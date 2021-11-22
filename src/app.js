import express from 'express';
import cors from 'cors';
import { signUp } from './controllers/sign-up.js';
import { signIn } from './controllers/sign-in.js';
import { userService } from './controllers/userServices.js';
import { getService } from './controllers/getServices.js';

const app = express();
app.use(cors());
app.use(express.json());

app.post('/sign-up', signUp);
app.post('/sign-in', signIn);
app.post('/userServices', userService);
app.post('/getservice', getService);

export default app;
