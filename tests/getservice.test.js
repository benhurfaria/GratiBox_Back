import supertest from 'supertest';
import bcrypt from 'bcrypt';
import '../src/setup.js';
import app from '../src/app.js';
import { connection } from '../src/database.js';
import { validBodyFactorySignup } from '../src/factories/signup.factory.js';

afterAll(async () => {
  connection.end();
});
const validBody = validBodyFactorySignup();
const password1 = bcrypt.hashSync(validBody.password, 10);
beforeAll(async () => {
  await connection.query(
    `INSERT INTO users (name, email, password) VALUES ($1, $2, $3);`,
    [validBody.name, validBody.email, password1]
  );
});
describe('POST /userServices', () => {
  test('returns 401 when there is no account email', async () => {
    const result = await connection.query(
      `SELECT * FROM users WHERE email = $1;`,
      [validBody.email]
    );
    const anotherBody = {
      id: result.rows[0].id,
      plano: 'mensal',
      dataEntrega: '01',
      produto: 'cha ',
      endEntrega: 'rua 145',
      cep: '74170080',
      cidade: 'goiania',
      estadouf: 'GO',
    };
    await supertest(app).post('/userServices').send(anotherBody);
    const body = {
      id: result.rows[0].id,
    };
    const xablau = await supertest(app).post('/getservice').send(body);

    expect(xablau.status).toEqual(200);
  });
});
