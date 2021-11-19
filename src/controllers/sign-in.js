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
    console.log("EAI");
    const encryptedPassword = user.rows[0].password;

    if (!bcrypt.compareSync(password, encryptedPassword)) {
      res.sendStatus(401);
      return;
    }

    const token = uuid();
    console.log(token);
    await connection.query(
      `
            INSERT INTO sessions (userid, token) VALUES ($1, $2);
        `,
      [user.rows[0].id, token]
    );

    res.status(200).send({
      token,
    });
  } catch (error) {
    res.status(500).send({message: "falhou"});
  }
}

export { signIn };
