import { connection } from '../database.js';

async function getService(req, res){
    const { id } = req.body;

    try {
        const services = await connection.query(
            `
            SELECT "userServices"."signDate", services.name AS nameplan FROM "userServices" JOIN services ON "userServices"."idServices" = services.id WHERE "userServices"."idUser" = $1;
        `,[id]);

        const products = await connection.query(`
          SELECT products.name AS "productName" FROM "userServices" JOIN "userServicesProducts" ON "userServices".id = "userServicesProducts"."idUserProducts" JOIN products ON "userServicesProducts"."idProducts" = products.id WHERE "userServices"."idUser" = $1;
        `, [id]);

        const delivery = await connection.query(`
        SELECT "deliveryDate" FROM adress WHERE "idUser" = $1;
        `, [id]);

        return res.status(200).send({
            services: services.rows[0],
            products: products.rows,
            deliveryDate: delivery.rows[0].deliveryDate,
        });
    } catch (err) {
        res.sendStatus(500);
    }
}

export { getService };
