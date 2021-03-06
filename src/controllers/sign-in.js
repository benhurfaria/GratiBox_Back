import { connection } from '../database.js';
import bcrypt from 'bcrypt';
import { v4 as uuid } from 'uuid';
import { signInSchema } from '../schemas/userSchema.js';

async function signIn(req, res) {
  const validate = signInSchema.validate(req.body);

  if (validate.error) {
    res.sendStatus(400);
    return;
  }

  const { email, password } = req.body;

  try {
    const user = await connection.query(
      `
            SELECT * FROM users WHERE email = $1;
        `,
      [email]
    );
    
    if (user.rowCount === 0) {
      res.sendStatus(401);
      return;
    }
   
    const encryptedPassword = user.rows[0].password;

    if (!bcrypt.compareSync(password, encryptedPassword)) {
      res.sendStatus(401);
      return;
    }

    const token = uuid();
    const name = user.rows[0].name;
    const id = user.rows[0].id;
    await connection.query(
      `
            INSERT INTO sessions ("idUser", token) VALUES ($1, $2);
        `,
      [id, token]
    );
    const promise = await connection.query(
      `
      SELECT "userServices"."signDate", services.name AS nameplan FROM "userServices" JOIN services ON "userServices"."idServices" = services.id WHERE "userServices"."idUser" = $1;
    `,
      [id]
    );
    
    if (promise.rowCount === 0) {
      res.status(200).send({
        id,
        token,
        name,
        services: null,
      });
      return;
    }
    res.status(200).send({
      id,
      token,
      name,
      services: promise.rows[0],
    });
  } catch (error) {
    res.status(500).send({ message: 'falhou' });
  }
}

export { signIn };
