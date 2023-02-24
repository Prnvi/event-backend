import { response } from "express";
import { pool } from "../db/db.mjs";

export const register = async (req,res) => {

console.log('register');
try {
    console.log(req.body,"register");
    const { email , password} = req.body;
    const newEntry = await pool.query('INSERT INTO login (email, password) VALUES ($1, $2)', [email, password]
      );
      res.send(req.body)
} catch (err) {
        console.error(err)
        return res.status(500).send({error:"internal server error"})
    }

}
