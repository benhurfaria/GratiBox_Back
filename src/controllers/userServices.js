import { connection } from '../database.js';

async function userService(req, res) {
  const { plano, dataEntrega, produto, endEntrega, cep, cidade, estadouf, id } =
    req.body;
  const produtos = produto.split(' ');
  const idServices = plano === 'semanal' ? 1 : 2;
  try {
    await connection.query(
      `
        INSERT INTO "userServices" ("idUser", "idServices", "signDate") VALUES ($1, $2, NOW());
      `,
      [id, idServices]
    );
    const promise = await connection.query(`
        SELECT * FROM "userServices" ORDER BY id;
      `);
    const idUserProducts = promise.rows[promise.rowCount - 1].id;
    produtos.forEach(async (prod) => {
      if (prod === 'cha') {
        await connection.query(
          `
                INSERT INTO "userServicesProducts" ("idProducts", "idUserProducts") VALUES (1, $1);
              `,
          [idUserProducts]
        );
      }
      if (prod === 'produtos') {
        await connection.query(
          `
                INSERT INTO "userServicesProducts" ("idProducts", "idUserProducts") VALUES (3, $1);
              `,
          [idUserProducts]
        );
      }
      if (prod === 'incensos') {
        await connection.query(
          `
                INSERT INTO "userServicesProducts" ("idProducts", "idUserProducts") VALUES (2, $1);
              `,
          [idUserProducts]
        );
      }
    });
    await connection.query(
      `
        INSERT INTO adress ("Uf", city, cep, "idUser", "adress", "deliveryDate") VALUES ($1, $2, $3, $4, $5, $6);
      `,
      [estadouf, cidade, cep, id, endEntrega, dataEntrega]
    );
    res.sendStatus(200);
  } catch (err) {
    console.log(err);
    res.Status(500).send(err);
  }
}

export { userService };
